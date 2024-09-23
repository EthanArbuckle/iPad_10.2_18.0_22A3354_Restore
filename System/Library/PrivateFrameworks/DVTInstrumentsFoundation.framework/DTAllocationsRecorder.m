@implementation DTAllocationsRecorder

- (DTAllocationsRecorder)init
{
  DTAllocationsRecorder *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *processingQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialEventQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTAllocationsRecorder;
  v2 = -[DTAllocationsRecorder init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Allocations processing queue", 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("Allocations send queue", 0);
    serialEventQueue = v2->_serialEventQueue;
    v2->_serialEventQueue = (OS_dispatch_queue *)v5;

    v2->_stopCollection = 1;
  }
  return v2;
}

- (void)dealloc
{
  DTAllocationsRecorder *begin_node;
  DTAllocationsRecorder *serialEventQueue;
  DTXSharedMemory *shmem;
  $D79576B0EA7C5703A726781FA3D9E9B9 **opaque_1;
  BOOL v7;
  DTXSharedMemory *v8;
  DTAllocationsRecorder *v9;
  OS_dispatch_queue *processingQueue;
  $D79576B0EA7C5703A726781FA3D9E9B9 *partialEvent;
  $D79576B0EA7C5703A726781FA3D9E9B9 *fullEvent;
  objc_super v13;

  -[DTAllocationsRecorder cancel](self, "cancel");
  begin_node = (DTAllocationsRecorder *)self->_threadToKeyFramesMap.__tree_.__begin_node_;
  if (begin_node != (DTAllocationsRecorder *)&self->_threadToKeyFramesMap.__tree_.__pair1_)
  {
    do
    {
      serialEventQueue = (DTAllocationsRecorder *)begin_node->_serialEventQueue;
      if (serialEventQueue != (DTAllocationsRecorder *)&begin_node->_partialEvent)
      {
        do
        {
          free(serialEventQueue->_serialEventQueue);
          shmem = serialEventQueue->_shmem;
          if (shmem)
          {
            do
            {
              opaque_1 = ($D79576B0EA7C5703A726781FA3D9E9B9 **)shmem;
              shmem = (DTXSharedMemory *)shmem->var0;
            }
            while (shmem);
          }
          else
          {
            do
            {
              opaque_1 = ($D79576B0EA7C5703A726781FA3D9E9B9 **)serialEventQueue->_trackingSymbolicator._opaque_1;
              v7 = *opaque_1 == ($D79576B0EA7C5703A726781FA3D9E9B9 *)serialEventQueue;
              serialEventQueue = (DTAllocationsRecorder *)opaque_1;
            }
            while (!v7);
          }
          serialEventQueue = (DTAllocationsRecorder *)opaque_1;
        }
        while (opaque_1 != &begin_node->_partialEvent);
      }
      v8 = begin_node->_shmem;
      if (v8)
      {
        do
        {
          v9 = (DTAllocationsRecorder *)v8;
          v8 = (DTXSharedMemory *)v8->var0;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (DTAllocationsRecorder *)begin_node->_trackingSymbolicator._opaque_1;
          v7 = v9->super.isa == (Class)begin_node;
          begin_node = v9;
        }
        while (!v7);
      }
      begin_node = v9;
    }
    while (v9 != (DTAllocationsRecorder *)&self->_threadToKeyFramesMap.__tree_.__pair1_);
  }
  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  partialEvent = self->_partialEvent;
  if (partialEvent)
    free(partialEvent);
  fullEvent = self->_fullEvent;
  if (fullEvent)
    free(fullEvent);
  v13.receiver = self;
  v13.super_class = (Class)DTAllocationsRecorder;
  -[DTAllocationsRecorder dealloc](&v13, sel_dealloc);
}

+ (unsigned)allEventsMask
{
  int v3;
  int v4;

  v3 = objc_msgSend(a1, "vmEventsMask");
  v4 = objc_msgSend(a1, "retainReleaseAutoEventsMask") | v3;
  return v4 | objc_msgSend(a1, "mallocReallocFreeEventsMask");
}

+ (unsigned)vmEventsMask
{
  return 1333788672;
}

+ (unsigned)retainReleaseAutoEventsMask
{
  return 809562120;
}

+ (unsigned)mallocReallocFreeEventsMask
{
  return 854784;
}

+ (unsigned)zombieEventsMask
{
  return 0x200000;
}

+ (unsigned)cppClassNamesMask
{
  return 1049600;
}

+ (id)serviceIdentifier
{
  return CFSTR("com.apple.instruments.server.services.objectalloc");
}

+ (int)currentVersion
{
  return 5;
}

+ (id)_libraryPath
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("liboainject"), CFSTR("dylib"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DTAllocationsRecorder.mm"), 144, CFSTR("Allocations library could not be located! Expected in bundle with path: %@"), v8);

  }
  return v5;
}

+ (BOOL)configureLocalLaunchEnvironment:(id)a3 recordedEventsMask:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(v24, "setObject:forKey:", CFSTR("YES"), CFSTR("OAKeepAllocationStatistics"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, CFSTR("OAWaitForSetupByPid"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%x"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, CFSTR("OAAllocationStatisticsOutputMask"));

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NSZombieEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)v7)
    LODWORD(v4) = +[DTAllocationsRecorder zombieEventsMask](DTAllocationsRecorder, "zombieEventsMask") | v4;
  if ((+[DTAllocationsRecorder zombieEventsMask](DTAllocationsRecorder, "zombieEventsMask") & v4) != 0)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("NSZombieEnabled"));
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("MallocStackLogging"));
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("MallocStackLoggingNoCompact"));
  objc_msgSend(a1, "_libraryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DYLD_INSERT_LIBRARIES"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(":"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v23;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if ((v19 & 1) == 0)
          objc_msgSend(v11, "addObject:", v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  objc_msgSend(v11, "addObject:", v10);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(":"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, CFSTR("DYLD_INSERT_LIBRARIES"));

  return 1;
}

- (unint64_t)_setupSharedMemoryInTask:(unsigned int)a3
{
  mach_vm_address_t v3;
  unsigned int v6;
  uint64_t v7;
  DTXSharedMemory *v8;
  DTXSharedMemory *v9;
  vm_map_t *v10;
  vm_map_t v11;
  _QWORD *v12;
  vm_map_t v13;
  kern_return_t v14;
  mach_vm_address_t v15;
  mach_vm_size_t v16;
  kern_return_t v17;
  DTXSharedMemory *shmem;
  _QWORD v21[2];
  uint64_t (*v22)(uint64_t, DTXSharedMemory *);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  uint8_t buf[4];
  DTXSharedMemory *v32;
  __int16 v33;
  vm_map_t v34;
  __int16 v35;
  vm_prot_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (self->_shmem)
    return 0;
  self->_targetTask = a3;
  v6 = -[DTAllocationsRecorder sharedMemorySize](self, "sharedMemorySize");
  if (v6)
    v7 = v6;
  else
    v7 = 0x2000000;
  v8 = (DTXSharedMemory *)mmap(0, (v7 + 16463) & 0x1FFFFC000, 3, 4098, 167772160, 0);
  if (v8 == (DTXSharedMemory *)-1)
  {
LABEL_31:
    v3 = 0;
    self->_shmem = 0;
    return v3;
  }
  v9 = v8;
  v8->var0 = (v7 + 16463) & 0x1FFFFC000;
  v8->var1 = (unint64_t)v8;
  v8->var2 = 0;
  *(_QWORD *)&v8->var3 = 0;
  v8->var5 = 0;
  v8->var6 = v7;
  atomic_store(0, (unsigned int *)&v8->var10);
  atomic_store(0, (unsigned int *)&v8->var11);
  atomic_store(0, (unsigned int *)&v8->var12);
  atomic_store(0, (unsigned int *)&v8->var13);
  atomic_store(0, &v8->var9);
  atomic_store(getpid(), (unsigned int *)&v8->var7);
  atomic_store(0, (unsigned int *)&v9->var8);
  self->_shmem = v9;
  v10 = (vm_map_t *)MEMORY[0x24BDAEC58];
  if (a3 - 1 > 0xFFFFFFFD || (v11 = *MEMORY[0x24BDAEC58], (*MEMORY[0x24BDAEC58] - 1) >= 0xFFFFFFFE))
  {
LABEL_26:
    shmem = self->_shmem;
    if (shmem)
    {
      atomic_store(1u, &shmem->var9);
      if (shmem->var2)
      {
        if (!atomic_load((unsigned int *)&shmem->var8))
          shm_unlink((const char *)shmem + shmem->var2);
      }
      mach_vm_deallocate(*v10, (mach_vm_address_t)shmem, shmem->var0);
    }
    goto LABEL_31;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v22 = (uint64_t (*)(uint64_t, DTXSharedMemory *))sub_222B9606C;
  v23 = &unk_24EB2AF80;
  v24 = &v25;
  v12 = v21;
  if (mach_task_is_self(v11))
  {
    v22((uint64_t)v12, v9);
  }
  else
  {
    v13 = *v10;
    *(_QWORD *)cur_protection = 0;
    target_address = 0;
    v14 = mach_vm_remap(v13, &target_address, 0x50uLL, 0, 1048577, v11, (mach_vm_address_t)v9, 0, &cur_protection[1], cur_protection, 2u);
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v32 = v9;
        v33 = 1024;
        v34 = v11;
        v35 = 1024;
        v36 = v14;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
      }
      v15 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          v32 = v9;
          v33 = 1024;
          v34 = v11;
          v35 = 1024;
          v36 = cur_protection[1];
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
        }
        mach_vm_deallocate(v13, target_address, 0x50uLL);
      }
      v15 = target_address;
    }
    v22((uint64_t)v12, (DTXSharedMemory *)v15);
    mach_vm_deallocate(*v10, v15, 0x50uLL);
  }

  v16 = v26[3];
  if (!v16)
  {
LABEL_25:
    _Block_object_dispose(&v25, 8);
    goto LABEL_26;
  }
  *(_QWORD *)cur_protection = 0;
  target_address = 0;
  v17 = mach_vm_remap(a3, &target_address, v16, 0, 1048577, v11, (mach_vm_address_t)v9, 0, &cur_protection[1], cur_protection, 2u);
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v32 = v9;
      v33 = 1024;
      v34 = v11;
      v35 = 1024;
      v36 = v17;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    goto LABEL_25;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v32 = v9;
      v33 = 1024;
      v34 = v11;
      v35 = 1024;
      v36 = cur_protection[1];
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    mach_vm_deallocate(a3, target_address, v16);
  }
  v3 = target_address;
  _Block_object_dispose(&v25, 8);
  if (!v3)
    goto LABEL_26;
  return v3;
}

- (void)startAttachingToTask:(unsigned int)a3 recordedEventsMask:(unsigned int)a4 errorHandler:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  RemoteBundleLoader *v15;
  void *v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  _QWORD v29[2];
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD *v33;
  unint64_t v34;
  int v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  int x;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, int);
  void *v44;
  uint64_t *v45;
  const char *v46;
  _QWORD aBlock[4];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *(*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if ((v6 - 1) < 0xFFFFFFFE)
  {
    x = -1;
    if (pid_for_task(v6, &x))
    {
      if (v9)
      {
        sub_222B94840(CFSTR("Unable to determine pid for task"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v9)[2](v9, v10);
LABEL_21:

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    v11 = -[DTAllocationsRecorder _setupSharedMemoryInTask:](self, "_setupSharedMemoryInTask:", v6);
    if (!v11)
    {
      if (v9)
      {
        sub_222B94840(CFSTR("Couldn't map shared memory into target process"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v9)[2](v9, v10);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%#llx"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    v15 = -[RemoteBundleLoader initWithTask:]([RemoteBundleLoader alloc], "initWithTask:", v6);
    if (v15)
    {
      +[DTAllocationsRecorder _libraryPath](DTAllocationsRecorder, "_libraryPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = sub_222B94924;
      v38[3] = &unk_24EB2AE18;
      v18 = v9;
      v39 = v18;
      -[RemoteBundleLoader scheduleLibraryLoad:calling:arguments:callback:](v15, "scheduleLibraryLoad:calling:arguments:callback:", v16, CFSTR("_OAAttachAndInitialize"), v10, v38);

      v37 = 0;
      v19 = -[DTAllocationsRecorder _startWithError:](self, "_startWithError:", &v37);
      v20 = v37;
      if (v19)
      {
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        v36[3] = 0;
        v29[0] = v17;
        v29[1] = 3221225472;
        v30 = sub_222B94980;
        v31 = &unk_24EB2AE68;
        v35 = v6;
        v33 = v36;
        v34 = v11;
        v32 = v18;
        v21 = v29;
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = sub_222B96084;
        v54 = sub_222B960AC;
        v55 = 0;
        aBlock[0] = v17;
        aBlock[1] = 3221225472;
        aBlock[2] = sub_222B960B4;
        aBlock[3] = &unk_24EB2AFA8;
        v22 = v21;
        v48 = v22;
        v49 = &v50;
        v23 = _Block_copy(aBlock);
        v24 = (void *)v51[5];
        v51[5] = (uint64_t)v23;

        v41 = v17;
        v42 = 3221225472;
        v43 = sub_222B960EC;
        v44 = &unk_24EB2AFD0;
        v45 = &v50;
        v46 = "liboainject.dylib";
        v25 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
        v27 = v26;
        if (CSIsNull())
          ((void (*)(_QWORD *, _QWORD, _QWORD))v30)(v22, 0, 0);
        _Block_object_dispose(&v50, 8);

        self->_trackingSymbolicator._opaque_1 = v25;
        self->_trackingSymbolicator._opaque_2 = v27;

        _Block_object_dispose(v36, 8);
      }
      else
      {
        (*((void (**)(id, id))v18 + 2))(v18, v20);
      }

      v28 = v39;
    }
    else
    {
      if (!v9)
      {
LABEL_20:

        goto LABEL_21;
      }
      sub_222B94840(CFSTR("Unable to instantiate loader for target."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v28);
    }

    goto LABEL_20;
  }
  if (v8)
  {
    sub_222B94840(CFSTR("Instruments could not acquire the necessary privileges to profile the target application."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v10);
    goto LABEL_21;
  }
LABEL_22:

}

- (BOOL)_startWithError:(id *)a3
{
  int stopCollection;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *processingQueue;
  _QWORD v14[5];
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  stopCollection = self->_stopCollection;
  if (stopCollection)
  {
    self->_stopCollection = 0;
    -[DTAllocationsRecorder bufferHandler](self, "bufferHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x24BDAC760];
    if (!v6)
    {
      -[DTAllocationsRecorder eventHandler](self, "eventHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_partialEvent = ($D79576B0EA7C5703A726781FA3D9E9B9 *)malloc_type_malloc(0x1030uLL, 0xD13C6C2FuLL);
      self->_fullEvent = ($D79576B0EA7C5703A726781FA3D9E9B9 *)malloc_type_malloc(0x1030uLL, 0x21D2C2D1uLL);
      aBlock[0] = v7;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_222B94E34;
      aBlock[3] = &unk_24EB2AE90;
      v9 = v8;
      aBlock[4] = self;
      v16 = v9;
      v17 = a2;
      v10 = _Block_copy(aBlock);
      -[DTAllocationsRecorder setBufferHandler:](self, "setBufferHandler:", v10);

    }
    processingQueue = self->_processingQueue;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = sub_222B95160;
    v14[3] = &unk_24EB2A030;
    v14[4] = self;
    dispatch_async(processingQueue, v14);
  }
  else if (a3)
  {
    sub_222B94840(CFSTR("Allocations recording already in process."));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return stopCollection != 0;
}

- (void)addKeyFrame:(id *)a3
{
  unint64_t var1_low;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *p_pair1;
  unint64_t var5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v8;
  unint64_t v9;
  BOOL v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **v11;
  _DWORD *v12;
  unsigned int var2;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v14;
  char *v15;
  char *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v17;
  unsigned int v18;
  BOOL v19;
  void **v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t v23[3];
  uint64_t *v24;
  _QWORD *v25[2];

  var1_low = LOBYTE(a3->var1);
  p_pair1 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_12;
  var5 = a3->var5;
  v8 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  do
  {
    v9 = (unint64_t)left[4].__value_.__left_;
    v10 = v9 >= var5;
    if (v9 >= var5)
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)left;
    else
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)&left[1];
    if (v10)
      v8 = left;
    left = *v11;
  }
  while (*v11);
  if (v8 != p_pair1 && (void *)var5 >= v8[4].__value_.__left_)
  {
    v16 = (char *)v8[6].__value_.__left_;
    v14 = v8 + 6;
    v15 = v16;
    if (!v16)
      goto LABEL_25;
    v17 = v14;
    do
    {
      v18 = *((_DWORD *)v15 + 8);
      v19 = v18 >= var1_low;
      if (v18 >= var1_low)
        v20 = (void **)v15;
      else
        v20 = (void **)(v15 + 8);
      if (v19)
        v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)v15;
      v15 = (char *)*v20;
    }
    while (*v20);
    if (v17 != v14 && var1_low >= LODWORD(v17[4].__value_.__left_))
    {
      v12 = v17[5].__value_.__left_;
    }
    else
    {
LABEL_25:
      v21 = (uint64_t **)&v14[-1];
      v12 = malloc_type_calloc(1uLL, 0x1010uLL, 0x10000408E8BD56EuLL);
      v22 = var1_low;
      v23[0] = (uint64_t)v12;
      sub_222B96504(v21, (unsigned int *)&v22, (uint64_t)&v22);
    }
  }
  else
  {
LABEL_12:
    v25[0] = 0;
    v25[1] = 0;
    v24 = (uint64_t *)v25;
    v12 = malloc_type_calloc(1uLL, 0x1010uLL, 0x10000408E8BD56EuLL);
    v22 = var1_low;
    v23[0] = (uint64_t)v12;
    sub_222B96504(&v24, (unsigned int *)&v22, (uint64_t)&v22);
    v22 = a3->var5;
    sub_222B961B0(v23, (uint64_t)&v24);
    sub_222B965C4((uint64_t)&p_pair1[-1], &v22, &v22);
    sub_222B964B4((uint64_t)v23, (_QWORD *)v23[1]);
    sub_222B964B4((uint64_t)&v24, v25[0]);
  }
  var2 = a3->var2;
  a3->var1 &= 0xFF0000FF;
  v12[2] = 512 - var2;
  memcpy(&v12[2 * (512 - var2) + 4], a3->var7, 8 * a3->var2);
}

- (void)createFullEventFromDelta:(id *)a3 withEvent:(id *)a4
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *left;
  unsigned int var1_low;
  unint64_t var5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v11;
  unint64_t v12;
  BOOL v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v15;
  char *v16;
  char *v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *v18;
  unsigned int v19;
  BOOL v20;
  char **v21;
  _DWORD *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  v5 = left;
  if (left)
  {
    var1_low = LOBYTE(a3->var1);
    var5 = a3->var5;
    v11 = p_pair1;
    do
    {
      v12 = (unint64_t)v5[4].__value_.__left_;
      v13 = v12 >= var5;
      if (v12 >= var5)
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)v5;
      else
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)&v5[1];
      if (v13)
        v11 = v5;
      v5 = *v14;
    }
    while (*v14);
    if (v11 != p_pair1 && (void *)var5 >= v11[4].__value_.__left_)
    {
      v17 = (char *)v11[6].__value_.__left_;
      v15 = v11 + 6;
      v16 = v17;
      if (v17)
      {
        v18 = v15;
        do
        {
          v19 = *((_DWORD *)v16 + 8);
          v20 = v19 >= var1_low;
          if (v19 >= var1_low)
            v21 = (char **)v16;
          else
            v21 = (char **)(v16 + 8);
          if (v20)
            v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)v16;
          v16 = *v21;
        }
        while (*v21);
        if (v18 != v15 && var1_low >= LODWORD(v18[4].__value_.__left_))
        {
          v22 = v18[5].__value_.__left_;
          v22[2] = LOWORD(a3->var2);
          memcpy(&v22[2 * (unsigned __int16)a3->var2 + 4], a3->var7, ((unint64_t)a3->var2 >> 13) & 0x7FFF8);
          v23 = 512 - (int)v22[2];
          v24 = *(_OWORD *)&a3->var0;
          v25 = *(_OWORD *)&a3->var5;
          *(_OWORD *)&a4->var3 = *(_OWORD *)&a3->var3;
          *(_OWORD *)&a4->var5 = v25;
          *(_OWORD *)&a4->var0 = v24;
          memcpy(a4->var7, &v22[2 * v22[2] + 4], 8 * v23);
          a4->var1 &= 0xFF0000FF;
          a4->var2 = v23 & 0x1FFFFFFF;
        }
      }
    }
  }
}

- (void)processBufferMessage:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  DTAllocationsRecorder *v9;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B954E0;
  v7[3] = &unk_24EB2AEB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

- (void)stop
{
  MEMORY[0x24BEDD108](self, sel__endAndTossResources_);
}

- (void)cancel
{
  MEMORY[0x24BEDD108](self, sel__endAndTossResources_);
}

- (void)_endAndTossResources:(BOOL)a3
{
  int v3;
  NSObject *processingQueue;
  _QWORD block[5];

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  self->_stopCollection = v3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B955E8;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

- (int)eventCount
{
  return self->_eventTotal;
}

- (void)_processIncomingData
{
  DTAllocationsRecorder *v2;
  task_read_t targetTask;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  unsigned int *shmem;
  _QWORD *v11;
  int v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  signed int v18;
  signed int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  pid_t v25;
  useconds_t v26;
  int v27;
  signed int v28;
  size_t v30;
  size_t v31;
  unint64_t v32;
  BOOL v33;
  unint64_t v34;
  unsigned int v35;
  NSObject *serialEventQueue;
  _BYTE v37[4152];
  void *v38;
  NSObject *v39;
  DTAllocationsRecorder *v40;
  id v41;
  dispatch_semaphore_t v42;
  id v43;
  unsigned int v44;
  _QWORD block[4];
  _QWORD *v46;
  uint64_t *v47;
  _QWORD v48[2];
  void (*v49)(uint64_t, const void *, size_t, unsigned __int8 *);
  void *v50;
  DTAllocationsRecorder *v51;
  NSObject *v52;
  id v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  _BYTE *v57;
  task_suspension_token_t suspend_token[3];
  unsigned __int8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;

  v2 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  v38 = (void *)MEMORY[0x227679C5C](self, a2);
  -[DTAllocationsRecorder bufferHandler](v2, "bufferHandler");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (-[DTAllocationsRecorder readStackLogsUponAttach](v2, "readStackLogsUponAttach"))
  {
    targetTask = v2->_targetTask;
    if (targetTask + 1 >= 2)
    {
      MEMORY[0x24BDAC7A8]();
      bzero(v37, 0x1030uLL);
      suspend_token[0] = 0;
      task_suspend2(targetTask, suspend_token);
      v4 = MEMORY[0x24BDAC760];
      v5 = v2->_targetTask;
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = sub_222B95CA0;
      v55[3] = &unk_24EB2AEE0;
      v57 = v37;
      v56 = v43;
      v6 = v55;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3430]), "initWithTask:", v5);
      v60 = v4;
      v61 = 3221225472;
      v62 = (uint64_t)sub_222B964F4;
      v63 = &unk_24EB2AFF8;
      v8 = v6;
      v64 = v7;
      v65 = v8;
      v9 = v7;
      objc_msgSend(v9, "enumerateMSLRecordsAndPayloads:", &v60);

      task_resume2(suspend_token[0]);
    }
  }
  v60 = 0;
  v61 = (uint64_t)&v60;
  v62 = 0x2020000000;
  LOBYTE(v63) = 0;
  v42 = dispatch_semaphore_create(1);
  if (!v2->_stopCollection)
  {
    v40 = v2;
    do
    {
      shmem = (unsigned int *)v2->_shmem;
      if (!shmem)
        break;
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v49 = sub_222B95DC0;
      v50 = &unk_24EB2AF30;
      v51 = v2;
      v39 = v42;
      v52 = v39;
      v41 = v43;
      v53 = v41;
      v54 = &v60;
      v11 = v48;
      v12 = 0;
      v13 = shmem + 16;
      v14 = shmem[9];
      v15 = (uint64_t)shmem + shmem[8] + 80;
      v44 = v14 >> 2;
      v16 = 64;
      v17 = 128000000;
      while (1)
      {
        while (1)
        {
          v18 = atomic_load(shmem + 15);
          v19 = atomic_load(v13);
          v20 = v18 >= v19 ? 0 : v14;
          v21 = v20 + v18;
          v22 = atomic_load(shmem + 12);
          v23 = v22 | v12;
          v24 = v21 - v19;
          if (v21 == v19)
            break;
          v28 = v19;
          if ((v16 & 0xFFFE0000) != 0 || v24 > v44)
            v16 = 64;
          if (v14 - v19 >= v24)
            v30 = v24;
          else
            v30 = v14 - v19;
          v59 = 0;
          v49((uint64_t)v11, (const void *)(v15 + v19), v30, &v59);
          v31 = v24 - v30;
          if ((_DWORD)v31)
            v49((uint64_t)v11, (const void *)v15, v31, &v59);
          else
            LODWORD(v31) = v30 + v28;
          while (1)
          {
            v35 = __ldaxr(v13);
            if (v35 != v28)
              break;
            if (!__stlxr(v31, v13))
              goto LABEL_46;
          }
          __clrex();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            LOWORD(suspend_token[0]) = 0;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Inconsistent reader offset in shared memory! MT reception suspected...\n", (uint8_t *)suspend_token, 2u);
          }
LABEL_46:
          v12 = v59;
          if (v59)
          {
            atomic_store(1u, shmem + 12);
LABEL_50:
            v2 = v40;
LABEL_51:

            goto LABEL_52;
          }
          v17 = 128000000;
          if (v23)
            goto LABEL_50;
        }
        if (v23)
          goto LABEL_50;
        if (!v17)
          break;
        v25 = atomic_load(shmem + 11);
        if (v16 <= 0x40)
          v26 = 64;
        else
          v26 = v16;
        usleep(v26);
        v27 = 2 * v26;
        if (2 * v26 <= 0x20000)
        {
          v12 = 0;
        }
        else
        {
          v12 = v25 && kill(v25, 0) == -1 && *__error() == 3;
          v27 = 0x20000;
        }
        v32 = 1000 * v16;
        v33 = v17 >= v32;
        v34 = v17 - v32;
        if (v33)
          v17 = v34;
        else
          v17 = 0;
        v16 = v27;
      }

      v2 = v40;
      if (*(_BYTE *)(v61 + 24))
      {
        serialEventQueue = v40->_serialEventQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_222B95F88;
        block[3] = &unk_24EB2AF58;
        v46 = v41;
        v47 = &v60;
        dispatch_sync(serialEventQueue, block);
        v11 = v46;
        goto LABEL_51;
      }
LABEL_52:

    }
    while (!v2->_stopCollection);
  }

  _Block_object_dispose(&v60, 8);
  objc_autoreleasePoolPop(v38);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)bufferHandler
{
  return self->_bufferHandler;
}

- (void)setBufferHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)readStackLogsUponAttach
{
  return self->_readStackLogsUponAttach;
}

- (void)setReadStackLogsUponAttach:(BOOL)a3
{
  self->_readStackLogsUponAttach = a3;
}

- (unsigned)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (void)setSharedMemorySize:(unsigned int)a3
{
  self->_sharedMemorySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  sub_222B966EC((uint64_t)&self->_threadToKeyFramesMap, (_QWORD *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_serialEventQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  return self;
}

@end
