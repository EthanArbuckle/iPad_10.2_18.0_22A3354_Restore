@implementation DTKPKperfConfiguration

- (DTKPKperfConfiguration)init
{
  DTKPKperfConfiguration *v2;
  DTKPKperfConfiguration *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTKPKperfConfiguration;
  v2 = -[DTKPKperfConfiguration init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DTKPKperfConfiguration setCollectionMode:](v2, "setCollectionMode:", 2);
    v4 = objc_opt_new();
    v5 = (void *)*((_QWORD *)v3 + 4);
    *((_QWORD *)v3 + 4) = v4;

  }
  return v3;
}

- (id)apply
{
  std::mutex *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v11;
  id v12;
  void *v13;
  id *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  id *v21;
  id v22;
  void *v23;
  _QWORD v24[7];
  id v25;
  id obj;
  _QWORD aBlock[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *(*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = sub_222B30028;
  v46 = sub_222B30038;
  v47 = 0;
  -[DTKPKperfConfiguration _validateConfigLocked](self, "_validateConfigLocked");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v43[5];
  v43[5] = (id)v4;

  v6 = v43[5];
  if (!v6)
  {
    -[DTKPKperfConfiguration _reinitializeKperf](self, "_reinitializeKperf");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v43[5];
    v43[5] = (id)v7;

    v6 = v43[5];
    if (!v6)
    {
      -[DTKPKperfConfiguration bufferSize](self, "bufferSize");
      *((_QWORD *)self + 16) = (uint64_t)(int)kperf_logging_set_size() << 6;
      if (-[DTKPKperfConfiguration collectionMode](self, "collectionMode") - 1 <= 2)
        kperf_logging_set_wrap();
      -[DTKPKperfConfiguration _enableKdebugCodes](self, "_enableKdebugCodes");
      if (!*((_QWORD *)self + 1)
        || (-[DTKPKperfConfiguration _enableContextSwitchSampling](self, "_enableContextSwitchSampling"),
            v11 = objc_claimAutoreleasedReturnValue(),
            v12 = v43[5],
            v43[5] = (id)v11,
            v12,
            (v6 = v43[5]) == 0))
      {
        if (!objc_msgSend(*((id *)self + 14), "pmcEventCount"))
          goto LABEL_12;
        v13 = (void *)*((_QWORD *)self + 14);
        v14 = v43;
        v41 = v43[5];
        objc_msgSend(v13, "forceCounters:", &v41);
        objc_storeStrong(v14 + 5, v41);
        v15 = v43 + 5;
        v6 = v43[5];
        if (!v6)
        {
          v16 = (void *)*((_QWORD *)self + 14);
          v40 = 0;
          objc_msgSend(v16, "configureHardwareCounters:", &v40);
          objc_storeStrong(v15, v40);
          v6 = v43[5];
          if (!v6)
          {
LABEL_12:
            v34 = 0;
            v35 = &v34;
            v36 = 0x3032000000;
            v37 = sub_222B30028;
            v38 = sub_222B30038;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v39 = (id)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            v29 = &v28;
            v30 = 0x3032000000;
            v17 = MEMORY[0x24BDAC760];
            v31 = sub_222B30040;
            v32 = sub_222B30068;
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_222B30070;
            aBlock[3] = &unk_24EB28B30;
            aBlock[4] = &v34;
            v33 = _Block_copy(aBlock);
            v18 = (void *)*((_QWORD *)self + 2);
            if (v18)
            {
              v19 = v43;
              obj = v43[5];
              objc_msgSend(v18, "start:", &obj);
              objc_storeStrong(v19 + 5, obj);
              objc_msgSend((id)v35[5], "addObject:", *((_QWORD *)self + 2));
              if (v43[5])
                goto LABEL_16;
            }
            v20 = (void *)*((_QWORD *)self + 3);
            if (v20
              && (v21 = v43,
                  v25 = v43[5],
                  objc_msgSend(v20, "start:", &v25),
                  objc_storeStrong(v21 + 5, v25),
                  objc_msgSend((id)v35[5], "addObject:", *((_QWORD *)self + 3)),
                  v43[5]))
            {
LABEL_16:
              (*(void (**)(void))(v29[5] + 16))();
              v22 = v43[5];
            }
            else
            {
              if (!objc_msgSend(*((id *)self + 4), "count"))
                goto LABEL_20;
              v23 = (void *)*((_QWORD *)self + 4);
              v24[0] = v17;
              v24[1] = 3221225472;
              v24[2] = sub_222B3008C;
              v24[3] = &unk_24EB28B58;
              v24[4] = &v42;
              v24[5] = &v34;
              v24[6] = &v28;
              objc_msgSend(v23, "enumerateObjectsUsingBlock:", v24);
              v22 = v43[5];
              if (!v22)
              {
LABEL_20:
                v9 = 0;
                goto LABEL_21;
              }
            }
            v9 = v22;
LABEL_21:
            _Block_object_dispose(&v28, 8);

            _Block_object_dispose(&v34, 8);
            goto LABEL_4;
          }
        }
      }
    }
  }
  v9 = v6;
LABEL_4:
  _Block_object_dispose(&v42, 8);

  std::mutex::unlock(v3);
  return v9;
}

- (id)reset
{
  std::mutex *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v14;
  id v15;
  _QWORD v16[5];
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_222B30028;
  v22 = sub_222B30038;
  v23 = 0;
  v4 = (void *)*((_QWORD *)self + 14);
  obj = 0;
  objc_msgSend(v4, "unforceCounters:", &obj);
  objc_storeStrong(&v23, obj);
  v5 = (void *)*((_QWORD *)self + 4);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_222B302D0;
  v16[3] = &unk_24EB28B80;
  v16[4] = &v18;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  v6 = (void *)*((_QWORD *)self + 3);
  if (v6)
  {
    v7 = (id *)(v19 + 5);
    v15 = (id)v19[5];
    objc_msgSend(v6, "stop:", &v15);
    objc_storeStrong(v7, v15);
  }
  v8 = (void *)*((_QWORD *)self + 2);
  if (v8)
  {
    v9 = (id *)(v19 + 5);
    v14 = (id)v19[5];
    objc_msgSend(v8, "stop:", &v14);
    objc_storeStrong(v9, v14);
  }
  if (*((_QWORD *)self + 1))
  {
    -[DTKPKperfConfiguration _disableContextSwitchSampling](self, "_disableContextSwitchSampling");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v19[5];
    v19[5] = v10;

  }
  -[DTKPKperfConfiguration _disableKdebugCodes](self, "_disableKdebugCodes");
  kperf_reset();
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  std::mutex::unlock(v3);
  return v12;
}

- (NSArray)triggers
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)*((_QWORD *)self + 5);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)self + 5);
    *((_QWORD *)self + 5) = v4;

    if (*((_QWORD *)self + 4))
      objc_msgSend(*((id *)self + 5), "addObjectsFromArray:");
    if (*((_QWORD *)self + 3))
      objc_msgSend(*((id *)self + 5), "addObject:");
    v3 = (void *)*((_QWORD *)self + 5);
    if (*((_QWORD *)self + 2))
    {
      objc_msgSend(v3, "addObject:");
      v3 = (void *)*((_QWORD *)self + 5);
    }
  }
  return (NSArray *)v3;
}

- (unsigned)enabledKPCClasses
{
  std::mutex *v3;
  void *v4;
  unsigned int v5;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (void *)*((_QWORD *)self + 14);
  if (v4)
    v5 = objc_msgSend(v4, "kpcClasses");
  else
    v5 = 0;
  std::mutex::unlock(v3);
  return v5;
}

- (BOOL)hasEnabledKPCClasses
{
  return *((_QWORD *)self + 14) != 0;
}

- (id)counterAllocator
{
  void *v3;
  void *v4;
  id v5;
  DTKPCPUCounterAllocator *v6;
  id v7;
  void *v8;
  id v10;
  id v11;

  v3 = (void *)*((_QWORD *)self + 14);
  if (!v3)
  {
    v11 = 0;
    +[DTKPCPU localCPU:](DTKPCPU, "localCPU:", &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      v10 = v5;
      v6 = -[DTKPCPUCounterAllocator initWithCPU:error:]([DTKPCPUCounterAllocator alloc], "initWithCPU:error:", v4, &v10);
      v7 = v10;

      v8 = (void *)*((_QWORD *)self + 14);
      *((_QWORD *)self + 14) = v6;

      v5 = v7;
    }

    v3 = (void *)*((_QWORD *)self + 14);
  }
  return v3;
}

- (id)queryCounterAllocator
{
  return *((id *)self + 14);
}

- (void)addCodeSet:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;

  v5 = a3;
  v8 = (void *)*((_QWORD *)self + 1);
  v7 = (id *)((char *)self + 8);
  v6 = v8;
  v9 = v5;
  if (v8)
    objc_msgSend(v6, "addCodeSet:");
  else
    objc_storeStrong(v7, a3);

}

- (void)_enableKdebugCodes
{
  uint64_t v3;

  if (*((_QWORD *)self + 1))
  {
    kperf_logging_set_kdebug();
    v3 = objc_msgSend(*((id *)self + 1), "createFilterMask:", 0);
    kperf_logging_set_typefilter();
    +[DTKPKDebugCodeSet releaseFilterMask:](DTKPKDebugCodeSet, "releaseFilterMask:", v3);
  }
  else
  {
    kperf_logging_set_kdebug();
  }
}

- (DTKPKDebugCodeSet)queryCodeSet
{
  return (DTKPKDebugCodeSet *)*((id *)self + 1);
}

- (void)_disableKdebugCodes
{
  kperf_logging_set_kdebug();
}

- (id)_enableContextSwitchSampling
{
  void *v2;

  if (kperf_kdbg_cswitch_set())
  {
    sub_222B305D8(CFSTR("Context switch sampling couldn't be enabled."), -1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_disableContextSwitchSampling
{
  void *v2;

  if (kperf_kdbg_cswitch_set())
  {
    sub_222B305D8(CFSTR("Context switch sampling couldn't be disabled."), -1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)createTriggerKDebug:(id *)a3
{
  std::mutex *v5;
  void *v6;
  DTKPTriggerKDebug *v7;

  v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v6 = (void *)*((_QWORD *)self + 2);
  if (v6)
  {
    if (a3)
    {
      sub_222B305D8(CFSTR("A kdebug trigger already exists. DTKPKperfConfiguration doesn't support creation of multiple kdebug triggers."), -510);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)*((_QWORD *)self + 2);
    }
    v7 = v6;
  }
  else
  {
    v7 = -[DTKPTriggerKDebug initWithCounterAllocatorProvider:]([DTKPTriggerKDebug alloc], "initWithCounterAllocatorProvider:", self);
    objc_storeStrong((id *)self + 2, v7);
  }
  std::mutex::unlock(v5);
  return v7;
}

- (id)createTriggerPMI:(id *)a3
{
  std::mutex *v5;
  void *v6;
  DTKPTriggerPMI *v7;

  v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v6 = (void *)*((_QWORD *)self + 3);
  if (v6)
  {
    if (a3)
    {
      sub_222B305D8(CFSTR("A PMI trigger already exists. DTKPKperfConfiguration doesn't support creation of multiple PMI triggers."), -510);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)*((_QWORD *)self + 3);
    }
    v7 = v6;
  }
  else
  {
    v7 = -[DTKPTrigger initWithCounterAllocatorProvider:]([DTKPTriggerPMI alloc], "initWithCounterAllocatorProvider:", self);
    objc_storeStrong((id *)self + 3, v7);
  }
  std::mutex::unlock(v5);
  return v7;
}

- (id)createTriggerTime:(id *)a3
{
  std::mutex *v4;
  DTKPTriggerTime *v5;

  v4 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v5 = -[DTKPTriggerTime initWithCounterAllocatorProvider:]([DTKPTriggerTime alloc], "initWithCounterAllocatorProvider:", self);
  if (v5)
    objc_msgSend(*((id *)self + 4), "addObject:", v5);
  std::mutex::unlock(v4);
  return v5;
}

- (void)clearTriggerKDebug
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (void *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;

  std::mutex::unlock(v3);
}

- (void)clearTriggerPMI
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (void *)*((_QWORD *)self + 3);
  *((_QWORD *)self + 3) = 0;

  std::mutex::unlock(v3);
}

- (void)clearTriggerTimeAtIndex:(unint64_t)a3
{
  std::mutex *v5;

  v5 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  if (objc_msgSend(*((id *)self + 4), "count") > a3)
    objc_msgSend(*((id *)self + 4), "removeObjectAtIndex:", a3);
  std::mutex::unlock(v5);
}

- (void)clearAllTriggerTime
{
  std::mutex *v3;
  uint64_t v4;
  void *v5;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)self + 4);
  *((_QWORD *)self + 4) = v4;

  std::mutex::unlock(v3);
}

- (id)triggerKDebug
{
  std::mutex *v3;
  id v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = *((id *)self + 2);
  std::mutex::unlock(v3);
  return v4;
}

- (id)triggerPMI
{
  std::mutex *v3;
  id v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = *((id *)self + 3);
  std::mutex::unlock(v3);
  return v4;
}

- (id)firstTriggerTime
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  objc_msgSend(*((id *)self + 4), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  std::mutex::unlock(v3);
  return v4;
}

- (id)allTriggerTime
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (void *)objc_msgSend(*((id *)self + 4), "copy");
  std::mutex::unlock(v3);
  return v4;
}

- (void)setBufferSize:(unint64_t)a3
{
  std::mutex *v4;

  v4 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  *((_QWORD *)self + 16) = (uint64_t)(int)kperf_logging_query_size() << 6;
  std::mutex::unlock(v4);
}

- (id)generateConfigWords
{
  std::mutex *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = malloc_type_calloc(0x14uLL, 8uLL, 0x100004000313F17uLL);
  *v4 = 256;
  v4[1] = -[DTKPKperfConfiguration collectionMode](self, "collectionMode");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)*((_QWORD *)self + 4);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_222B30DAC;
  v17[3] = &unk_24EB28B80;
  v17[4] = &v18;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
  v4[2] = *((unsigned __int8 *)v19 + 24);
  v4[3] = *((_QWORD *)self + 2) != 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = (void *)*((_QWORD *)self + 3);
  if (v7 && objc_msgSend(v7, "pmcEventCount"))
  {
    v8 = objc_msgSend(*((id *)self + 3), "_recordConfigWordsIntoBuffer:", &v4[v14[3] + 4]);
    v14[3] += v8;
  }
  v9 = (void *)*((_QWORD *)self + 4);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = sub_222B30DEC;
  v12[3] = &unk_24EB28BA8;
  v12[4] = &v13;
  v12[5] = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, ((v14[3] << 32) + 0x400000000) >> 29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v18, 8);
  std::mutex::unlock(v3);
  return v10;
}

- (id)_reinitializeKperf
{
  void *v2;
  int *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  id v9;
  id v10;

  if (kperf_reset())
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    v3 = __error();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Could not reset kperf (%s)."), strerror(*v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B305D8(v4, -6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v10 = 0;
    +[DTKPTrigger reinitializeKperf:](DTKPTrigger, "reinitializeKperf:", &v10);
    v7 = v10;
    if (!v7)
    {
      v9 = 0;
      +[DTKPTriggerTime reinitializeKperf:](DTKPTriggerTime, "reinitializeKperf:", &v9);
      v7 = v9;
    }
    v8 = v7;

    return v8;
  }
}

- (id)_validateConfigLocked
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[3];
  char v11;
  _QWORD v12[6];
  _QWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_222B30028;
  v19 = sub_222B30038;
  v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v3 = (void *)*((_QWORD *)self + 4);
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B310E0;
  v12[3] = &unk_24EB28BD0;
  v12[4] = v13;
  v12[5] = &v15;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
  v5 = (void *)v16[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v11 = objc_msgSend(*((id *)self + 3), "requestsPMCSampling");
    v7 = (void *)*((_QWORD *)self + 4);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = sub_222B3117C;
    v9[3] = &unk_24EB28BD0;
    v9[4] = v10;
    v9[5] = &v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);
    v6 = (id)v16[5];
    _Block_object_dispose(v10, 8);
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v6;
}

- (unsigned)collectionMode
{
  return *((_BYTE *)self + 120);
}

- (void)setCollectionMode:(unsigned __int8)a3
{
  *((_BYTE *)self + 120) = a3;
}

- (unint64_t)bufferSize
{
  return *((_QWORD *)self + 16);
}

- (NSDictionary)providerOptions
{
  return (NSDictionary *)*((_QWORD *)self + 17);
}

- (void)setProviderOptions:(id)a3
{
  objc_storeStrong((id *)self + 17, a3);
}

- (unint64_t)collectionInterval
{
  return *((_QWORD *)self + 18);
}

- (void)setCollectionInterval:(unint64_t)a3
{
  *((_QWORD *)self + 18) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
