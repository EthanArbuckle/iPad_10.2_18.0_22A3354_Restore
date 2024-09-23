@implementation IOHIDSessionScheduleAsync

intptr_t ____IOHIDSessionScheduleAsync_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _opaque_pthread_t *v5;
  NSObject *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  __CFArray *v9;
  const __CFArray *v10;
  const __CFAllocator *v11;
  const __CFSet *Copy;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v19;
  _QWORD context[2];
  int v21;
  sched_param v22;
  CFArrayRef theArray;
  uint8_t buf[88];
  uint64_t v25;
  CFRange v26;
  CFRange v27;
  CFRange v28;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = _IOHIDLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = pthread_self();
    _os_log_impl(&dword_18AAAF000, v2, OS_LOG_TYPE_INFO, "thread_id=%p", buf, 0xCu);
  }
  v22 = 0;
  theArray = 0;
  v21 = 0;
  v3 = _IOHIDLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOHIDSessionSchedule", (const char *)&unk_18AB567C9, buf, 2u);
  }
  if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8)))
    __IOHIDSessionCreate_block_invoke_cold_4(context, buf);
  ++**(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = _IOHIDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AAAF000, v4, OS_LOG_TYPE_INFO, "HID Session async scheduling initiated.", buf, 2u);
  }
  v5 = pthread_self();
  if (!pthread_getschedparam(v5, &v21, &v22))
  {
    v6 = _IOHIDLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v22.sched_priority;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v21;
      _os_log_impl(&dword_18AAAF000, v6, OS_LOG_TYPE_INFO, "HID Session async root queue running at priority %d and schedule %d.", buf, 0xEu);
    }
  }
  context[0] = *(_QWORD *)(a1 + 32);
  context[1] = &theArray;
  v7 = *(const __CFArray **)(context[0] + 160);
  v26.length = CFArrayGetCount(v7);
  v26.location = 0;
  CFArrayApplyFunction(v7, v26, (CFArrayApplierFunction)__FilterFunctionOpen_0, context);
  v8 = theArray;
  if (theArray)
  {
    v9 = *(__CFArray **)(*(_QWORD *)(a1 + 32) + 152);
    v28.length = CFArrayGetCount(theArray);
    v28.location = 0;
    CFArrayAppendArray(v9, v8, v28);
    CFRelease(theArray);
  }
  v10 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 152);
  v27.length = CFArrayGetCount(v10);
  v27.location = 0;
  CFArrayApplyFunction(v10, v27, (CFArrayApplierFunction)__FilterFunctionScheduleAsync_0, *(void **)(a1 + 32));
  v11 = CFGetAllocator(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 136));
  Copy = CFSetCreateCopy(v11, *(CFSetRef *)(*(_QWORD *)(a1 + 32) + 136));
  v13 = _IOHIDLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOHIDSessionRegisterFilters", (const char *)&unk_18AB567C9, buf, 2u);
  }
  if (Copy)
  {
    CFSetApplyFunction(Copy, (CFSetApplierFunction)__RegisterServiceWithSessionFunction, *(void **)(a1 + 32));
    CFRelease(Copy);
  }
  v14 = _IOHIDLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDSessionRegisterFilters", (const char *)&unk_18AB567C9, buf, 2u);
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_DWORD *)v15)
  {
    --*(_DWORD *)v15;
    if (pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8)))
      __IOHIDSessionCreate_block_invoke_cold_1(&v19, buf);
  }
  v16 = _IOHIDLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDSessionSchedule", (const char *)&unk_18AB567C9, buf, 2u);
  }
  v17 = _IOHIDLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AAAF000, v17, OS_LOG_TYPE_INFO, "HID Session async scheduling complete.", buf, 2u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
