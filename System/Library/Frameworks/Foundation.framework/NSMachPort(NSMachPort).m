@implementation NSMachPort(NSMachPort)

- (unint64_t)retain
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
      return (unint64_t *)CFRetain(a1);
  }
  objc_msgSend(a1, "_increaseRetainCountWithLock:", &_NSGlobalRetainLock);
  if (*MEMORY[0x1E0C9A980])
    __CFRecordAllocationEvent();
  return a1;
}

- (void)release
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v3 = atomic_load(a1 + 1)) != 0)
  {
    CFRelease(a1);
  }
  else
  {
    if (*MEMORY[0x1E0C9A980])
      __CFRecordAllocationEvent();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__NSMachPort_NSMachPort__release__block_invoke;
    v4[3] = &unk_1E0F4D2D8;
    v4[4] = a1;
    objc_msgSend(a1, "_decreaseRetainCountAndMaybeDeallocWithLock:andPerformWhenZero:", &_NSGlobalRetainLock, v4);
  }
}

- (uint64_t)isKindOfClass:()NSMachPort
{
  uint64_t v5;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3)
        return 1;
    }
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EDCFAD50;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isKindOfClass_, a3);
}

- (void)scheduleInRunLoop:()NSMachPort forMode:
{
  uint64_t v8;
  unint64_t v9;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v11;
  objc_class *v12;

  if (a3)
  {
    v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (v9 = atomic_load(a1 + 1)) == 0)
    {
      v12 = NSClassFromString((NSString *)CFSTR("NSMachPort"));
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }
    RunLoopSource = CFMachPortCreateRunLoopSource(0, (CFMachPortRef)a1, 200);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), RunLoopSource, a4);
      CFRelease(v11);
    }
  }
}

- (uint64_t)machPort
{
  uint64_t v2;
  unint64_t v4;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v4 = atomic_load(a1 + 1)) != 0)
    return CFMachPortGetPort((CFMachPortRef)a1);
  else
    return objc_msgSend(a1, "_machPort");
}

- (uint64_t)init
{
  ipc_space_t *v2;
  uint64_t result;
  objc_super v4;
  mach_port_name_t name;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  name = 0;
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name))
    goto LABEL_4;
  if (mach_port_insert_right(*v2, name, name, 0x14u))
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
LABEL_4:
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EDCFAD50;
    objc_msgSendSuper2(&v4, sel_dealloc);
    return 0;
  }
  result = objc_msgSend(a1, "initWithMachPort:options:", name, 3);
  if (!result)
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
    mach_port_deallocate(*v2, name);
    return 0;
  }
  return result;
}

- (void)invalidate
{
  uint64_t v2;
  mach_port_name_t v3;
  mach_port_name_t v4;
  char v5;
  ipc_space_t *v6;
  unint64_t v7;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v7 = atomic_load(a1 + 1)) != 0)
  {
    if (CFMachPortIsValid((CFMachPortRef)a1))
      CFMachPortInvalidate((CFMachPortRef)a1);
  }
  else
  {
    objc_msgSend(a1, "setDelegate:", 0);
    v3 = objc_msgSend(a1, "_machPort");
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(a1, "_flags");
      v6 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      if ((v5 & 2) != 0)
        mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v4, 1u, -1);
      if ((v5 & 1) != 0)
        mach_port_deallocate(*v6, v4);
      objc_msgSend(a1, "_setMachPort:", 0);
      -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPortDidBecomeInvalidNotification"), a1, 0);
    }
  }
}

- (void)setDelegate:()NSMachPort
{
  uint64_t v5;
  unint64_t v6;
  CFMachPortContext v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (v6 = atomic_load(a1 + 1)) != 0)
  {
    memset(&v7.info, 0, 32);
    if (CFMachPortIsValid((CFMachPortRef)a1))
    {
      v7.version = 0;
      CFMachPortGetContext((CFMachPortRef)a1, &v7);
      if (v7.info)
      {
        if (*((_QWORD *)v7.info + 4) == ~*((_QWORD *)v7.info + 3))
          *((_QWORD *)v7.info + 1) = a3;
      }
    }
  }
  else
  {
    objc_msgSend(a1, "_setDelegate:", a3);
  }
}

- (void)initWithMachPort:()NSMachPort options:
{
  uint64_t v7;
  void *v8;
  unint64_t v10;
  void *v11;
  objc_super v12;
  mach_port_type_t ptype;
  CFMachPortContext context;
  Boolean shouldFreeInfo;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!(_DWORD)a3)
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_1EDCFAD50;
    objc_msgSendSuper2(&v16, sel_dealloc);
    return 0;
  }
  v7 = objc_opt_class();
  if (v7 != objc_opt_class())
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1EDCFAD50;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "_setFlags:", a4 & 3);
    objc_msgSend(v8, "_setMachPort:", a3);
    return v8;
  }

  v10 = (unint64_t)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040E1DEC455uLL);
  if (!v10)
    return 0;
  v11 = (void *)v10;
  *(_QWORD *)(v10 + 8) = 0;
  *(_QWORD *)(v10 + 16) = a4 & 3;
  *(_QWORD *)(v10 + 24) = ~v10;
  *(_QWORD *)(v10 + 32) = v10;
  *(_DWORD *)(v10 + 40) = a3;
  shouldFreeInfo = 0;
  context.version = 0;
  context.info = (void *)v10;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))__destroyPortContext;
  context.copyDescription = 0;
  v8 = CFMachPortCreateWithPort(0, a3, (CFMachPortCallBack)__NSFireMachPort, &context, &shouldFreeInfo);
  if (v8 && (_cfmp_record_nsmachport_is_interested(), !shouldFreeInfo))
  {
    ptype = 0;
    if (!mach_port_type(*MEMORY[0x1E0C83DA0], a3, &ptype) && (ptype & 0x50000) != 0)
      CFMachPortSetInvalidationCallBack((CFMachPortRef)v8, (CFMachPortInvalidationCallBack)_NSPortDeathNotify);
  }
  else
  {
    free(v11);
  }
  return v8;
}

+ (id)port
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "init");
}

+ (id)portWithMachPort:()NSMachPort
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithMachPort:", a3);
}

+ (id)portWithMachPort:()NSMachPort options:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithMachPort:options:", a3, a4);
}

- (BOOL)isEqual:()NSMachPort
{
  uint64_t v5;
  unint64_t v7;

  if (!a3)
    return 0;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (v7 = atomic_load(a1 + 1)) != 0)
    return CFEqual(a1, a3) != 0;
  else
    return a1 == a3;
}

- (CFHashCode)hash
{
  uint64_t v2;
  unint64_t v4;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v4 = atomic_load(a1 + 1)) != 0)
    return CFHash(a1);
  else
    return objc_msgSend(a1, "_machPort");
}

- (uint64_t)_isDeallocating
{
  return 1;
}

- (uint64_t)_tryRetain
{
  return 0;
}

- (CFIndex)retainCount
{
  uint64_t v2;
  unint64_t v4;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v4 = atomic_load(a1 + 1)) != 0)
    return CFGetRetainCount(a1);
  else
    return objc_msgSend(a1, "_retainCount") + 1;
}

- (uint64_t)isMemberOfClass:()NSMachPort
{
  uint64_t v5;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3)
        return 1;
    }
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EDCFAD50;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isMemberOfClass_, a3);
}

- (BOOL)isValid
{
  uint64_t v2;
  int IsValid;
  unint64_t v4;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (v4 = atomic_load(a1 + 1)) != 0)
    IsValid = CFMachPortIsValid((CFMachPortRef)a1);
  else
    IsValid = objc_msgSend(a1, "_machPort");
  return IsValid != 0;
}

- (uint64_t)delegate
{
  uint64_t v2;
  uint64_t result;
  CFMachPortContext v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    return objc_msgSend(a1, "_delegate");
  if (!atomic_load(a1 + 1))
    return objc_msgSend(a1, "_delegate");
  memset(&v5, 0, sizeof(v5));
  CFMachPortGetContext((CFMachPortRef)a1, &v5);
  result = 0;
  if (*((_QWORD *)v5.info + 4) == ~*((_QWORD *)v5.info + 3))
    return *((_QWORD *)v5.info + 1);
  return result;
}

+ (uint64_t)sendBeforeTime:()NSMachPort streamData:components:to:from:msgid:reserved:
{
  void *v9;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t i;
  uint64_t v19;
  char *v20;
  mach_msg_header_t *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  mach_msg_bits_t msgh_bits;
  unsigned int v32;
  double v33;
  mach_port_t v34;
  unint64_t v35;
  mach_port_t v36;
  int v37;
  mach_msg_size_t msgh_size;
  mach_msg_option_t v39;
  mach_msg_return_t v40;
  uint64_t result;
  void *v42;
  const __CFString *v43;
  NSString *v44;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v9 = a7;
  v11 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v13 = a4 != 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = 40;
      goto LABEL_22;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = 44;
      goto LABEL_22;
    }
LABEL_21:
    v17 = 28;
    goto LABEL_22;
  }
  v13 = objc_msgSend(a5, "count");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  if (!v14)
    goto LABEL_21;
  v15 = v14;
  v16 = *(_QWORD *)v51;
  v17 = 28;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v51 != v16)
        objc_enumerationMutation(a5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = 12;
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = 16;
      }
      else
      {
        v19 = 0;
      }
      v17 += v19;
    }
    v15 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  }
  while (v15);
  v9 = a7;
LABEL_22:
  v20 = (char *)malloc_type_calloc(1uLL, v17, 0x52B02C87uLL);
  v21 = (mach_msg_header_t *)v20;
  *(_QWORD *)(v20 + 4) = 28;
  *((_DWORD *)v20 + 3) = 0;
  *((_DWORD *)v20 + 5) = 0;
  *((_DWORD *)v20 + 6) = v13;
  if (!v13)
    goto LABEL_37;
  v22 = 0;
  v23 = v20 + 28;
  do
  {
    v24 = v11;
    if (a5)
      v24 = (void *)objc_msgSend(a5, "objectAtIndex:", v22);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(_DWORD *)v23 = objc_msgSend(v24, "machPort");
      *((_WORD *)v23 + 5) = 19;
      v23 += 12;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v25 = v11;
      v26 = objc_msgSend(v24, "length");
      v27 = objc_msgSend(v24, "bytes");
      v28 = a9;
      if (v22)
        v28 = 0;
      v29 = v26 - v28;
      v11 = v25;
      *(_QWORD *)v23 = v27 + v28;
      *((_DWORD *)v23 + 2) = ((v29 >= *MEMORY[0x1E0C85AD8] >> 1) << 8) | (v23[10] << 16) | 0x1000000;
      *((_DWORD *)v23 + 3) = v29;
      v23 += 16;
    }
    else
    {
      v30 = objc_opt_class();
      NSLog((NSString *)CFSTR("*** D.O. message send ignoring unknown component type '%@'"), v30);
      --v21[1].msgh_bits;
    }
    ++v22;
  }
  while (v13 != v22);
  msgh_bits = v21[1].msgh_bits;
  v21->msgh_size += 16 * msgh_bits;
  v9 = a7;
  if (msgh_bits)
    v32 = 0x80000000;
  else
LABEL_37:
    v32 = 0;
  v21->msgh_bits = v32;
  v33 = a1 - CFAbsoluteTimeGetCurrent();
  v34 = a6;
  if (v33 < 0.0)
  {
    v35 = 0;
    if (!a6)
      goto LABEL_46;
    goto LABEL_45;
  }
  if (v33 >= 4294967.29)
  {
    v35 = 0xFFFFFFFFLL;
    if (!a6)
      goto LABEL_46;
    goto LABEL_45;
  }
  v35 = vcvtmd_u64_f64(v33 * 1000.0) + 3;
  if (a6)
LABEL_45:
    v34 = objc_msgSend(a6, "machPort");
LABEL_46:
  v21->msgh_remote_port = v34;
  if (v9)
  {
    v36 = objc_msgSend(v9, "machPort");
    v21->msgh_local_port = v36;
    v21->msgh_id = a8;
    if (v36)
    {
      v37 = 5139;
      goto LABEL_51;
    }
  }
  else
  {
    v21->msgh_local_port = 0;
    v21->msgh_id = a8;
  }
  v37 = 19;
LABEL_51:
  msgh_size = v21->msgh_size;
  v21->msgh_bits |= v37;
  if (v35 == 0xFFFFFFFF)
    v39 = 1;
  else
    v39 = 17;
  v40 = mach_msg(v21, v39, msgh_size, 0, 0, v35, 0);
  free(v21);
  if (v40 <= 268435459)
  {
    if (!v40)
      return 1;
    if (v40 == 268435459)
    {
      objc_msgSend(a6, "invalidate");
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = CFSTR("NSInvalidSendPortException");
      v44 = (NSString *)CFSTR("[NSMachPort sendBeforeDate:] destination port invalid");
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  result = 0;
  if (v40 != 268435460)
  {
    if (v40 == 268435465)
    {
      objc_msgSend(v9, "invalidate");
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = CFSTR("NSInvalidReceivePortException");
      v44 = (NSString *)CFSTR("[NSMachPort sendBeforeDate:] reply port invalid");
      goto LABEL_64;
    }
LABEL_63:
    v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSMachPort sendBeforeDate:] Cannot send (%s)"), mach_error_string(v40));
    v42 = (void *)MEMORY[0x1E0C99DA0];
    v43 = CFSTR("NSPortSendException");
LABEL_64:
    objc_exception_throw((id)objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v44, 0));
  }
  return result;
}

- (uint64_t)sendBeforeTime:()NSMachPort streamData:components:from:msgid:
{
  return objc_msgSend((id)objc_opt_class(), "sendBeforeTime:streamData:components:to:from:msgid:reserved:", a4, a5, a1, a6, a7, objc_msgSend(a1, "reservedSpaceLength"), a2);
}

- (uint64_t)sendBeforeDate:()NSMachPort components:from:reserved:
{
  void *v11;

  v11 = (void *)objc_opt_class();
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v11, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a4, a1, a5, 0, a6);
}

- (uint64_t)sendBeforeDate:()NSMachPort msgid:components:from:reserved:
{
  void *v13;

  v13 = (void *)objc_opt_class();
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v13, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a5, a1, a6, a4, a7);
}

- (void)removeFromRunLoop:()NSMachPort forMode:
{
  uint64_t v8;
  unint64_t v9;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v11;
  objc_class *v12;

  if (a3)
  {
    v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (v9 = atomic_load(a1 + 1)) == 0)
    {
      v12 = NSClassFromString((NSString *)CFSTR("NSMachPort"));
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }
    RunLoopSource = CFMachPortCreateRunLoopSource(0, (CFMachPortRef)a1, 200);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopRemoveSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), RunLoopSource, a4);
      CFRelease(v11);
    }
  }
}

- (uint64_t)initWithMachPort:()NSMachPort
{
  return objc_msgSend(a1, "initWithMachPort:options:", a3, 3);
}

@end
