@implementation CATransaction

+ (id)_implicitAnimationForLayer:(id)a3 keyPath:(id)a4
{
  _OWORD *v6;
  id *v7;
  id result;

  v6 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = CA::Transaction::create(0);
  v7 = (id *)*((_QWORD *)v6 + 1);
  if (!v7)
    return (id)objc_msgSend(a3, "implicitAnimationForKeyPath:", a4);
  result = *v7;
  if (*v7)
    return (id)(*((uint64_t (**)(id, id, id))result + 2))(result, a3, a4);
  return result;
}

+ (void)flushAsRunLoopObserver
{
  uint64_t v2;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2 && **(_DWORD **)(v2 + 104) && (*(_BYTE *)(v2 + 116) & 1) != 0)
    CA::Transaction::flush_as_runloop_observer((CA::Transaction *)v2, 0);
}

+ (void)finishFrameWithToken:(unsigned int)a3
{
  CA::Transaction *v3;

  if (a3)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3)
      v3 = (CA::Transaction *)CA::Transaction::create(0);
    CA::Transaction::finish_frame(v3);
  }
}

+ (void)lock
{
  CA::Transaction *v2;
  int v3;

  v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  v3 = *((_DWORD *)v2 + 25);
  *((_DWORD *)v2 + 25) = v3 + 1;
  if (!v3)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
}

+ (void)unlock
{
  CA::Transaction *v2;

  v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::unlock(v2);
}

+ (unsigned)currentState
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 104);
  if (!*(_DWORD *)v3)
    return 0;
  v4 = *(unsigned __int8 *)(v3 + 204);
  if ((v4 & 1) != 0)
    v5 = 1;
  else
    v5 = 2;
  v6 = v5 | (2 * v4) & 4;
  if (*(_DWORD *)(v2 + 112))
    v6 |= 8u;
  return v6 | (8 * *(unsigned __int8 *)(v2 + 116)) & 0x10;
}

+ (unsigned)startFrameWithReason:(int)a3 beginTime:(double)a4 commitDeadline:(double)a5
{
  _OWORD *v8;
  uint64_t v9;
  double v10;

  if (a4 == 0.0 || a5 == 0.0)
    return 0;
  v8 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8)
    v8 = CA::Transaction::create((CA::Transaction *)a1);
  v9 = mach_absolute_time();
  v10 = CATimeWithHostTime(v9);
  return CA::Transaction::start_frame(*((_QWORD *)v8 + 13), a3, a4, v10, a5);
}

+ (void)setDisableActions:(BOOL)flag
{
  _BOOL4 v3;
  CA::Transaction *v4;

  v3 = flag;
  v4 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_BOOL_value(v4, v3, 0);
}

+ (BOOL)disableActions
{
  _OWORD *v2;
  char *v3;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v3 = (char *)v2 + 88;
  while (1)
  {
    v3 = *(char **)v3;
    if (!v3)
      break;
    if ((v3[28] & 1) != 0)
      return v3[24] & 1;
  }
  return 0;
}

+ (double)commitTime
{
  _OWORD *v2;
  int value;
  double result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v5[0] = 0;
  value = CA::Transaction::get_value(*((_QWORD *)v2 + 11), 109, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  result = *(double *)v5;
  if (!value)
    return 0.0;
  return result;
}

+ (void)activate
{
  CA::Transaction *v2;

  v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = (CA::Transaction *)CA::Transaction::create(0);
  if (!**((_DWORD **)v2 + 13))
    CA::Transaction::ensure_implicit(v2, 1);
}

+ (BOOL)addCommitHandler:(id)a3 forPhase:(int)a4
{
  uint64_t v4;
  _OWORD *v6;

  v4 = *(_QWORD *)&a4;
  v6 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = CA::Transaction::create(0);
  return CA::Transaction::add_commit_handler((uint64_t)v6, a3, v4);
}

+ (void)setUpdateDeadline:(double)a3
{
  uint64_t *v4;
  double v5;
  double v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  *(double *)v7 = a3;
  v4 = (uint64_t *)CA::Transaction::ensure_compat((CA::Transaction *)a1);
  v6 = 0.0;
  if (CA::Transaction::get_value(v4[11], 568, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v6))
  {
    v5 = v6;
    if (v6 > a3)
      v5 = a3;
    *(double *)v7 = v5;
  }
  CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x238, 18, (unsigned __int8 *)v7);
}

+ (void)setCommitTime:(double)a3
{
  CA::Transaction *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  *(double *)v4 = a3;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x6D, 18, (unsigned __int8 *)v4);
}

+ (void)flush
{
  CA::Transaction *v2;

  v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    if (**((_DWORD **)v2 + 13))
      CA::Transaction::flush(v2);
  }
}

+ (void)batch
{
  CA::Transaction *v2;

  v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  *(_BYTE *)(*((_QWORD *)v2 + 13) + 204) |= 0x40u;
}

+ (int)currentPhase
{
  _OWORD *v2;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  return *(_DWORD *)(*((_QWORD *)v2 + 13) + 56);
}

+ (void)commit
{
  CA::Transaction *v2;

  v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    if (**((_DWORD **)v2 + 13))
      CA::Transaction::pop(v2, a2);
  }
}

+ (void)activateBackground:(BOOL)a3
{
  _BOOL4 v3;
  CA::Transaction *v4;

  v3 = a3;
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)a1);
  if (**((_DWORD **)v4 + 13))
  {
    if (!v3)
      return;
  }
  else
  {
    CA::Transaction::ensure_implicit(v4, 0);
    if (!v3)
      return;
  }
  if (pthread_main_np())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CATransactionInvalidThread"), CFSTR("May not mark the main thread as a background transaction"));
  *((_BYTE *)v4 + 116) |= 4u;
}

+ (void)setImplicitTransactionDidBeginHandler:(id)a3
{
  _OWORD *v4;
  const void *v5;

  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = CA::Transaction::create((CA::Transaction *)a1);
  v5 = *(const void **)(*((_QWORD *)v4 + 13) + 112);
  if (v5)
  {
    _Block_release(v5);
    *(_QWORD *)(*((_QWORD *)v4 + 13) + 112) = 0;
  }
  if (a3)
    *(_QWORD *)(*((_QWORD *)v4 + 13) + 112) = _Block_copy(a3);
}

+ (void)setFrameStallSkipRequest:(BOOL)a3
{
  int v3;
  uint64_t *v4;
  BOOL v5;
  unsigned __int8 v6;
  BOOL v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
  v6 = 0;
  if (CA::Transaction::get_value(v4[11], 244, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v6))
    v5 = v6 == v3;
  else
    v5 = 0;
  if (!v5)
    CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0xF4, 7, (unsigned __int8 *)&v7);
  kdebug_trace();
}

+ (void)setFrameInputTime:(double)a3 withToken:(unsigned int)a4
{
  _OWORD *v5;

  if (a4)
  {
    v5 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5)
      v5 = CA::Transaction::create(0);
    CA::Transaction::set_frame_input_time(*((_QWORD *)v5 + 13), a3);
  }
}

+ (void)enableUpdateCycleSupport
{
  CA::Transaction::_update_cycle_support_enabled = 1;
}

+ (void)setAnimationDuration:(CFTimeInterval)dur
{
  CA::Transaction *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  *(CFTimeInterval *)v4 = dur;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x1D, 18, (unsigned __int8 *)v4);
}

+ (void)synchronize
{
  const __CFArray *v2;
  _OWORD *v3;
  _DWORD *v4;
  _QWORD *v5;
  CA::Context *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  pthread_mutex_t *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int *v13;
  BOOL v14;
  int v15;
  mach_port_name_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  pthread_mutex_t *v33;
  unsigned int v34;
  _DWORD *v35;
  unsigned int v36;
  void *v37;
  uint64_t *v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint32_t v48;
  void *v49;
  uint64_t *v50;
  const __CFString *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  int v62;
  uint64_t v63;
  unsigned int v64;
  malloc_zone_t *malloc_zone;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  unsigned int v69[2];
  unsigned int v70;
  mach_port_name_t name;
  CA::Context *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint8_t buf[4];
  _QWORD v77[3];
  _OWORD v78[8];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = CA::Transaction::create((CA::Transaction *)a1);
  v4 = (_DWORD *)*((_QWORD *)v3 + 13);
  if (*v4 && +[CATransaction(CATransactionPrivate) synchronize]::last_sync_seed == v4[50])
    NSLog(CFSTR("+[CATransaction synchronize] called within transaction"), a2);
  memset(v78, 0, sizeof(v78));
  v72 = (CA::Context *)16;
  v5 = CA::Context::retain_all_contexts(0, v78, (size_t *)&v72, 0, v2);
  v6 = v72;
  if (!v72)
    goto LABEL_95;
  v7 = v5;
  name = 0;
  v73 = 0u;
  v74 = 0u;
  v75 = 1065353216;
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::__rehash<true>((uint64_t)&v73, (unint64_t)(float)(unint64_t)v72);
  v8 = 0;
  v9 = 1;
  while (1)
  {
    v10 = (pthread_mutex_t *)(v7[v8] + 16);
    pthread_mutex_lock(v10);
    v11 = v7[v8];
    v12 = *(_DWORD *)(v11 + 128);
    if (v12 > *(_DWORD *)(v11 + 132) && !*(_QWORD *)(v11 + 104))
    {
      v15 = *(_DWORD *)(v11 + 160);
      if (v15)
      {
        if ((*(_BYTE *)(v11 + 241) & 2) == 0)
          break;
      }
    }
LABEL_10:
    pthread_mutex_unlock(v10);
    v8 = v9;
    v14 = (unint64_t)v6 > v9++;
    if (!v14)
      goto LABEL_31;
  }
  v16 = name;
  if (name - 1 < 0xFFFFFFFE
    || (v17 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name), v16 = name, name - 1 < 0xFFFFFFFE))
  {
    v18 = _CASSynchronize(v15, v16, -1, v9, v12, 0, 0);
    if ((_DWORD)v18)
    {
      v19 = v18;
      if ((_DWORD)v18 == 268435459)
      {
        *(_BYTE *)(v7[v8] + 241) |= 2u;
      }
      else if ((_DWORD)v18 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        v20 = *(unsigned int *)(v7[v8] + 4);
        v67 = v19;
        v68 = mach_error_string(v19);
        v66 = v20;
        x_log_();
      }
      else
      {
        v21 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v22 = *(_DWORD *)(v7[v8] + 4);
          v23 = mach_error_string(v19);
          *(_DWORD *)buf = 67109634;
          LODWORD(v77[0]) = v22;
          WORD2(v77[0]) = 1024;
          *(_DWORD *)((char *)v77 + 6) = v19;
          WORD1(v77[1]) = 2080;
          *(_QWORD *)((char *)&v77[1] + 4) = v23;
          _os_log_impl(&dword_184457000, v21, OS_LOG_TYPE_ERROR, "Failed to register commit sync (client=0x%x) [0x%x %s]", buf, 0x18u);
        }
      }
    }
    else
    {
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&v73, v9, v9);
    }
    goto LABEL_10;
  }
  v24 = v17;
  if (x_log_hook_p())
  {
    v25 = *(unsigned int *)(v7[v8] + 4);
    v67 = v24;
    v68 = mach_error_string(v24);
    v66 = v25;
    x_log_();
  }
  else
  {
    v26 = x_log_category_api;
    if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_DWORD *)(v7[v8] + 4);
      v28 = mach_error_string(v24);
      *(_DWORD *)buf = 67109634;
      LODWORD(v77[0]) = v27;
      WORD2(v77[0]) = 1024;
      *(_DWORD *)((char *)v77 + 6) = v24;
      WORD1(v77[1]) = 2080;
      *(_QWORD *)((char *)&v77[1] + 4) = v28;
      _os_log_impl(&dword_184457000, v26, OS_LOG_TYPE_ERROR, "Failed to make reply port for commit sync (client=0x%x) [0x%x %s]", buf, 0x18u);
    }
  }
  pthread_mutex_unlock(v10);
LABEL_31:
  if (*((_QWORD *)&v74 + 1))
  {
    v29 = 0;
    v30 = 0;
    while (2)
    {
      v70 = 0;
      *(_QWORD *)v69 = 0;
      switch(CA::Render::Context::wait_for_synchronize(name, &v70, &v69[1], v69, v13))
      {
        case 1u:
          v31 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&v73, v70);
          if (v31)
          {
            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(&v73, v31);
            v32 = v70 - 1;
            v33 = (pthread_mutex_t *)(v7[v32] + 16);
            pthread_mutex_lock(v33);
            v34 = v69[1];
            v35 = (_DWORD *)v7[v32];
            v36 = v35[33];
            if (v69[1] > v36)
            {
              v35[33] = v69[1];
              v36 = v34;
            }
            if (v69[0] > v35[34])
              v35[34] = v69[0];
            if (v36 > v35[32])
            {
              if (x_log_hook_p())
              {
                v66 = *(unsigned int *)(v7[v32] + 132);
                v67 = *(unsigned int *)(v7[v32] + 128);
                x_log_();
              }
              else
              {
                v60 = x_log_category_api;
                if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
                {
                  v61 = *(_DWORD *)(v7[v32] + 128);
                  v62 = *(_DWORD *)(v7[v32] + 132);
                  *(_DWORD *)buf = 67109376;
                  LODWORD(v77[0]) = v62;
                  WORD2(v77[0]) = 1024;
                  *(_DWORD *)((char *)v77 + 6) = v61;
                  _os_log_impl(&dword_184457000, v60, OS_LOG_TYPE_ERROR, "server/client commit_seed mismatch : sync server seed (%u) > client (%u)", buf, 0xEu);
                }
              }
              *(_DWORD *)(v7[v32] + 128) = *(_DWORD *)(v7[v32] + 132);
            }
            pthread_mutex_unlock(v33);
          }
          else
          {
            v49 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
            v50 = (uint64_t *)v74;
            if ((_QWORD)v74)
            {
              v51 = CFSTR("%u(%u:%x)");
              do
              {
                v52 = v7[*((_DWORD *)v50 + 4) - 1];
                v67 = *(unsigned int *)(v52 + 12);
                v68 = (char *)*(unsigned int *)(v52 + 4);
                objc_msgSend(v49, "appendFormat:", v51, *((unsigned int *)v50 + 4));
                v50 = (uint64_t *)*v50;
                v51 = CFSTR(",%u(%u:%x)");
              }
              while (v50);
            }
            v29 = (v29 + 1);
            if ((_DWORD)v29)
            {
              v66 = v29;
              objc_msgSend(v49, "appendFormat:", CFSTR("-%u"));
            }
            objc_msgSend(v49, "appendString:", CFSTR("]"), v66);
            if (x_log_hook_p())
            {
              v66 = v70;
              v67 = objc_msgSend(v49, "UTF8String");
              goto LABEL_72;
            }
            v57 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              v58 = v70;
              v59 = objc_msgSend(v49, "UTF8String");
              *(_DWORD *)buf = 67109378;
              LODWORD(v77[0]) = v58;
              WORD2(v77[0]) = 2080;
              *(_QWORD *)((char *)v77 + 6) = v59;
              v44 = v57;
              v45 = "bad index in commit sync reply : %u not in %s";
              v48 = 18;
              goto LABEL_62;
            }
          }
          goto LABEL_73;
        case 2u:
          v29 = (v29 + 1);
          if (x_log_hook_p())
            goto LABEL_72;
          v46 = x_log_category_api;
          if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            goto LABEL_73;
          *(_WORD *)buf = 0;
          v44 = v46;
          v45 = "dead reply from commit sync";
          goto LABEL_61;
        case 3u:
          v29 = (v29 + 1);
          if (x_log_hook_p())
            goto LABEL_72;
          v43 = x_log_category_api;
          if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            goto LABEL_73;
          *(_WORD *)buf = 0;
          v44 = v43;
          v45 = "unrecognized reply from commit sync";
          goto LABEL_61;
        case 4u:
          v37 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
          v38 = (uint64_t *)v74;
          if ((_QWORD)v74)
          {
            v39 = CFSTR("%u(%u:%x)");
            do
            {
              v40 = v7[*((_DWORD *)v38 + 4) - 1];
              objc_msgSend(v37, "appendFormat:", v39, *((unsigned int *)v38 + 4), *(unsigned int *)(v40 + 12), *(unsigned int *)(v40 + 4));
              v38 = (uint64_t *)*v38;
              v39 = CFSTR(",%u(%u:%x)");
            }
            while (v38);
          }
          if ((_DWORD)v29)
            objc_msgSend(v37, "appendFormat:", CFSTR("-%u"), v29);
          objc_msgSend(v37, "appendString:", CFSTR("]"), v66, v67, v68);
          v41 = (v30 + 1);
          v42 = x_log_hook_p();
          if ((int)v30 > 8)
          {
            if (v42)
            {
              v66 = objc_msgSend(v37, "UTF8String");
              x_log_();
            }
            else
            {
              v55 = x_log_category_api;
              if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
              {
                v56 = objc_msgSend(v37, "UTF8String");
                *(_DWORD *)buf = 136315138;
                v77[0] = v56;
                _os_log_impl(&dword_184457000, v55, OS_LOG_TYPE_ERROR, "excessive commit sync wait : %s", buf, 0xCu);
              }
            }
            v29 = (v29 + DWORD2(v74));
          }
          else if (v42)
          {
            v66 = (v30 + 1);
            v67 = objc_msgSend(v37, "UTF8String");
            x_log_();
          }
          else
          {
            v53 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              v54 = objc_msgSend(v37, "UTF8String");
              *(_DWORD *)buf = 67109378;
              LODWORD(v77[0]) = v30 + 1;
              WORD2(v77[0]) = 2080;
              *(_QWORD *)((char *)v77 + 6) = v54;
              _os_log_impl(&dword_184457000, v53, OS_LOG_TYPE_ERROR, "long commit sync wait %i : %s", buf, 0x12u);
            }
          }
          goto LABEL_74;
        default:
          if (x_log_hook_p())
          {
LABEL_72:
            x_log_();
          }
          else
          {
            v47 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v44 = v47;
              v45 = "unknown error while waiting for commit sync";
LABEL_61:
              v48 = 2;
LABEL_62:
              _os_log_impl(&dword_184457000, v44, OS_LOG_TYPE_ERROR, v45, buf, v48);
            }
          }
LABEL_73:
          v41 = v30;
LABEL_74:
          v30 = v41;
          if (*((_QWORD *)&v74 + 1) <= (unint64_t)v29)
            break;
          continue;
      }
      break;
    }
  }
  if (name - 1 < 0xFFFFFFFE)
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], name, 1u, -1);
  v63 = 0;
  v64 = 1;
  do
  {
    CA::Context::unref((CA::Context *)v7[v63], 0);
    v63 = v64;
    v14 = (unint64_t)v6 > v64++;
  }
  while (v14);
  if (v7 != (_QWORD *)v78)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v73);
LABEL_95:
  +[CATransaction(CATransactionPrivate) synchronize]::last_sync_seed = *(_DWORD *)(*((_QWORD *)v3 + 13) + 200);
}

+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)function
{
  CA::Transaction *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = function;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x1E, 2, (unsigned __int8 *)v4);
}

+ (void)setDisableRunLoopObserverCommits:(BOOL)a3
{
  _BOOL4 v3;
  _OWORD *v4;
  char v5;

  v3 = a3;
  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = CA::Transaction::create(0);
  if (v3)
    v5 = 8;
  else
    v5 = 0;
  *(_BYTE *)(*((_QWORD *)v4 + 13) + 204) = *(_BYTE *)(*((_QWORD *)v4 + 13) + 204) & 0xF7 | v5;
}

+ (void)setDefaultDisableRunLoopObserverCommits:(BOOL)a3
{
  _BOOL4 v3;
  _OWORD *v4;
  char v5;

  v3 = a3;
  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = CA::Transaction::create(0);
  if (v3)
    v5 = 16;
  else
    v5 = 0;
  *(_BYTE *)(*((_QWORD *)v4 + 13) + 204) = *(_BYTE *)(*((_QWORD *)v4 + 13) + 204) & 0xEF | v5;
}

+ (void)setCompletionBlock:(void *)block
{
  uint64_t *v4;
  BOOL v5;
  void *v6;
  uint64_t *v7;
  CA::Transaction::Continuation *v8;
  uint64_t v9;
  malloc_zone_t *malloc_zone;
  _QWORD *v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)CA::Transaction::ensure_compat((CA::Transaction *)a1);
  v14 = 0;
  if (CA::Transaction::get_value(v4[11], 110, (const CGAffineTransform *)5, (CA::Mat4Impl *)&v14))
    v5 = v14 == block;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = _Block_copy(block);
    v15[0] = v6;
    CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x6E, 5, (unsigned __int8 *)v15);
    v7 = (uint64_t *)v4[11];
    v9 = *v7;
    v8 = (CA::Transaction::Continuation *)v7[1];
    if (v8)
    {
      CA::Transaction::Continuation::unref(v8);
      v7[1] = 0;
    }
    if (v6)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v11 = malloc_type_zone_malloc(malloc_zone, 0x18uLL, 0x8BB15036uLL);
      if (v11)
      {
        if (v9)
        {
          v12 = *(unsigned int **)(v9 + 8);
          *(_DWORD *)v11 = 0;
          if (v12)
          {
            do
              v13 = __ldaxr(v12);
            while (__stlxr(v13 + 1, v12));
          }
        }
        else
        {
          v12 = 0;
        }
        v11[1] = v12;
        v11[2] = v6;
        *(_DWORD *)v11 = 1;
      }
      v7[1] = (uint64_t)v11;
    }
  }
}

+ (id)valueForKey:(NSString *)key
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  _OWORD *v9;
  int *v11;
  const char *v12;
  const char **v13;
  const char *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = CAInternAtom((const __CFString *)key, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = transaction_properties;
  while (1)
  {
    v8 = *v7;
    v7 += 12;
    if (v8 == v4)
      break;
    if (++v6 == 9)
    {
      v9 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (!v9)
        v9 = CA::Transaction::create(0);
      v15[0] = 0;
      if (CA::Transaction::get_value(*((_QWORD *)v9 + 11), v5, (const CGAffineTransform *)2, (CA::Mat4Impl *)v15))return (id)v15[0];
      else
        return 0;
    }
  }
  v11 = &transaction_properties[12 * v6];
  v14 = (const char *)*((_QWORD *)v11 + 4);
  v13 = (const char **)(v11 + 8);
  v12 = v14;
  if (!v14)
  {
    v12 = sel_registerName(*(const char **)&transaction_properties[12 * v6 + 4]);
    *v13 = v12;
  }
  return CA_valueForKey(a1, v12, transaction_properties[12 * v6 + 10]);
}

+ (void)setValue:(id)anObject forKey:(NSString *)key
{
  CA::Transaction *v6;
  CA::Transaction *v7;
  uint64_t v8;
  int *v9;
  int v10;
  CA::Transaction *v11;
  int *v12;
  const char *v13;
  const char **v14;
  const char *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = anObject;
  v6 = (CA::Transaction *)CAInternAtom((const __CFString *)key, 1);
  v7 = v6;
  v8 = 0;
  v9 = transaction_properties;
  while (1)
  {
    v10 = *v9;
    v9 += 12;
    if (v10 == (_DWORD)v6)
      break;
    if (++v8 == 9)
    {
      v11 = CA::Transaction::ensure_compat(v6);
      CA::Transaction::set_value(v11, v7, 2, (unsigned __int8 *)v16);
      return;
    }
  }
  v12 = &transaction_properties[12 * v8];
  v15 = (const char *)*((_QWORD *)v12 + 3);
  v14 = (const char **)(v12 + 6);
  v13 = v15;
  if (!v15)
  {
    v13 = sel_registerName(*(const char **)&transaction_properties[12 * v8 + 2]);
    *v14 = v13;
  }
  CA_setValueForKey(a1, v13, transaction_properties[12 * v8 + 10], anObject);
}

+ (CFTimeInterval)animationDuration
{
  _OWORD *v2;
  int value;
  CFTimeInterval result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v5[0] = 0;
  value = CA::Transaction::get_value(*((_QWORD *)v2 + 11), 29, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  result = *(double *)v5;
  if (!value)
    return 0.25;
  return result;
}

+ (void)setLowLatency:(BOOL)a3
{
  CA::Transaction *v3;
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create(0);
  CA::Transaction::set_value(v3, (const void *)0x165, 7, (unsigned __int8 *)&v4);
}

+ (CAMediaTimingFunction)animationTimingFunction
{
  _OWORD *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v4[0] = 0;
  if (CA::Transaction::get_value(*((_QWORD *)v2 + 11), 30, (const CGAffineTransform *)2, (CA::Mat4Impl *)v4))return (CAMediaTimingFunction *)v4[0];
  else
    return 0;
}

+ (void)completionBlock
{
  _OWORD *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v4[0] = 0;
  if (CA::Transaction::get_value(*((_QWORD *)v2 + 11), 110, (const CGAffineTransform *)5, (CA::Mat4Impl *)v4))return (void *)v4[0];
  else
    return 0;
}

+ (void)pushAnimator:(id)a3
{
  id v3;
  _OWORD *v4;
  uint64_t v5;
  malloc_zone_t *malloc_zone;
  _QWORD *v7;

  v3 = a3;
  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
  {
    v4 = CA::Transaction::create((CA::Transaction *)a1);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    v3 = _Block_copy(v3);
LABEL_4:
  v5 = *((_QWORD *)v4 + 1);
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v7 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
  *v7 = v3;
  v7[1] = v5;
  *((_QWORD *)v4 + 1) = v7;
}

+ (void)popAnimator
{
  _OWORD *v2;
  const void **v3;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create((CA::Transaction *)a1);
  v3 = (const void **)*((_QWORD *)v2 + 1);
  if (v3)
  {
    if (*v3)
    {
      _Block_release(*v3);
      v3 = (const void **)*((_QWORD *)v2 + 1);
    }
    *((_QWORD *)v2 + 1) = x_list_remove_head(v3);
  }
}

+ (id)animator
{
  _OWORD *v2;
  id *v3;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v3 = (id *)*((_QWORD *)v2 + 1);
  if (v3)
    return *v3;
  else
    return &__block_literal_global_16050;
}

+ (void)setCommitHandler:(id)a3
{
  objc_msgSend(a1, "addCommitHandler:forPhase:", a3, 1);
}

+ (void)setPresentationHandler:(id)a3 queue:(id)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  if (a3)
    a3 = _Block_copy(a3);
  if (CA::Transaction::presentation_handler)
    _Block_release((const void *)CA::Transaction::presentation_handler);
  if (CA::Transaction::presentation_handler_queue)
    dispatch_release((dispatch_object_t)CA::Transaction::presentation_handler_queue);
  CA::Transaction::presentation_handler = (uint64_t)a3;
  CA::Transaction::presentation_handler_queue = (uint64_t)a4;
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
}

+ (BOOL)disableImplicitTransactionMainThreadAssert
{
  _OWORD *v2;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  return (*((unsigned __int8 *)v2 + 116) >> 3) & 1;
}

+ (void)setDisableImplicitTransactionMainThreadAssert:(BOOL)a3
{
  _BOOL4 v3;
  _OWORD *v4;
  char v5;

  v3 = a3;
  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v4 || (v4 = CA::Transaction::create(0)) != 0)
  {
    if (v3)
      v5 = 8;
    else
      v5 = 0;
    *((_BYTE *)v4 + 116) = *((_BYTE *)v4 + 116) & 0xF7 | v5;
  }
}

+ (BOOL)animatesFromModelValues
{
  _OWORD *v2;
  BOOL result;
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v4 = 0;
  result = CA::Transaction::get_value(*((_QWORD *)v2 + 11), 27, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v4);
  if (!v4)
    return 0;
  return result;
}

+ (void)setAnimatesFromModelValues:(BOOL)a3
{
  CA::Transaction *v3;
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x1B, 7, (unsigned __int8 *)&v4);
}

+ (BOOL)disableSignPosts
{
  _OWORD *v2;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  return (*(unsigned __int8 *)(*((_QWORD *)v2 + 13) + 204) >> 5) & 1;
}

+ (void)setDisableSignPosts:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  char v5;

  v3 = a3;
  v4 = *((_QWORD *)CA::Transaction::ensure_compat((CA::Transaction *)a1) + 13);
  if (v3)
    v5 = 32;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 204) = *(_BYTE *)(v4 + 204) & 0xDF | v5;
}

+ (double)updateDeadline
{
  _OWORD *v2;
  int value;
  double result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v5[0] = 0;
  value = CA::Transaction::get_value(*((_QWORD *)v2 + 11), 568, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  result = *(double *)v5;
  if (!value)
    return 0.0;
  return result;
}

+ (double)earliestAutomaticCommitTime
{
  _OWORD *v2;
  int value;
  double result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  v5[0] = 0;
  value = CA::Transaction::get_value(*((_QWORD *)v2 + 11), 188, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  result = *(double *)v5;
  if (!value)
    return 0.0;
  return result;
}

+ (void)setEarliestAutomaticCommitTime:(double)a3
{
  CA::Transaction *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  *(double *)v4 = a3;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0xBC, 18, (unsigned __int8 *)v4);
}

+ (BOOL)disableRunLoopObserverCommits
{
  _OWORD *v2;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  return (*(unsigned __int8 *)(*((_QWORD *)v2 + 13) + 204) >> 3) & 1;
}

+ (BOOL)defaultDisableRunLoopObserverCommits
{
  _OWORD *v2;

  v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = CA::Transaction::create(0);
  return (*(unsigned __int8 *)(*((_QWORD *)v2 + 13) + 204) >> 4) & 1;
}

+ (double)inputTime
{
  uint64_t v2;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
    return *(double *)(*(_QWORD *)(v2 + 104) + 192);
  else
    return 0.0;
}

+ (void)setInputTime:(double)a3
{
  _OWORD *v4;

  if (a3 != 0.0)
  {
    v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v4)
      v4 = CA::Transaction::create(0);
    CA::Transaction::set_frame_input_time(*((_QWORD *)v4 + 13), a3);
  }
}

+ (BOOL)frameStallSkipRequest
{
  uint64_t v2;
  char value;
  BOOL result;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 0;
  v5 = 0;
  value = CA::Transaction::get_value(*(_QWORD *)(v2 + 88), 244, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v5);
  result = v5 != 0;
  if ((value & 1) == 0)
    return 0;
  return result;
}

+ (unint64_t)remoteInputMachTime
{
  uint64_t v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2
    && (v4[0] = 0,
        (CA::Transaction::get_value(*(_QWORD *)(v2 + 88), 454, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)v4) & 1) != 0))
  {
    return v4[0];
  }
  else
  {
    return 0;
  }
}

+ (void)setRemoteInputMachTime:(unint64_t)a3
{
  uint64_t *v4;
  BOOL v5;
  unint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  if (a3)
  {
    v4 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v4)
      v4 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
    v6 = -1;
    if (CA::Transaction::get_value(v4[11], 454, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)&v6))
      v5 = v6 > a3;
    else
      v5 = 1;
    if (v5)
      CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x1C6, 16, (unsigned __int8 *)v7);
  }
}

+ (double)beginTime
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 1.79769313e308;
  result = *(double *)(*(_QWORD *)(v2 + 104) + 176);
  if (result == 0.0)
    return 1.79769313e308;
  return result;
}

+ (void)setBeginTime:(double)a3
{
  _OWORD *v4;

  v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = CA::Transaction::create(0);
  CA::Transaction::set_frame_begin_time(*((_QWORD *)v4 + 13), a3);
}

+ (BOOL)lowLatency
{
  uint64_t v2;
  char value;
  BOOL result;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 0;
  v5 = 0;
  value = CA::Transaction::get_value(*(_QWORD *)(v2 + 88), 357, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v5);
  result = v5 != 0;
  if ((value & 1) == 0)
    return 0;
  return result;
}

+ (BOOL)emptyLowLatency
{
  uint64_t v2;
  char value;
  BOOL result;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 0;
  v5 = 0;
  value = CA::Transaction::get_value(*(_QWORD *)(v2 + 88), 207, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v5);
  result = v5 != 0;
  if ((value & 1) == 0)
    return 0;
  return result;
}

+ (void)setEmptyLowLatency:(BOOL)a3
{
  CA::Transaction *v3;
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create(0);
  CA::Transaction::set_value(v3, (const void *)0xCF, 7, (unsigned __int8 *)&v4);
}

+ (unsigned)generateSeed
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  unsigned int v6;

  v2 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    v2 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
  v3 = v2[13];
  if (!*(_DWORD *)v3)
  {
    CA::Transaction::ensure_implicit((CA::Transaction *)v2, 1);
    v3 = v2[13];
  }
  *(_BYTE *)(v3 + 204) |= 4u;
  v4 = mach_absolute_time();
  v5 = CATimeWithHostTime(v4);
  CA::Transaction::set_frame_begin_time(v2[13], v5);
  v6 = *(_DWORD *)(v2[13] + 200);
  getpid();
  kdebug_trace();
  return v6;
}

+ (void)assertInactive
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  char **v6;
  char **v7;
  unint64_t v8;
  NSObject *v9;
  char *v10;
  size_t v11;
  const char *v12;
  char *v13;
  char *v14;
  int i;
  uint64_t v16;
  char *v17;
  int v18;
  unsigned int v19;
  int v21;
  NSObject *v22;
  const char *v23;
  void **v24;
  uint8_t buf[32];
  uint8_t v26[4];
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 104);
    if (*(_DWORD *)v3)
    {
      if (!CA::Transaction::_debug_transactions)
      {
        if (x_log_hook_p())
        {
          x_log_();
          abort();
        }
        v4 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184457000, v4, OS_LOG_TYPE_DEFAULT, "CoreAnimation: warning, encountered thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in en"
            "vironment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transacti"
            "on isn't created on a main thread.\n",
            buf,
            2u);
        }
        abort();
      }
      x_log_begin();
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        v5 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184457000, v5, OS_LOG_TYPE_DEFAULT, "CoreAnimation: warning, encountered thread with uncommitted CATransaction; created by:\n",
            buf,
            2u);
        }
      }
      v6 = backtrace_symbols(*(void *const **)(v3 + 240), *(unsigned __int16 *)(v3 + 206));
      if (v6)
      {
        v7 = v6;
        memset(buf, 0, 24);
        if (*(_WORD *)(v3 + 206))
        {
          v8 = 0;
          do
          {
            if (x_log_hook_p())
            {
              x_log_();
            }
            else
            {
              v9 = x_log_category_api;
              if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
              {
                v10 = v7[v8];
                *(_DWORD *)v26 = 136315138;
                v27 = v10;
                _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_DEFAULT, "%s\n", v26, 0xCu);
              }
            }
            v11 = strlen(v7[v8]);
            x_stream_write((uint64_t)buf, v7[v8], v11);
            x_stream_write((uint64_t)buf, "\n", 1uLL);
            ++v8;
          }
          while (v8 < *(unsigned __int16 *)(v3 + 206));
        }
        free(v7);
        v12 = x_stream_finish((uint64_t)buf);
        if (v12)
        {
          v13 = (char *)v12;
          x_log_crash("%s", v12);
          free(v13);
        }
        else
        {
          x_log_crash(0);
        }
      }
      v24 = (void **)x_stream_pop_(0);
      v14 = x_stream_get(v24);
      for (i = 0; ; i += v21)
      {
        v16 = 0;
        v17 = &v14[i];
        v18 = -1;
        while (1)
        {
          if (v17[v16] == 10)
          {
            v18 = v16;
            goto LABEL_31;
          }
          if (!v17[v16])
            break;
LABEL_31:
          ++v16;
          v19 = 32512;
          if (v16 == 32512)
            goto LABEL_32;
        }
        v19 = v16;
LABEL_32:
        if (v18 <= -1 || v17[v19] == 0)
          v21 = v19;
        else
          v21 = v18 + 1;
        if (v21 <= 0)
        {
          x_log_end_free_(v24);
          abort();
        }
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          v22 = x_log_category_api;
          if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            if (i)
              v23 = "continued...\n";
            else
              v23 = "";
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = v21;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = &v14[i];
            _os_log_impl(&dword_184457000, v22, OS_LOG_TYPE_DEFAULT, "%s%.*s", buf, 0x1Cu);
          }
        }
      }
    }
  }
}

+ (unsigned)registerBoolKey
{
  unsigned int v2;
  unsigned int result;

  v2 = atomic_load((unsigned int *)&CA::_BOOL_key);
  if (v2 > 0x1F)
    __assert_rtn("register_BOOL_key", "CATransactionInternal.mm", 1271, "_BOOL_key < CHAR_BIT * sizeof (Level::_BOOL_values)");
  do
    result = __ldaxr((unsigned int *)&CA::_BOOL_key);
  while (__stlxr(result + 1, (unsigned int *)&CA::_BOOL_key));
  return result;
}

+ (BOOL)BOOLValueForKey:(unsigned int)a3
{
  uint64_t v3;
  int v4;
  uint64_t *v5;

  v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v3)
  {
    if (a3 >= 0x20)
      __assert_rtn("BOOL_value", "CATransactionInternal.mm", 1279, "key < (CHAR_BIT * sizeof (Level::_BOOL_values))");
    v4 = 1 << a3;
    v5 = (uint64_t *)(v3 + 88);
    while (1)
    {
      v5 = (uint64_t *)*v5;
      if (!v5)
        break;
      if ((*((_DWORD *)v5 + 7) & v4) != 0)
        return ((_DWORD)v5[3] & v4) != 0;
    }
  }
  return 0;
}

+ (void)setBoolValue:(BOOL)a3 forKey:(unsigned int)a4
{
  _BOOL4 v5;
  CA::Transaction *v6;

  v5 = a3;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_BOOL_value(v6, v5, a4);
}

+ (id)committingContexts
{
  uint64_t v2;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
    return *(id *)(*(_QWORD *)(v2 + 104) + 120);
  else
    return 0;
}

+ (void)setCommittingContexts:(id)a3
{
  CA::Transaction *v4;

  v4 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  X::CFRef<__CFDictionary const*>::operator=((const void **)(*((_QWORD *)v4 + 13) + 120), a3);
}

+ (BOOL)batchWithDefaultServerObserver:(id)a3
{
  CA::Transaction *v4;
  char v5;
  CA::Transaction *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  malloc_zone_t *malloc_zone;
  _QWORD *v12;

  v4 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  *(_BYTE *)(*((_QWORD *)v4 + 13) + 204) |= 0x40u;
  v5 = *((_BYTE *)v4 + 116);
  if ((v5 & 2) == 0)
  {
    v6 = v4;
    v7 = *((_QWORD *)v4 + 13);
    if (!*(_DWORD *)v7)
    {
      CA::Transaction::ensure_implicit(v4, 1);
      v7 = *((_QWORD *)v6 + 13);
    }
    v8 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v8 + 1;
    if (!v8)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v9 = *(_QWORD *)(v7 + 48);
    v10 = _Block_copy(a3);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v12 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
    *v12 = v10;
    v12[1] = v9;
    *(_QWORD *)(v7 + 48) = v12;
    CA::Transaction::unlock(v6);
  }
  return (v5 & 2) == 0;
}

uint64_t __47__CATransaction_CATransactionPrivate__animator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "implicitAnimationForKeyPath:");
}

@end
