void geo_assert_isolated(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_owner(a1 + 4);
}

void _geo_isolate_unlock(os_unfair_lock_s **a1)
{
  os_unfair_lock_unlock(*a1 + 4);
}

void geo_assert_not_isolated(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_not_owner(a1 + 4);
}

uint64_t _geo_isolate_lock_data()
{
  return os_unfair_lock_lock_with_options();
}

uint64_t _geo_isolate_lock()
{
  return os_unfair_lock_lock_with_options();
}

id GEOGetUserSessionLog()
{
  if (qword_1ECE24550 != -1)
    dispatch_once(&qword_1ECE24550, &__block_literal_global_15);
  return (id)qword_1ECE24548;
}

dispatch_queue_t geo_dispatch_queue_create_with_workloop_qos(const char *a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *global_workloop;
  dispatch_queue_t v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, (dispatch_qos_class_t)a2, 0);
  v5 = objc_claimAutoreleasedReturnValue();

  global_workloop = geo_get_global_workloop(a2);
  v7 = dispatch_queue_create_with_target_V2(a1, v5, global_workloop);

  return v7;
}

void geo_reentrant_isolate_sync(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  id v6;

  v3 = a1;
  v4 = a2;
  v6 = v3;
  v5 = (void (**)(_QWORD))v4;
  os_unfair_recursive_lock_lock_with_options();
  v5[2](v5);
  os_unfair_recursive_lock_unlock();

}

void sub_1D51BB784(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1D51BB798(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void geo_reentrant_isolate_sync_data(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  id v6;

  v3 = a1;
  v4 = a2;
  v6 = v3;
  v5 = (void (**)(_QWORD))v4;
  os_unfair_recursive_lock_lock_with_options();
  v5[2](v5);
  os_unfair_recursive_lock_unlock();

}

void sub_1D51BB82C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1D51BB840(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _GEOCreateTransaction(char *__format, ...)
{
  char __str[16];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  uint64_t v34;
  va_list va;

  va_start(va, __format);
  v34 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  vsnprintf(__str, 0x1F4uLL, __format, va);
  return (id)os_transaction_create();
}

dispatch_queue_t geo_dispatch_queue_create_with_qos(const char *a1, dispatch_qos_class_t a2)
{
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, a2, 0);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = dispatch_queue_create(a1, v5);
  return v6;
}

geo_isolater *geo_isolater_create(uint64_t a1)
{
  return -[geo_isolater initWithName:]([geo_isolater alloc], "initWithName:", a1);
}

id GEOGetTileLoadingLog()
{
  if (qword_1ECE24520 != -1)
    dispatch_once(&qword_1ECE24520, &__block_literal_global_9);
  return (id)qword_1ECE24518;
}

void geo_dispatch_async_qos(uint64_t a1, void *a2)
{
  id v3;
  NSObject *global_queue;

  v3 = a2;
  global_queue = geo_get_global_queue(a1);
  dispatch_async(global_queue, v3);

}

geo_reentrant_isolater *geo_reentrant_isolater_create_with_format(char *__format, ...)
{
  char __str[100];
  uint64_t v3;
  va_list va;

  va_start(va, __format);
  v3 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x64uLL, __format, va);
  return -[geo_reentrant_isolater initWithName:]([geo_reentrant_isolater alloc], "initWithName:", __str);
}

geo_isolater *geo_isolater_create_with_format(char *__format, ...)
{
  char __str[100];
  uint64_t v3;
  va_list va;

  va_start(va, __format);
  v3 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x64uLL, __format, va);
  return -[geo_isolater initWithName:]([geo_isolater alloc], "initWithName:", __str);
}

dispatch_queue_t geo_dispatch_queue_create_with_format(char *__format, ...)
{
  char __str[100];
  uint64_t v3;
  va_list va;

  va_start(va, __format);
  v3 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x64uLL, __format, va);
  return geo_dispatch_queue_create_with_target(__str, 0);
}

dispatch_queue_t geo_dispatch_queue_create_with_target(const char *a1, NSObject *a2)
{
  NSObject *v4;
  dispatch_queue_t v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create_with_target_V2(a1, v4, a2);

  return v5;
}

NSObject *geo_dispatch_timer_create_on_qos(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9;
  NSObject *global_workloop;
  NSObject *v11;

  v9 = a2;
  global_workloop = geo_get_global_workloop(a1);
  v11 = geo_dispatch_timer_create_on_queue(global_workloop, v9, a3, a4, a5);

  return v11;
}

void __geo_isolate_async_block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD);
  os_unfair_lock_s *v3;

  v1 = *(void **)(a1 + 40);
  v3 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  v2 = v1;
  os_unfair_lock_lock_with_options();
  v2[2](v2);
  os_unfair_lock_unlock(v3 + 4);

}

void sub_1D51BBE4C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1D51BBE60(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

NSObject *geo_dispatch_timer_create_on_queue(NSObject *a1, void *a2, double a3, double a4, double a5)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  dispatch_time_t v13;
  NSObject *v14;

  v9 = a2;
  v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1);
  v11 = v10;
  if (v10)
  {
    if (a4 == -1.0)
      v12 = -1;
    else
      v12 = (unint64_t)(a4 * 1000000000.0);
    dispatch_source_set_event_handler(v10, v9);
    v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, v12, (unint64_t)(a5 * 1000000.0));
    v14 = v11;
  }

  return v11;
}

uint64_t geo_get_global_workloop(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1 | 0x2000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v3 = (void *)qword_1ECE244D0;
  if (!qword_1ECE244D0)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECE244D0;
    qword_1ECE244D0 = v4;

    v3 = (void *)qword_1ECE244D0;
  }
  objc_msgSend(v3, "objectForKey:", v2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.x%x"), CFSTR("com.apple.geo.global.queue."), a1);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    geo_dispatch_workloop_create_with_qos((const char *)objc_msgSend(v7, "UTF8String"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECE244D0, "setObject:forKey:", v6, v2);

  }
  os_unfair_lock_unlock(&stru_1ECE244C4);

  return v6;
}

uint64_t geo_get_global_queue(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1 | 0x1000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v3 = (void *)qword_1ECE244D0;
  if (!qword_1ECE244D0)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECE244D0;
    qword_1ECE244D0 = v4;

    v3 = (void *)qword_1ECE244D0;
  }
  objc_msgSend(v3, "objectForKey:", v2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.x%x"), CFSTR("com.apple.geo.global.queue."), a1);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    geo_dispatch_workloop_create_with_qos((const char *)objc_msgSend(v7, "UTF8String"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECE244D0, "setObject:forKey:", v6, v2);

  }
  os_unfair_lock_unlock(&stru_1ECE244C4);

  return v6;
}

uint64_t GEOXPCServerTypeForIdentifier(void *a1)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = (_BYTE *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  LOBYTE(v2) = *v1;
  if (!*v1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v2 = (char)v2;
    if ((v3 & 1) != 0)
      v2 = 0;
    v4 += v2;
    if (v3 > 0x30)
      break;
    v2 = v1[++v3];
  }
  while (v2);
  if (v4 > 612)
  {
    if (v4 > 758)
    {
      v5 = 11;
      v20 = 13;
      v21 = 12;
      if (v4 != 1755)
        v21 = 0;
      if (v4 != 961)
        v20 = v21;
      if (v4 != 881)
        v5 = v20;
      v7 = 14;
      v22 = 10;
      v23 = 8;
      if (v4 != 770)
        v23 = 0;
      if (v4 != 766)
        v22 = v23;
      if (v4 != 759)
        v7 = v22;
      v10 = v4 <= 880;
    }
    else
    {
      v5 = 23;
      v12 = 5;
      v13 = 17;
      if (v4 != 722)
        v13 = 0;
      if (v4 != 661)
        v12 = v13;
      if (v4 != 651)
        v5 = v12;
      v7 = 22;
      v14 = 24;
      v15 = 19;
      if (v4 != 645)
        v15 = 0;
      if (v4 != 636)
        v14 = v15;
      if (v4 != 613)
        v7 = v14;
      v10 = v4 <= 650;
    }
  }
  else if (v4 > 503)
  {
    v5 = 15;
    v16 = 7;
    v17 = 21;
    if (v4 != 605)
      v17 = 0;
    if (v4 != 589)
      v16 = v17;
    if (v4 != 568)
      v5 = v16;
    v7 = 9;
    v18 = 3;
    v19 = 20;
    if (v4 != 560)
      v19 = 0;
    if (v4 != 528)
      v18 = v19;
    if (v4 != 504)
      v7 = v18;
    v10 = v4 <= 567;
  }
  else
  {
    v5 = 2;
    v6 = 18;
    if (v4 != 448)
      v6 = v4 == 453;
    if (v4 != 435)
      v5 = v6;
    v7 = 4;
    v8 = 16;
    v9 = 6;
    if (v4 != 433)
      v9 = 0;
    if (v4 != 339)
      v8 = v9;
    if (v4 != 134)
      v7 = v8;
    v10 = v4 <= 434;
  }
  if (v10)
    return v7;
  else
    return v5;
}

void geo_isolate_async(void *a1, NSObject *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a1;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __geo_isolate_async_block_invoke;
  v9[3] = &unk_1E994C0C0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(a2, v9);

}

void geo_isolate_sync(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  os_unfair_lock_s *v6;

  v3 = a1;
  v4 = a2;
  v6 = (os_unfair_lock_s *)v3;
  v5 = (void (**)(_QWORD))v4;
  os_unfair_lock_lock_with_options();
  v5[2](v5);
  os_unfair_lock_unlock(v6 + 4);

}

void sub_1D51BC41C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1D51BC430(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void geo_isolate_sync_data(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  os_unfair_lock_s *v6;

  v3 = a1;
  v4 = a2;
  v6 = (os_unfair_lock_s *)v3;
  v5 = (void (**)(_QWORD))v4;
  os_unfair_lock_lock_with_options();
  v5[2](v5);
  os_unfair_lock_unlock(v6 + 4);

}

void sub_1D51BC4C4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1D51BC4D8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

NSObject *geo_dispatch_workloop_create_with_qos(const char *a1)
{
  NSObject *inactive;

  inactive = dispatch_workloop_create_inactive(a1);
  dispatch_workloop_set_qos_class_floor();
  dispatch_activate(inactive);
  return inactive;
}

dispatch_queue_t geo_dispatch_queue_create(const char *a1)
{
  return geo_dispatch_queue_create_with_target(a1, 0);
}

id GEOGetUserDefaultsLog()
{
  if (qword_1ECE24530 != -1)
    dispatch_once(&qword_1ECE24530, &__block_literal_global_11);
  return (id)qword_1ECE24528;
}

const __CFString *GEOXPCServerIdentifierForType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x17)
    return CFSTR("_any_");
  else
    return off_1E994BEF8[a1 - 1];
}

id GEOGetResourceManifestLog()
{
  if (qword_1ECE24500 != -1)
    dispatch_once(&qword_1ECE24500, &__block_literal_global_5);
  return (id)qword_1ECE244F8;
}

void sub_1D51BCC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GEOGetStateCaptureLog()
{
  if (qword_1ECE24488 != -1)
    dispatch_once(&qword_1ECE24488, &__block_literal_global_25);
  return (id)qword_1ECE24480;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __47__geo_state_capture_handle__capturePlistState___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "captureStatePlistWithHints:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void GEORegisterPListStateCaptureLegacy(unint64_t *a1, void *a2, unsigned int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  uint8_t buf[2];
  __int16 v25;

  v13 = a2;
  v14 = a4;
  v15 = a5;
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    v25 = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "Assertion failed: legacyHandle != ((void *)0)";
    v23 = (uint8_t *)&v25;
LABEL_14:
    _os_log_fault_impl(&dword_1D51BA000, v21, OS_LOG_TYPE_FAULT, v22, v23, 2u);
    goto LABEL_9;
  }
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "Assertion failed: self != ((void *)0)";
    v23 = buf;
    goto LABEL_14;
  }
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v15, &a9);
  _GEORegisterPListStateCaptureAtFrequency(a3, v14, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    do
      v18 = __ldaxr((unint64_t *)&qword_1ECE24470);
    while (__stlxr(v18 + 1, (unint64_t *)&qword_1ECE24470));
    *a1 = v18;
    v19 = (void *)qword_1ECE24478;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v20);

  }
LABEL_9:

}

geo_state_capture_handle *_GEORegisterPListStateCaptureAtFrequency(unsigned int a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  geo_state_capture_handle *v11;
  geo_state_capture_handle *v12;
  uint64_t v13;
  NSData *description;
  id v15;
  uint64_t v16;
  geo_state_capture_handle *v17;
  id v19;
  id location[2];

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(geo_state_capture_handle);
  v12 = v11;
  if (v11)
  {
    v11->_frequency = a1;
    objc_storeWeak((id *)&v11->_weakStateCapturing, v9);
    objc_storeStrong((id *)&v12->_queue, a2);
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v13 = objc_claimAutoreleasedReturnValue();
    description = v12->_description;
    v12->_description = (NSData *)v13;

    objc_initWeak(location, v12);
    if (qword_1ECE24490 != -1)
      dispatch_once(&qword_1ECE24490, &__block_literal_global_37);
    v15 = (id)qword_1ECE24498;
    objc_copyWeak(&v19, location);
    v16 = os_state_add_handler();

    v12->_stateCaptureHandle = v16;
    v17 = v12;
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl(&dword_1D51BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handle != ((void *)0)", (uint8_t *)location, 2u);
  }

  return v12;
}

void GEOUnregisterStateCaptureLegacy(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint8_t v4[16];

  if (a1)
  {
    if (*a1)
    {
      v2 = (void *)qword_1ECE24478;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObjectForKey:", v3);

      *a1 = 0;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1D51BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: legacyHandle != ((void *)0)", v4, 2u);
  }
}

id GEORegisterPListStateCaptureAtFrequency(unsigned int a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a4;
  v14 = a3;
  v15 = a2;
  v16 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  _GEORegisterPListStateCaptureAtFrequency(a1, v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

double GEOMachAbsoluteTimeGetCurrent()
{
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  return *(double *)&qword_1ECE244A8 * (double)mach_absolute_time();
}

BOOL GEOAbsoluteTimeIsGreaterThanZero(double a1)
{
  return a1 > 2.22044605e-16;
}

uint64_t GEOMachContinuousTimeForTimestamp(double a1)
{
  double Current;
  uint64_t v3;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = mach_continuous_time();
  if (qword_1ECE244B0 != -1)
    dispatch_once(&qword_1ECE244B0, &__block_literal_global_2);
  return v3 + (uint64_t)((a1 - Current) / *(double *)&qword_1ECE244B8);
}

double GEOGetMonotonicTime()
{
  return (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
}

dispatch_queue_t geo_dispatch_queue_create_with_target_and_qos(const char *a1, void *a2, dispatch_qos_class_t a3)
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, a3, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a2;

  v9 = dispatch_queue_create_with_target_V2(a1, v7, v8);
  return v9;
}

dispatch_workloop_t geo_dispatch_workloop_create_with_format(char *__format, ...)
{
  char __str[100];
  uint64_t v3;
  va_list va;

  va_start(va, __format);
  v3 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x64uLL, __format, va);
  return dispatch_workloop_create(__str);
}

id geo_get_global_operation_queue(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *global_queue;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v3 = (void *)qword_1ECE244C8;
  if (!qword_1ECE244C8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECE244C8;
    qword_1ECE244C8 = v4;

    v3 = (void *)qword_1ECE244C8;
  }
  objc_msgSend(v3, "objectForKey:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.x%x"), CFSTR("com.apple.geo.global.opqueue."), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v7);

    objc_msgSend(v6, "setMaxConcurrentOperationCount:", 1);
    global_queue = (void *)geo_get_global_queue(a1);
    objc_msgSend(v6, "setUnderlyingQueue:", global_queue);
    objc_msgSend((id)qword_1ECE244C8, "setObject:forKey:", v6, v2);

  }
  os_unfair_lock_unlock(&_MergedGlobals_1);

  return v6;
}

dispatch_block_t geo_dispatch_block_clean_copy(dispatch_block_t block)
{
  return dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED|0x40, block);
}

geo_reentrant_isolater *geo_reentrant_isolater_create(uint64_t a1)
{
  return -[geo_reentrant_isolater initWithName:]([geo_reentrant_isolater alloc], "initWithName:", a1);
}

void geo_assert_reentrant_isolated(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_owner(a1 + 4);
}

void geo_assert_reentrant_not_isolated(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_not_owner(a1 + 4);
}

id GEOGetCuratedCollectionsLog()
{
  if (qword_1ECE244E0 != -1)
    dispatch_once(&qword_1ECE244E0, &__block_literal_global_1);
  return (id)_MergedGlobals_2;
}

id GEOGetPlaceRequestLog()
{
  if (qword_1ECE244F0 != -1)
    dispatch_once(&qword_1ECE244F0, &__block_literal_global_3);
  return (id)qword_1ECE244E8;
}

id GEOGetRoutePreloaderLog()
{
  if (qword_1ECE24510 != -1)
    dispatch_once(&qword_1ECE24510, &__block_literal_global_7);
  return (id)qword_1ECE24508;
}

id GEOGetPOIBusynessLog()
{
  if (qword_1ECE24540 != -1)
    dispatch_once(&qword_1ECE24540, &__block_literal_global_13);
  return (id)qword_1ECE24538;
}

id GEOGetLaunchLog()
{
  if (qword_1ECE24560 != -1)
    dispatch_once(&qword_1ECE24560, &__block_literal_global_17);
  return (id)qword_1ECE24558;
}

id GEOGetPlaceCardLayoutLog()
{
  if (qword_1ECE24570 != -1)
    dispatch_once(&qword_1ECE24570, &__block_literal_global_19);
  return (id)qword_1ECE24568;
}

id GEOGetSubscriptionsLog()
{
  if (qword_1ECE24580 != -1)
    dispatch_once(&qword_1ECE24580, &__block_literal_global_21);
  return (id)qword_1ECE24578;
}

id GEOGetOfflineDataAccessLog()
{
  if (qword_1ECE24590 != -1)
    dispatch_once(&qword_1ECE24590, &__block_literal_global_23);
  return (id)qword_1ECE24588;
}

id GEOGetOfflineServiceLog()
{
  if (qword_1ECE245A0 != -1)
    dispatch_once(&qword_1ECE245A0, &__block_literal_global_25_0);
  return (id)qword_1ECE24598;
}

id GEOGetOfflineStateLog()
{
  if (qword_1ECE245B0 != -1)
    dispatch_once(&qword_1ECE245B0, &__block_literal_global_27);
  return (id)qword_1ECE245A8;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x1E0C83008]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

