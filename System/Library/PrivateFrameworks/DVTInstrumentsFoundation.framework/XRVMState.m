@implementation XRVMState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    MEMORY[0x24BEDD108](a1, sel_setVersion_);
}

- (XRVMState)init
{
  XRVMState *v2;
  NSMutableArray *v3;
  NSMutableArray *regions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XRVMState;
  v2 = -[XRVMState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    regions = v2->_regions;
    v2->_regions = v3;

    v2->_pageAnnotationsByRegion = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    v2->_machAbsolute = mach_absolute_time();
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *pageAnnotationsByRegion;
  objc_super v4;

  pageAnnotationsByRegion = self->_pageAnnotationsByRegion;
  if (pageAnnotationsByRegion)
    CFRelease(pageAnnotationsByRegion);
  v4.receiver = self;
  v4.super_class = (Class)XRVMState;
  -[XRVMState dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFIndex Count;
  void *v6;
  uint64_t v7;
  const void **v8;
  const void **v9;
  void *v10;
  void *v11;
  void **v12;
  const void **v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  const void **v19;
  const void **v20;
  unint64_t i;
  unsigned int v22;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeInteger:forKey:", 5, CFSTR("VMStateVersion"));
    objc_msgSend(v4, "encodeInt64:forKey:", self->_machAbsolute, CFSTR("VMStateMachAbsolute"));
    objc_msgSend(v4, "encodeInt64:forKey:", self->_totalSize, CFSTR("VMStateTotalSize"));
    objc_msgSend(v4, "encodeInt64:forKey:", self->_sharedRegionStart, CFSTR("VMStateSharedStart"));
    objc_msgSend(v4, "encodeInt64:forKey:", self->_sharedRegionLength, CFSTR("VMStateSharedLength"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_regions, CFSTR("VMStateRegions"));
    Count = CFDictionaryGetCount(self->_pageAnnotationsByRegion);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", Count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("VMStateAnnotationCount"));

    v7 = Count;
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_pageAnnotationsByRegion, v8, v9);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", Count);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)Count)
    {
      v12 = (void **)v9;
      v13 = v8;
      do
      {
        v15 = (void *)*v13++;
        v14 = v15;
        v16 = *v12++;
        v17 = v16;
        v18 = v14;
        objc_msgSend(v10, "addObject:", v18);
        objc_msgSend(v11, "addObject:", v17);

        --v7;
      }
      while (v7);
    }
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("VMStateAnnotationRegionsKeys"));
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("VMSTateAnnotations"));
    if (v8)
      free(v8);
    if (v9)
      free(v9);

    goto LABEL_18;
  }
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &self->_machAbsolute);
  objc_msgSend(v4, "encodeObject:", self->_regions);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &self->_totalSize);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &self->_sharedRegionStart);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &self->_sharedRegionLength);
  v22 = CFDictionaryGetCount(self->_pageAnnotationsByRegion);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v22);
  v19 = (const void **)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
  v20 = (const void **)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->_pageAnnotationsByRegion, v19, v20);
  if (v22)
  {
    for (i = 0; i < v22; objc_msgSend(v4, "encodeObject:", v20[i++]))
      objc_msgSend(v4, "encodeObject:", v19[i]);
  }
  else if (!v19)
  {
    goto LABEL_16;
  }
  free(v19);
LABEL_16:
  if (v20)
    free(v20);
LABEL_18:

}

- (XRVMState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *regions;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  __CFDictionary *pageAnnotationsByRegion;
  void *v27;
  void *v28;
  NSMutableArray *v30;
  NSMutableArray *v31;
  unsigned int i;
  void *v33;
  void *v34;
  unsigned int v36;
  objc_class *v37;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
      v6 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("VMStateVersion"));
    else
      v6 = objc_msgSend(v5, "versionForClassName:", CFSTR("XRVMState"));
    v7 = v6;
    self->_pageAnnotationsByRegion = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    if (v7 > 4)
    {
      self->_machAbsolute = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("VMStateMachAbsolute"));
      self->_totalSize = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("VMStateTotalSize"));
      self->_sharedRegionStart = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("VMStateSharedStart"));
      self->_sharedRegionLength = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("VMStateSharedLength"));
      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("VMStateRegions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
      regions = self->_regions;
      self->_regions = v14;

      v16 = (void *)MEMORY[0x24BDBCF20];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v18, CFSTR("VMStateAnnotationRegionsKeys"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDBCF20];
      v21 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v22, CFSTR("VMSTateAnnotations"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "count"))
      {
        v24 = 0;
        v25 = 1;
        do
        {
          pageAnnotationsByRegion = self->_pageAnnotationsByRegion;
          objc_msgSend(v19, "objectAtIndexedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          CFDictionarySetValue(pageAnnotationsByRegion, v27, v28);

          v24 = v25;
        }
        while (objc_msgSend(v23, "count") > (unint64_t)v25++);
      }

    }
    else
    {
      v37 = 0;
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &v37, 8);
      if (v7 > 1)
      {
        v8 = v37;
        v9 = 8;
        if (v7 == 2)
          v9 = 16;
      }
      else
      {
        v8 = (objc_class *)(1000 * (_QWORD)v37);
        v9 = 16;
      }
      *(Class *)((char *)&self->super.isa + v9) = v8;
      objc_msgSend(v5, "decodeObject");
      v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v31 = self->_regions;
      self->_regions = v30;

      if (v7 <= 3)
      {
        v36 = 0;
        objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v36, 4);
        objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v36, 4);
        objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v36, 4);
      }
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->_totalSize, 8);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->_sharedRegionStart, 8);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->_sharedRegionLength, 8);
      v36 = 0;
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v36, 4);
      if (v36)
      {
        for (i = 0; i < v36; ++i)
        {
          objc_msgSend(v5, "decodeObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "decodeObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CFDictionarySetValue(self->_pageAnnotationsByRegion, v33, v34);

        }
      }
    }
    -[XRVMState _recalculateSizes](self, "_recalculateSizes");
  }

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)XRVMState;
  -[XRVMState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nRegions: %@"), v4, self->_regions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)currentStateForTask:(unsigned int)a3 pid:(int)a4 previousState:(id)a5 dehydratedDiffVersion:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  XRVMState *v9;
  XRVMState *v10;
  int v11;
  kern_return_t v12;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t shared_cache;
  uint64_t v18;
  char v19;
  _BOOL8 v20;
  kern_return_t v21;
  void *v22;
  void *v23;
  XRVMRegion *v24;
  XRVMRegion *v25;
  XRVMRegion *v26;
  int v27;
  void *v28;
  unint64_t i;
  thread_read_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  void *v34;
  char v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  ipc_space_t *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  id v53;
  XRVMState *v54;
  void *context;
  CFDictionaryRef *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  mach_msg_type_number_t act_listCnt;
  mach_msg_type_number_t task_info_outCnt[2];
  task_suspension_token_t suspend_token;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  XRVMState *v73;
  _QWORD *v74;
  uint64_t v75;
  _QWORD v76[3];
  char v77;
  int info[4];
  __int128 v79;
  __int128 v80;
  _DWORD v81[8];
  natural_t nesting_depth;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  mach_msg_type_number_t old_stateCnt;
  _BYTE v87[128];
  _BYTE v88[128];
  integer_t task_info_out[4];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v106 = *MEMORY[0x24BDAC8D0];
  v57 = (CFDictionaryRef *)a5;
  v9 = objc_alloc_init(XRVMState);
  context = (void *)MEMORY[0x227679C5C]();
  size = 0;
  address = 0;
  infoCnt = 19;
  nesting_depth = 0;
  v80 = 0u;
  memset(v81, 0, 28);
  *(_OWORD *)info = 0u;
  v79 = 0u;
  if (!mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt))
  {
    v19 = 0;
    v20 = !v6;
    do
    {
      if (v81[0])
      {
        ++nesting_depth;
        v21 = mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt);
      }
      else
      {
        -[CFDictionaryRef regionForAddress:](v57, "regionForAddress:", address);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22 && objc_msgSend(v22, "matchesAddr:size:regionInfo:", address, size, info))
        {
          -[XRVMState _addRegion:annotation:new:](v9, "_addRegion:annotation:new:", v23, CFDictionaryGetValue(v57[10], v23), v20);
        }
        else
        {
          v24 = [XRVMRegion alloc];
          v25 = -[XRVMRegion initWithAddress:size:regionInfo:](v24, "initWithAddress:size:regionInfo:", address, size, info);
          v26 = v25;
          if (BYTE14(v80))
          {
            v27 = proc_regionfilename(a4, address, task_info_out, 0x400u);
            if (v27 < 1)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Object_id=%x"), v81[2]);
            }
            else
            {
              *((_BYTE *)task_info_out + v27) = 0;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", task_info_out);
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[XRVMRegion setPath:type:](v26, "setPath:type:", v28, 0);

          }
          else if (-[XRVMRegion isNullRegion](v25, "isNullRegion"))
          {
            if ((v19 & 1) != 0)
              -[XRVMRegion setPath:type:](v26, "setPath:type:", CFSTR("GPU Carveout (reserved)"), 0);
            else
              -[XRVMRegion setPath:type:](v26, "setPath:type:", CFSTR("Commpage (reserved)"), 0);
            v19 = 1;
          }
          -[XRVMState _addRegion:annotation:new:](v9, "_addRegion:annotation:new:", v26, 0, 1);

        }
        if (!v81[0])
          address += size;

        v21 = mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt);
      }
    }
    while (!v21);
  }
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = 0;
  CSSymbolicatorGetFlagsForNListOnlyData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  v69 = MEMORY[0x24BDAC760];
  v70 = 3221225472;
  v71 = sub_222BA13A4;
  v72 = &unk_24EB2B200;
  v74 = v76;
  v75 = 10;
  v10 = v9;
  v73 = v10;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  suspend_token = 0;
  v11 = 1;
  if (task_suspend2(v8, &suspend_token))
    goto LABEL_88;
  task_info_out[0] = 0;
  task_info_outCnt[0] = 1;
  v12 = task_info(v8, 0x1Cu, task_info_out, task_info_outCnt);
  v14 = (task_info_out[0] & 2) == 0 || v12 != 0;
  task_info_out[0] = 0;
  v15 = dyld_process_create_for_task();
  if (v15)
  {
    task_info_out[0] = 0;
    v16 = dyld_process_snapshot_create_for_process();
    dyld_process_dispose();
    if (v16)
    {
      shared_cache = dyld_process_snapshot_get_shared_cache();
      v18 = shared_cache;
      if (!shared_cache)
      {
        v15 = 0;
        goto LABEL_15;
      }
      if ((MEMORY[0x227679404](shared_cache) & 1) == 0)
      {
        v15 = MEMORY[0x2276793EC](v18);
        v18 = MEMORY[0x2276793F8](v18);
        dyld_process_snapshot_dispose();
        goto LABEL_15;
      }
    }
    v15 = 0;
  }
  v18 = 0;
LABEL_15:
  v10->_sharedRegionStart = v15;
  v10->_sharedRegionLength = v18;
  *(_QWORD *)task_info_outCnt = 0;
  act_listCnt = 0;
  if (task_threads(v8, (thread_act_array_t *)task_info_outCnt, &act_listCnt))
  {
    task_resume2(suspend_token);
    goto LABEL_88;
  }
  if (!act_listCnt)
    goto LABEL_62;
  for (i = 0; i < act_listCnt; ++i)
  {
    v30 = *(_DWORD *)(*(_QWORD *)task_info_outCnt + 4 * i);
    if (v14)
    {
      LODWORD(v93) = 0;
      v91 = 0u;
      v92 = 0u;
      *(_OWORD *)task_info_out = 0u;
      v90 = 0u;
      old_stateCnt = 17;
      if (thread_get_state(v30, 1, (thread_state_t)task_info_out, &old_stateCnt))
        v31 = 0;
      else
        v31 = DWORD1(v92);
      if (!v31)
        continue;
    }
    else
    {
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      *(_OWORD *)task_info_out = 0u;
      old_stateCnt = 68;
      if (thread_get_state(v30, 6, (thread_state_t)task_info_out, &old_stateCnt))
        continue;
      v31 = *((_QWORD *)&v104 + 1);
      if (!*((_QWORD *)&v104 + 1))
        continue;
    }
    -[XRVMState regionForAddress:](v10, "regionForAddress:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      memset(task_info_out, 0, sizeof(task_info_out));
      *(_QWORD *)&v90 = 0;
      old_stateCnt = 6;
      if (thread_info(*(_DWORD *)(*(_QWORD *)task_info_outCnt + 4 * i), 4u, task_info_out, &old_stateCnt))
      {
        NSLog(CFSTR("unable to obtain thread identifier info for thread port: %d (region:\n%@"), *(unsigned int *)(*(_QWORD *)task_info_outCnt + 4 * i), v32, context);
        v33 = CFSTR("unknown thread");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("thread %qx"), *(_QWORD *)task_info_out);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", v33);

      if ((v35 & 1) != 0)
      {
        v36 = v32;
      }
      else
      {
        v37 = +[XRVMRegion regionIndexInArray:forAddress:](XRVMRegion, "regionIndexInArray:forAddress:", v10->_regions, v31);
        v36 = (void *)objc_msgSend(v32, "copy");
        -[NSMutableArray replaceObjectAtIndex:withObject:](v10->_regions, "replaceObjectAtIndex:withObject:", v37, v36);

      }
      objc_msgSend(v36, "setPath:type:", v33, 0);

    }
  }
  if (act_listCnt)
  {
    v38 = 0;
    v39 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    do
      mach_port_deallocate(*v39, *(_DWORD *)(*(_QWORD *)task_info_outCnt + 4 * v38++));
    while (v38 < act_listCnt);
    mach_vm_deallocate(*v39, *(mach_vm_address_t *)task_info_outCnt, 4 * act_listCnt);
  }
LABEL_62:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v40 = v10->_regions;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v62, v88, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v63 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v44, "location");
          objc_msgSend(v44, "virtualSize");
          if ((CSRangeContainsRange() & 1) != 0)
          {
            objc_msgSend(v44, "type");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45 == 0;

            if (v46)
              objc_msgSend(v44, "setPath:type:", CFSTR("unused shared library"), 0);
            v47 = -[XRVMRegionAnnotation initSamplingRegion:inTask:]([XRVMRegionAnnotation alloc], "initSamplingRegion:inTask:", v44, v8);
            CFDictionarySetValue(v10->_pageAnnotationsByRegion, v44, v47);

          }
        }
      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v62, v88, 16);
    }
    while (v41);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = v10->_regions;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v58, v87, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && !CFDictionaryContainsKey(v10->_pageAnnotationsByRegion, v52)
          && objc_msgSend(v52, "location")
          && (objc_msgSend(v52, "residentSize") || objc_msgSend(v52, "swappedSize")))
        {
          v53 = -[XRVMRegionAnnotation initSamplingRegion:inTask:]([XRVMRegionAnnotation alloc], "initSamplingRegion:inTask:", v52, v8);
          CFDictionarySetValue(v10->_pageAnnotationsByRegion, v52, v53);

        }
      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v58, v87, 16);
    }
    while (v49);
  }

  task_resume2(suspend_token);
  v10->_task = v8;
  -[XRVMState _recalculateSizes](v10, "_recalculateSizes");
  v11 = 0;
LABEL_88:

  _Block_object_dispose(v76, 8);
  objc_autoreleasePoolPop(context);
  if (v11)
    v54 = 0;
  else
    v54 = v10;

  return v54;
}

+ (id)stateFrom:(id)a3
{
  id v3;
  XRVMState *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(XRVMState);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[XRVMState _addRegion:annotation:new:](v4, "_addRegion:annotation:new:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), 0, 1, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_recalculateSizes
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&self->_residentSize = 0u;
  *(_OWORD *)&self->_dirtySize = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_regions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v8, "path", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("unused shared library"));

          if ((v10 & 1) == 0
            && (objc_msgSend(v8, "isSubmapRegion") & 1) == 0
            && (objc_msgSend(v8, "isNullRegion") & 1) == 0)
          {
            self->_totalSize += objc_msgSend(v8, "virtualSize");
            self->_residentSize += objc_msgSend(v8, "residentSize");
            self->_dirtySize += objc_msgSend(v8, "dirtySize");
            self->_swapSize += objc_msgSend(v8, "swappedSize");
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)detailsForRegion:(id)a3
{
  if (!a3)
    return 0;
  CFDictionaryGetValue(self->_pageAnnotationsByRegion, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPageSize:(unint64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_regions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "pageSize", (_QWORD)v12) == a3)
        {

          return;
        }
        objc_msgSend(v10, "setPageSize:", a3);
        -[XRVMState _annotationForRegion:](self, "_annotationForRegion:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPageSize:", a3);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[XRVMState _recalculateSizes](self, "_recalculateSizes");
}

- (void)hydrateWithPreviousState:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *regions;
  XRVMState *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = self;
    v6 = self->_regions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSMutableArray addObject:](v5, "addObject:", v11);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v4, "regionForAddress:", objc_msgSend(v11, "unsignedLongLongValue"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                -[NSMutableArray addObject:](v5, "addObject:", v12);
                objc_msgSend(v4, "_annotationForRegion:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13)
                  CFDictionarySetValue(v15->_pageAnnotationsByRegion, v12, v13);

              }
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    regions = v15->_regions;
    v15->_regions = v5;

    -[XRVMState _recalculateSizes](v15, "_recalculateSizes");
  }

}

- (id)regionForAddress:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = +[XRVMRegion regionIndexInArray:forAddress:](XRVMRegion, "regionIndexInArray:forAddress:", self->_regions, a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)virtualSize
{
  return self->_totalSize;
}

- (unint64_t)residentSize
{
  return self->_residentSize;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)swappedSize
{
  return self->_swapSize;
}

- (id)regions
{
  return self->_regions;
}

- (unint64_t)machAbsoluteTimestamp
{
  return self->_machAbsolute;
}

- (void)setSyntheticMachAbsoluteTimestamp:(unint64_t)a3
{
  self->_machAbsolute = a3;
  -[XRVMState _recalculateSizes](self, "_recalculateSizes");
}

- (unint64_t)traceRelativeTimestamp
{
  return self->_traceRelative;
}

- (void)_addRegion:(id)a3 annotation:(id)a4 new:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSMutableArray *regions;
  void *v11;
  id key;

  v5 = a5;
  key = a3;
  v8 = a4;
  if (key)
  {
    if (v5)
    {
      v9 = key;
      if (v8)
      {
        CFDictionarySetValue(self->_pageAnnotationsByRegion, key, v8);
        v9 = key;
      }
      -[NSMutableArray addObject:](self->_regions, "addObject:", v9);
    }
    else
    {
      regions = self->_regions;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(key, "location"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](regions, "addObject:", v11);

    }
  }

}

- (id)_annotationForRegion:(id)a3
{
  if (!a3)
    return 0;
  CFDictionaryGetValue(self->_pageAnnotationsByRegion, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_annotateRange:(_CSRange)a3 withPath:(id)a4 type:(id)a5
{
  unint64_t var1;
  unint64_t var0;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  id v28;

  var1 = a3.var1;
  var0 = a3.var0;
  v28 = a4;
  v9 = a5;
  v10 = +[XRVMRegion regionIndexInArray:forAddress:](XRVMRegion, "regionIndexInArray:forAddress:", self->_regions, var0);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    -[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "location");
    v14 = var0 - v13;
    if (var0 > v13)
    {
      v15 = v13;
      v16 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v16, "setAddress:size:", v15, v14);
      -[NSMutableArray insertObject:atIndex:](self->_regions, "insertObject:atIndex:", v16, v11++);

    }
    v17 = var0 + var1;
    v18 = +[XRVMRegion regionIndexInArray:forAddress:](XRVMRegion, "regionIndexInArray:forAddress:", self->_regions, var0 + var1);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v18;
      -[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "location");
      v22 = objc_msgSend(v20, "virtualSize");
      if (v22 + v21 > v17)
      {
        if (v20 == v12)
        {
          v27 = v22 + v21 - v17;
          v26 = (id)objc_msgSend(v12, "copy");
          -[NSMutableArray insertObject:atIndex:](self->_regions, "insertObject:atIndex:", v26, v11 + 1);
          v25 = v27;
        }
        else
        {
          v23 = v22 + v21 - v17;
          v24 = v20;
          v25 = v23;
          v26 = v24;
          --v19;
        }
        objc_msgSend(v26, "setAddress:size:", var0 + var1, v25);

      }
      if (v19 > v11)
        -[NSMutableArray removeObjectsInRange:](self->_regions, "removeObjectsInRange:", v11 + 1, v19 - v11);

    }
    objc_msgSend(v12, "setAddress:size:", var0, var1);
    objc_msgSend(v12, "setPath:type:", v28, v9);

  }
}

- (id)regionsWithOptions:(int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  int v14;
  XRVMCoalescedRegion *v15;
  uint64_t v16;
  XRVMCoalescedRegion *v17;
  char v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_regions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        v11 = v7;
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("unused shared library"));

        if (v14)
        {
          if (v11)
            objc_msgSend(v20, "addObject:", v11);
          v7 = 0;
        }
        else if ((v19 & 1) != 0
               && v11
               && objc_msgSend(v12, "typeMatches:", v11)
               && objc_msgSend(v12, "isAdjacentTo:", v11))
        {
          if (v8)
          {
            objc_msgSend(v8, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, v12, 0);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v7 = v12;
        }
        else
        {
          if (v8)
          {
            v15 = -[XRVMCoalescedRegion initWithRegions:groupName:]([XRVMCoalescedRegion alloc], "initWithRegions:groupName:", v8, 0);
            objc_msgSend(v20, "addObject:", v15);

          }
          else if (v11)
          {
            objc_msgSend(v20, "addObject:", v11);
          }
          v7 = v12;
          v8 = 0;
        }

        ++v10;
      }
      while (v6 != v10);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = v16;
    }
    while (v16);

    if (v8)
    {
      v17 = -[XRVMCoalescedRegion initWithRegions:groupName:]([XRVMCoalescedRegion alloc], "initWithRegions:groupName:", v8, 0);
      objc_msgSend(v20, "addObject:", v17);

    }
    else
    {
      if (!v7)
      {
        v8 = 0;
        goto LABEL_33;
      }
      objc_msgSend(v20, "addObject:", v7);
      v8 = 0;
    }
    v4 = v7;
  }
  else
  {
    v8 = 0;
  }

LABEL_33:
  return v20;
}

- (id)summaryRegionsWithOptions:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  XRVMCoalescedRegion *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  XRVMCoalescedRegion *v14;
  void *v15;
  XRVMCoalescedRegion *v16;
  void *v17;
  uint64_t v18;
  XRVMCoalescedRegion *v19;
  XRVMCoalescedRegion *v20;
  XRVMCoalescedRegion *v21;
  void *v22;
  void *v23;
  void *context;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  context = (void *)MEMORY[0x227679C5C]();
  -[XRVMState regionsWithOptions:](self, "regionsWithOptions:", v3);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "displayType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "location"))
        {
          if (v9)
          {
            -[XRVMCoalescedRegion addRegion:](v9, "addRegion:", v12);
          }
          else
          {
            v14 = [XRVMCoalescedRegion alloc];
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[XRVMCoalescedRegion initWithRegions:groupName:](v14, "initWithRegions:groupName:", v15, XRVMAllRegionAggregateName);

            objc_msgSend(v5, "setObject:forKey:", v9, XRVMAllRegionAggregateName);
          }
          if (objc_msgSend(v12, "dirtySize"))
          {
            if (v8)
            {
              objc_msgSend(v8, "addRegion:", v12);
            }
            else
            {
              v16 = [XRVMCoalescedRegion alloc];
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[XRVMCoalescedRegion initWithRegions:groupName:](v16, "initWithRegions:groupName:", v17, XRVMDirtyRegionAggregateName);

              v8 = (void *)v18;
              objc_msgSend(v5, "setObject:forKey:", v18, XRVMDirtyRegionAggregateName);
            }
          }
          objc_msgSend(v5, "objectForKey:", v13);
          v19 = (XRVMCoalescedRegion *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = v19;
            -[XRVMCoalescedRegion addRegion:](v19, "addRegion:", v12);
          }
          else
          {
            v21 = [XRVMCoalescedRegion alloc];
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[XRVMCoalescedRegion initWithRegions:groupName:](v21, "initWithRegions:groupName:", v22, v13);

            objc_msgSend(v5, "setObject:forKey:", v20, v13);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  objc_autoreleasePoolPop(context);
  objc_msgSend(v5, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
