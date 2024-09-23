@implementation __NSOperationInternalObserver

+ (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  unsigned int v11;
  objc_class *v12;
  const char *Name;
  int v15;
  unsigned int v16;
  os_unfair_lock_s *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  unsigned __int8 *v32;
  void *v34;
  id v35;
  char *v36;
  NSObject *global_queue;
  char *v38;
  char v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  __CFString *v46;
  int v47;
  char v48;
  unsigned __int8 *v49;
  char v50;
  char v51;
  Class Class;
  uint64_t v53;
  int v54;
  int v55;
  __CFString *v56;
  unsigned __int8 *v57;
  int v58;
  _BOOL4 v59;
  int v60;
  void *v61;
  unsigned __int8 *v62;
  unsigned int v63;
  char *v64;
  os_unfair_lock_s *lock;
  id obj;
  id obja;
  _QWORD block[6];
  _QWORD v69[2];
  void (*v70)(uint64_t);
  void *v71;
  unsigned __int8 *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  void *v76;
  unsigned __int8 *v77;
  char *v78;
  char v79;
  BOOL v80;
  _BYTE v81[128];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (a3 != CFSTR("isFinished") && a3 != CFSTR("finished"))
  {
    if (a3 == CFSTR("isExecuting") || a3 == CFSTR("executing"))
    {
LABEL_18:
      v15 = objc_msgSend(a4, "isExecuting");
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      v16 = atomic_load((unsigned __int8 *)a4 + 237);
      if (v16 <= 0xDF && v15 != 0)
        atomic_store(0xE0u, (unsigned __int8 *)a4 + 237);
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
      goto LABEL_24;
    }
    if (a3 == CFSTR("isReady") || a3 == CFSTR("ready"))
    {
LABEL_108:
      v60 = objc_msgSend(a4, "isReady");
      atomic_store(v60, (unsigned __int8 *)a4 + 239);
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      obja = *((id *)a4 + 4);
      os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
      v61 = obja;
      if (v60 && obja)
      {
        __NSOQSchedule((uint64_t)obja);
        v61 = obja;
      }

      return;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isFinished"), a4, a5, a6, a7, a8) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("finished")) & 1) == 0)
    {
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
        || (objc_msgSend(a3, "isEqualToString:", CFSTR("executing")) & 1) != 0)
      {
        goto LABEL_18;
      }
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isReady")) & 1) == 0
        && (objc_msgSend(a3, "isEqualToString:", CFSTR("ready")) & 1) == 0)
      {
        return;
      }
      goto LABEL_108;
    }
  }
  if (!objc_msgSend(a4, "isFinished"))
    return;
  os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
  v11 = atomic_load((unsigned __int8 *)a4 + 237);
  if (*((_QWORD *)a4 + 4) && v11 <= 0xD7)
  {
    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    NSLog((NSString *)CFSTR("*** %s %p went isFinished=YES without being started by the queue it is in"), Name, a4);
  }
  else if (v11 > 0xEF)
  {
    if (v11 == 244)
    {
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
LABEL_24:
      os_unfair_lock_unlock(v18);
      return;
    }
    goto LABEL_27;
  }
  atomic_store(0xF0u, (unsigned __int8 *)a4 + 237);
LABEL_27:
  v19 = (void *)*((_QWORD *)a4 + 6);
  *((_QWORD *)a4 + 6) = 0;
  obj = v19;
  if (objc_msgSend(v19, "count")
    && (v89 = 0u,
        v90 = 0u,
        v87 = 0u,
        v88 = 0u,
        (v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v87, v86, 16)) != 0))
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v88 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
        os_unfair_lock_lock((os_unfair_lock_t)(v25 + 232));
        v26 = *(_QWORD *)(v25 + 56);
        if (v26 == 1)
        {
          if (!v22)
            v22 = (void *)objc_opt_new();
          objc_msgSend(v22, "addObject:", v25);
        }
        else if (v26 < 2)
        {
          if (v26)
            __assert_rtn("+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]", "NSOperation.m", 1022, "idown->__unfinished_deps == 0");
          v27 = atomic_load((unsigned __int8 *)(v25 + 240));
          if ((v27 & 1) == 0)
            __assert_rtn("+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]", "NSOperation.m", 1023, "atomic_load(&idown->__isCancelled) == YES");
        }
        else
        {
          *(_QWORD *)(v25 + 56) = v26 - 1;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 232));
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v86, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }
  v63 = v11;
  atomic_store(0xF4u, (unsigned __int8 *)a4 + 237);
  v62 = (unsigned __int8 *)*((_QWORD *)a4 + 4);
  v64 = (char *)a4;
  lock = (os_unfair_lock_s *)((char *)a4 + 232);
  *((_QWORD *)a4 + 4) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
  if (objc_msgSend(v22, "count"))
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v28 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v83 != v30)
            objc_enumerationMutation(v22);
          v32 = *(unsigned __int8 **)(*((_QWORD *)&v82 + 1) + 8 * j);
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v70 = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke;
          v71 = &__block_descriptor_40_e5_v8__0l;
          v72 = v32 + 8;
          if (atomic_load(v32 + 244))
          {
            objc_msgSend(v32, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationReadyKeys, 1, 0, 0, v69);
          }
          else
          {
            v70((uint64_t)v69);
            +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), v32, 0, 0, 0, 0, 0);
          }
        }
        v29 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
      }
      while (v29);
    }
  }

  pthread_mutex_lock((pthread_mutex_t *)(v64 + 120));
  pthread_cond_broadcast((pthread_cond_t *)(v64 + 184));
  pthread_mutex_unlock((pthread_mutex_t *)(v64 + 120));
  if (qword_1ECD09930 != -1)
    dispatch_once(&qword_1ECD09930, &__block_literal_global_307);
  os_unfair_lock_lock(lock);
  v34 = (void *)*((_QWORD *)v64 + 8);
  if (_MergedGlobals_13)
    *((_QWORD *)v64 + 8) = 0;
  else
    v35 = v34;
  os_unfair_lock_unlock(lock);
  if (v34)
  {
    v36 = v64;
    global_queue = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke_2;
    block[3] = &unk_1E0F4E060;
    block[4] = v64;
    block[5] = v34;
    dispatch_async(global_queue, block);
  }
  if (!v64[236])
    goto LABEL_87;
  v38 = v64;
  v39 = 0;
  v40 = 0;
  v73 = MEMORY[0x1E0C809B0];
  v74 = 3221225472;
  v75 = __iop_removeAllDependencies_block_invoke;
  v76 = &unk_1E0F4EE20;
  v77 = (unsigned __int8 *)v64;
  v78 = v64 + 8;
  v41 = 1;
  v42 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        v43 = v39;
        v44 = v42;
        v45 = v41;
        v46 = _NSOperationDependenciesAndReadyKeys[v40];
        if (v46 != CFSTR("isReady"))
          break;
        v42 = 0;
        v47 = atomic_load((unsigned __int8 *)v64 + 244);
        v48 = v39 | (v47 != 0);
        v39 = 1;
        v41 = v44;
        v40 = 1;
        if ((v48 & 1) != 0)
          goto LABEL_77;
      }
      if (v46 != CFSTR("isFinished"))
        break;
      v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 243);
LABEL_76:
      v47 = atomic_load(v49);
      v50 = v39 | (v47 != 0);
      v40 = 1;
      v41 = v44;
      v39 = 1;
      if ((v50 & 1) != 0)
      {
LABEL_77:
        if (v47)
          v51 = v45;
        else
          v51 = v44;
        if ((v51 & 1) != 0)
          goto LABEL_81;
        goto LABEL_85;
      }
    }
    if (v46 == CFSTR("isExecuting"))
    {
      v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 242);
      goto LABEL_76;
    }
    if (v46 == CFSTR("isCancelled"))
    {
      v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 245);
      goto LABEL_76;
    }
    v42 = 0;
    v40 = 1;
    v41 = v44;
    v39 = 1;
  }
  while ((v43 & 1) == 0);
  if ((v44 & 1) != 0)
  {
LABEL_81:
    objc_msgSend(v64, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationDependenciesAndReadyKeys, 2, 0, 0, &v73);
    goto LABEL_86;
  }
LABEL_85:
  v75((uint64_t)&v73);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), v64, 0, 0, 0, 0, 0);
LABEL_86:

LABEL_87:
  if (!v62)
    goto LABEL_102;
  Class = object_getClass(v64);
  v53 = 0;
  v73 = MEMORY[0x1E0C809B0];
  v74 = 3221225472;
  v75 = ____NSOQOpFinished_block_invoke;
  v76 = &unk_1E0F4FC70;
  v77 = v62;
  v78 = v64;
  v79 = v63;
  v80 = Class == (Class)_NSBarrierOperation;
  v54 = 1;
  while (1)
  {
LABEL_89:
    v55 = v54;
    v56 = _NSOperationQueueOperationsAndOperationCountKeys[v53];
    if (v56 == CFSTR("operations"))
    {
      v57 = v62 + 503;
      goto LABEL_95;
    }
    if (v56 == CFSTR("operationCount"))
      break;
    v54 = 0;
    v53 = 1;
    if ((v55 & 1) == 0)
      goto LABEL_99;
  }
  v57 = v62 + 504;
LABEL_95:
  v58 = atomic_load(v57);
  v59 = v58 != 0;
  if (!v58)
  {
    v54 = 0;
    v53 = 1;
    if (((v55 ^ 1) & 1) == 0)
      goto LABEL_89;
  }
  if (v59)
  {
    objc_msgSend(v62, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationQueueOperationsAndOperationCountKeys, 2, 0, 0, &v73);
    goto LABEL_100;
  }
LABEL_99:
  v75((uint64_t)&v73);
LABEL_100:
  __NSOQSchedule((uint64_t)v62);
  if (v63 >= 0x48)

LABEL_102:
}

@end
