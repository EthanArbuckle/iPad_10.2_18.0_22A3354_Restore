@implementation SIFlushAndSuspendIndex

void __SIFlushAndSuspendIndex_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  int8x16_t *v12;
  uint64_t v13;
  int8x16_t *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  int v34;
  char v35;
  char v36;
  uint64_t v37;
  unsigned int *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t i;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 676))
    return;
  makeThreadId();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  pthread_mutex_lock(&gSuspensionMutex);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 768) = 0;
  *((_QWORD *)&v47 + 1) = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_DWORD *)(v2 + 60) & 0xFFFFFFFE) == 2)
  {
    v3 = 0;
  }
  else
  {
    v4 = si_scheduler_suspend_async(*(_QWORD *)(v2 + 952));
    v3 = (uint64_t)v4;
    if (v4)
    {
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 + 1, v4));
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 768) = v4;
    *((_QWORD *)&v47 + 1) = v4;
    v2 = *(_QWORD *)(a1 + 40);
  }
  v6 = si_scheduler_suspend_async(*(_QWORD *)(v2 + 872));
  v7 = (uint64_t)v6;
  if (v6)
  {
    do
      v8 = __ldaxr(v6);
    while (__stlxr(v8 + 1, v6));
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 688) = v6;
  *((_QWORD *)&v42 + 1) = v6;
  pthread_mutex_unlock(&gSuspensionMutex);
  v9 = dispatch_group_create();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 11;
  v10 = si_scheduler_wait_on_suspend_token(v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 676)
    || (v10 & si_scheduler_wait_on_suspend_token(v7)) != 1
    || (v11 = *(_QWORD *)(a1 + 40), !*(_DWORD *)(v11 + 676)))
  {
LABEL_76:
    for (i = 0; i != 144; i += 8)
      si_scheduler_resume_with_token(*(unsigned int **)((char *)&v42 + i));
    return;
  }
  if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(v11 + 1184) && *(_QWORD *)(v11 + 1040) && *(_QWORD *)(v11 + 1048))
  {
    v12 = (int8x16_t *)malloc_type_calloc(1uLL, 0x90uLL, 0x10B00402663C8FFuLL);
    v13 = (uint64_t)v12;
    v14 = *(int8x16_t **)(v11 + 2360);
    if (v14)
    {
      v12[2].i64[0] = v14[8].i64[1];
      v12[1] = vextq_s8(*v14, *v14, 8uLL);
    }
    v12[8].i8[10] = 0;
    v12->i64[0] = v11;
    v12[4].i64[0] = 0;
    si_indexDeleteDeferredItems(v11);
    CIPurgeTokenizers();
    SILanguageModelPurge();
    flushGraphCache(v11);
    si_enqueue_work_with_qos(*(_QWORD *)(v11 + 1040), 25, (uint64_t)syncIndex, v13);
    dispatch_group_enter(v9);
    si_enqueue_work_with_qos(*(_QWORD *)(v11 + 1040), 25, (uint64_t)si_dispatch_leave_routine, (uint64_t)v9);
  }
  pthread_mutex_lock(&gSuspensionMutex);
  v15 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 676);
  v16 = 1;
  if (v15)
  {
    v17 = 2;
    while (v17 <= 0xB)
    {
      if (((1 << v17) & 0xB84) == 0)
      {
        if ((_DWORD)v17 != 4)
          break;
        v18 = *(_QWORD *)(a1 + 40);
        if (!*(_QWORD *)(v18 + 2448))
          goto LABEL_29;
      }
LABEL_23:
      if (++v17 == 18)
      {
        v16 = 0;
        goto LABEL_33;
      }
    }
    v18 = *(_QWORD *)(a1 + 40);
LABEL_29:
    v19 = *(_QWORD *)(v18 + 8 * v17 + 864);
    if (v19)
    {
      v20 = si_scheduler_suspend_async(v19);
      if (v20)
      {
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 + 1, v20));
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v17 + 680) = v20;
      *((_QWORD *)&v42 + v17) = v20;
    }
    goto LABEL_23;
  }
LABEL_33:
  pthread_mutex_unlock(&gSuspensionMutex);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_DWORD *)(*(_QWORD *)(v22 + 8) + 24);
  if (v23 > 17)
  {
    v24 = 1;
  }
  else
  {
    do
    {
      if (v23 <= 0xB
        && (((1 << v23) & 0xB84) != 0 || v23 == 4 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2448)))
      {
        v24 = 1;
      }
      else
      {
        v24 = si_scheduler_wait_on_suspend_token(*((_QWORD *)&v42 + v23));
        v22 = *(_QWORD *)(a1 + 32);
      }
      ++*(_DWORD *)(*(_QWORD *)(v22 + 8) + 24);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_DWORD *)(*(_QWORD *)(v22 + 8) + 24);
    }
    while (v23 <= 17 && (v24 & 1) != 0);
  }
  if (v15)
  {
    pthread_mutex_lock(&gSuspensionMutex);
    v25 = *(_QWORD *)(a1 + 40);
    if (*(_DWORD *)(v25 + 676))
    {
      v26 = si_scheduler_suspend_async(*(_QWORD *)(v25 + 880));
      if (v26)
      {
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 + 1, v26));
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 696) = v26;
      *(_QWORD *)&v43 = v26;
      v28 = si_scheduler_suspend_async(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 920));
      if (v28)
      {
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 + 1, v28));
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 736) = v28;
      *((_QWORD *)&v45 + 1) = v28;
      v30 = si_scheduler_suspend_async(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 928));
      if (v30)
      {
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 + 1, v30));
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 744) = v30;
      *(_QWORD *)&v46 = v30;
      v32 = si_scheduler_suspend_async(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 936));
      if (v32)
      {
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 + 1, v32));
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 752) = v32;
      *((_QWORD *)&v46 + 1) = v32;
    }
    else
    {
      v16 = 1;
    }
    pthread_mutex_unlock(&gSuspensionMutex);
    v22 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(*(_QWORD *)(v22 + 8) + 24) = 2;
  if (!v24)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 7;
    goto LABEL_63;
  }
  v34 = si_scheduler_wait_on_suspend_token(v43);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 7;
  if (!v34)
  {
LABEL_63:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 8;
    goto LABEL_64;
  }
  v35 = si_scheduler_wait_on_suspend_token(*((uint64_t *)&v45 + 1));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 8;
  if ((v35 & 1) == 0)
  {
LABEL_64:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 9;
    goto LABEL_65;
  }
  v36 = si_scheduler_wait_on_suspend_token(v46);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 9;
  if ((v36 & 1) != 0)
    si_scheduler_wait_on_suspend_token(*((uint64_t *)&v46 + 1));
LABEL_65:
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (v16 || (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 2439) & 1) != 0)
    goto LABEL_76;
  pthread_mutex_lock(&gSuspensionMutex);
  v37 = *(_QWORD *)(a1 + 40);
  if (!*(_DWORD *)(v37 + 676))
  {
    pthread_mutex_unlock(&gSuspensionMutex);
    goto LABEL_76;
  }
  v38 = si_scheduler_suspend_async(*(_QWORD *)(v37 + 864));
  if (v38)
  {
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 + 1, v38));
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680) = v38;
  *(_QWORD *)&v42 = v38;
  pthread_mutex_unlock(&gSuspensionMutex);
  if (*(_BYTE *)(a1 + 48))
    SISyncIndex(*(_QWORD *)(a1 + 40));
  v40 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 672) = 1;
  do
  {
    release_token(*(unsigned int **)((char *)&v42 + v40));
    v40 += 8;
  }
  while (v40 != 144);
}

dispatch_queue_t __SIFlushAndSuspendIndex_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("index flush suspend queue", 0);
  gFlushSuspendQueue = (uint64_t)result;
  return result;
}

@end
