@implementation RemoteBundleLoader

- (void)_lookupFunctionAddresses:(_CSTypeRef)a3
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  uint64_t v6;
  uint64_t (**v7)(void *, const char *, const char *);
  uint64_t (**v8)(void *, const char *, const char *);
  $9A2394F8224BDCEDFD6C01971D282B2A *remoteFunctionAddresses;
  uint64_t v10;
  const char *v11;
  const char *v12;
  _QWORD v13[6];
  _QWORD aBlock[7];

  opaque_2 = a3._opaque_2;
  opaque_1 = a3._opaque_1;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_symbolLookupQueue);
  if (!self->_attemptedSymbolLookup)
  {
    self->_attemptedSymbolLookup = 1;
    dispatch_activate((dispatch_object_t)self->_injectionQueue);
    if ((CSIsNull() & 1) != 0 || !CSSymbolicatorGetSymbolOwnerCountAtTime())
    {
      self->_exited = 1;
    }
    else
    {
      v6 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_222B83C70;
      aBlock[3] = &unk_24EB2A858;
      aBlock[5] = opaque_1;
      aBlock[6] = opaque_2;
      aBlock[4] = self;
      v7 = (uint64_t (**)(void *, const char *, const char *))_Block_copy(aBlock);
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = sub_222B83FCC;
      v13[3] = &unk_24EB2A878;
      v13[4] = opaque_1;
      v13[5] = opaque_2;
      v8 = (uint64_t (**)(void *, const char *, const char *))_Block_copy(v13);
      remoteFunctionAddresses = self->_remoteFunctionAddresses;
      remoteFunctionAddresses->var2 = v7[2](v7, "mach_task_self_", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var3 = v7[2](v7, "mach_thread_self", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var4 = v7[2](v7, "mach_port_allocate", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var5 = v7[2](v7, "mach_port_mod_refs", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var6 = v7[2](v7, "mach_msg", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var7 = v7[2](v7, "thread_terminate", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var16 = v7[2](v7, "__syscall_logger", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var14 = v7[2](v7, "_platform_strlcpy", "libsystem_platform.dylib");
      remoteFunctionAddresses->var8 = v7[2](v7, "pthread_create_from_mach_thread", "libsystem_pthread.dylib");
      remoteFunctionAddresses->var9 = v7[2](v7, "pthread_detach", "libsystem_pthread.dylib");
      v10 = v8[2](v8, "pthread_self", "libsystem_pthread.dylib");
      remoteFunctionAddresses->var10 = v10;
      if (!v10)
        remoteFunctionAddresses->var10 = v7[2](v7, "_pthread_self", "libsystem_pthread.dylib");
      v11 = "libdyld.dylib";
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull())
        v11 = "dyld_sim";
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull())
        v12 = "dyld";
      else
        v12 = v11;
      remoteFunctionAddresses->var11 = v7[2](v7, "dlopen", v12);
      remoteFunctionAddresses->var12 = v7[2](v7, "dlsym", v12);
      remoteFunctionAddresses->var13 = v7[2](v7, "dlerror", v12);
      remoteFunctionAddresses->var15 = v7[2](v7, "sandbox_extension_consume", "libsystem_sandbox.dylib");

    }
  }
}

- (RemoteBundleLoader)initWithTask:(unsigned int)a3
{
  RemoteBundleLoader *v5;
  RemoteBundleLoader *v6;
  RemoteBundleLoader *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *helperLaunchPath;
  dispatch_queue_t v13;
  OS_dispatch_queue *symbolLookupQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *injectionQueue;
  OS_dispatch_queue *v19;
  uint64_t v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id releaseOpaqueSymbolicator;
  void *v27;
  NSObject *v28;
  int v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  RemoteBundleLoader *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD aBlock[6];
  _QWORD block[4];
  RemoteBundleLoader *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, int, __int128 *);
  void *v46;
  OS_dispatch_queue *v47;
  id v48;
  unsigned int v49;
  id location;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)RemoteBundleLoader;
  v5 = -[RemoteBundleLoader init](&v51, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_16;
  if (a3 - 1 < 0xFFFFFFFE)
  {
    v5->_targetTask = a3;
    if (!pid_for_task(a3, &v5->_targetPid))
    {
      v8 = (void *)MEMORY[0x24BDD1488];
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleForClass:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathForResource:ofType:", CFSTR("RemoteInjectionAgent"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      helperLaunchPath = v6->_helperLaunchPath;
      v6->_helperLaunchPath = (NSString *)v11;

      v6->_remoteFunctionAddresses = ($9A2394F8224BDCEDFD6C01971D282B2A *)malloc_type_calloc(1uLL, 0x88uLL, 0x1000040B5CA6940uLL);
      LODWORD(v10) = v6->_targetPid;
      if ((_DWORD)v10 == getpid())
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("RemoteBundleLoader.m"), 184, CFSTR("RemoteBundleLoader not intended for targeting calling process - use dlopen() instead"));

      }
      if (!v6->_helperLaunchPath)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("RemoteBundleLoader.m"), 185, CFSTR("Unable to locate RemoteInjectionAgent; built products likely corrupt"));

      }
      v13 = dispatch_queue_create("RemoteBundleLoader symbol lookup queue", 0);
      symbolLookupQueue = v6->_symbolLookupQueue;
      v6->_symbolLookupQueue = (OS_dispatch_queue *)v13;

      dispatch_queue_attr_make_initially_inactive(0);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = dispatch_queue_create_with_target_V2("RemoteBundleLoader injection queue", v16, (dispatch_queue_t)v6->_symbolLookupQueue);
      injectionQueue = v6->_injectionQueue;
      v6->_injectionQueue = (OS_dispatch_queue *)v17;

      objc_initWeak(&location, v6);
      v19 = v6->_symbolLookupQueue;
      v20 = MEMORY[0x24BDAC760];
      v43 = MEMORY[0x24BDAC760];
      v44 = 3221225472;
      v45 = sub_222B843B0;
      v46 = &unk_24EB2A8C8;
      v21 = v19;
      v47 = v21;
      v49 = a3;
      objc_copyWeak(&v48, &location);
      v22 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
      v24 = v23;
      if (CSIsNull())
      {
        v25 = v6->_symbolLookupQueue;
        block[0] = v20;
        block[1] = 3221225472;
        block[2] = sub_222B84538;
        block[3] = &unk_24EB27E30;
        v42 = v6;
        dispatch_sync(v25, block);
        releaseOpaqueSymbolicator = v42;
      }
      else
      {
        aBlock[0] = v20;
        aBlock[1] = 3221225472;
        aBlock[2] = sub_222B84548;
        aBlock[3] = &unk_24EB2A8E8;
        aBlock[4] = v22;
        aBlock[5] = v24;
        v27 = _Block_copy(aBlock);
        releaseOpaqueSymbolicator = v6->_releaseOpaqueSymbolicator;
        v6->_releaseOpaqueSymbolicator = v27;
      }

      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v28 = v6->_symbolLookupQueue;
      v33[0] = v20;
      v33[1] = 3221225472;
      v33[2] = sub_222B84554;
      v33[3] = &unk_24EB29678;
      v35 = &v36;
      v6 = v6;
      v34 = v6;
      dispatch_sync(v28, v33);
      v29 = *((unsigned __int8 *)v37 + 24);
      if (*((_BYTE *)v37 + 24))
      {

        v6 = 0;
      }

      _Block_object_dispose(&v36, 8);
      objc_destroyWeak(&v48);

      objc_destroyWeak(&location);
      if (v29)
        goto LABEL_5;
LABEL_16:
      v6 = v6;
      v7 = v6;
      goto LABEL_17;
    }
  }

  v6 = 0;
LABEL_5:
  v7 = 0;
LABEL_17:

  return v7;
}

- (void)dealloc
{
  void (**releaseOpaqueSymbolicator)(id, SEL);
  id v4;
  $9A2394F8224BDCEDFD6C01971D282B2A *remoteFunctionAddresses;
  NSObject *injectionQueue;
  objc_super v7;

  releaseOpaqueSymbolicator = (void (**)(id, SEL))self->_releaseOpaqueSymbolicator;
  if (releaseOpaqueSymbolicator)
  {
    releaseOpaqueSymbolicator[2](releaseOpaqueSymbolicator, a2);
    v4 = self->_releaseOpaqueSymbolicator;
    self->_releaseOpaqueSymbolicator = 0;

  }
  remoteFunctionAddresses = self->_remoteFunctionAddresses;
  if (remoteFunctionAddresses)
  {
    free(remoteFunctionAddresses);
    self->_remoteFunctionAddresses = 0;
  }
  if (!self->_attemptedSymbolLookup)
  {
    injectionQueue = self->_injectionQueue;
    if (injectionQueue)
      dispatch_activate(injectionQueue);
  }
  v7.receiver = self;
  v7.super_class = (Class)RemoteBundleLoader;
  -[RemoteBundleLoader dealloc](&v7, sel_dealloc);
}

- (void)scheduleLibraryLoad:(id)a3 calling:(id)a4 arguments:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *injectionQueue;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  id v43;
  id v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  RemoteBundleLoader *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id obj;
  _QWORD block[5];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void (**v77)(_QWORD, _QWORD);
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD callback[4];
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  _OWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileExistsAtPath:", v10);

    if ((v16 & 1) != 0)
    {
      if (v11)
      {
        *(_OWORD *)task_info_out = 0u;
        v80 = 0u;
        task_info_outCnt = 8;
        v17 = task_info(self->_targetTask, 0xFu, task_info_out, &task_info_outCnt);
        if ((_DWORD)v17)
        {
          if (v14)
          {
            v18 = (void *)MEMORY[0x24BDD1540];
            v91 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to audit target sandbox: %d (target %d likely exited)"), v17, self->_targetPid);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("RemoteBundleLoaderError"), 1, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v14)[2](v14, v21);

          }
          v22 = (void *)MEMORY[0x24BDBD1A8];
          goto LABEL_22;
        }
        v93 = *(_OWORD *)task_info_out;
        v94 = v80;
        v37 = v10;
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringByResolvingSymlinksInPath");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringByDeletingLastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_retainAutorelease(v37);
        v42 = (const char *)objc_msgSend(v41, "UTF8String");
        callback[0] = MEMORY[0x24BDAC760];
        callback[1] = 3221225472;
        callback[2] = sub_222B854A8;
        callback[3] = &unk_24EB2A9B0;
        v43 = v41;
        v86 = v43;
        v68 = v40;
        v87 = v68;
        v44 = v38;
        v88 = v44;
        v45 = macho_for_each_slice(v42, callback);
        v69 = v43;
        v67 = v44;
        if (!v45)
          goto LABEL_27;
        v46 = (void *)MEMORY[0x24BDD1540];
        v104 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to iterate through the mach-o file at path: '%@': due to an error: %s"), v43, strerror(v45));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = v47;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("RemoteBundleLoaderError"), 0, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v50 = objc_retainAutorelease(v49);
          v22 = 0;
          v51 = v50;
        }
        else
        {
LABEL_27:
          v65 = self;
          v66 = v11;
          v50 = (id)objc_opt_new();
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          obj = v44;
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v82;
            while (2)
            {
              for (i = 0; i != v53; ++i)
              {
                if (*(_QWORD *)v82 != v54)
                  objc_enumerationMutation(obj);
                v56 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i));
                objc_msgSend(v56, "UTF8String");
                v102[0] = v93;
                v102[1] = v94;
                v57 = sandbox_extension_issue_file_to_process();
                if (!v57)
                {
                  v60 = (void *)MEMORY[0x24BDD1540];
                  v101 = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to issue sandbox extension for path: %@"), v56);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)&v102[0] = v61;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("RemoteBundleLoaderError"), 2, v62);
                  v51 = (id)objc_claimAutoreleasedReturnValue();

                  v22 = 0;
                  goto LABEL_37;
                }
                v58 = (void *)v57;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v57);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "addObject:", v59);

                free(v58);
              }
              v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
              if (v53)
                continue;
              break;
            }
          }

          v50 = v50;
          v51 = 0;
          v22 = v50;
LABEL_37:
          v11 = v66;
          self = v65;
        }

        v63 = v51;
        if (v63)
        {
          v64 = v63;
          ((void (**)(_QWORD, id))v14)[2](v14, v63);

          goto LABEL_22;
        }
LABEL_12:
        DVTLaunchHelperProcess(self->_helperLaunchPath, self->_targetPid, 0, self->_targetTask);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(v28, "resume");
          injectionQueue = self->_injectionQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_222B84DEC;
          block[3] = &unk_24EB2A938;
          block[4] = self;
          v77 = v14;
          v72 = v10;
          v73 = v22;
          v74 = v11;
          v75 = v12;
          v76 = v29;
          dispatch_async(injectionQueue, block);

        }
        else if (v14)
        {
          v33 = (void *)MEMORY[0x24BDD1540];
          v89 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to launch RemoteInjectionAgent"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v34;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RemoteBundleLoaderError"), 2, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v14)[2](v14, v36);

        }
        goto LABEL_22;
      }
      if (v14)
      {
        v23 = (void *)MEMORY[0x24BDD1540];
        v95 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No function specified"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v22;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = &v96;
        v26 = &v95;
        goto LABEL_18;
      }
    }
    else
    {
      v27 = objc_retainAutorelease(v10);
      objc_msgSend(v27, "UTF8String");
      if (_dyld_shared_cache_real_path())
      {
        v22 = (void *)MEMORY[0x24BDBD1A8];
        goto LABEL_12;
      }
      if (v14)
      {
        v23 = (void *)MEMORY[0x24BDD1540];
        v97 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No dylib found at path: %@"), v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v22;
        v24 = (void *)MEMORY[0x24BDBCE70];
        v25 = &v98;
        v26 = &v97;
        goto LABEL_18;
      }
    }
  }
  else if (v13)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v99 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No dylib path specified"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v22;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = &v100;
    v26 = &v99;
LABEL_18:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("RemoteBundleLoaderError"), 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v32);

LABEL_22:
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingSymbolError, 0);
  objc_storeStrong((id *)&self->_injectionQueue, 0);
  objc_storeStrong((id *)&self->_symbolLookupQueue, 0);
  objc_storeStrong((id *)&self->_helperLaunchPath, 0);
  objc_storeStrong(&self->_releaseOpaqueSymbolicator, 0);
}

@end
