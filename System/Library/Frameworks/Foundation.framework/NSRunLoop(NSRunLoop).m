@implementation NSRunLoop(NSRunLoop)

- (uint64_t)performBlock:()NSRunLoop
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *MEMORY[0x1E0C99748];
  return objc_msgSend(a1, "performInModes:block:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1), a3);
}

- (void)performInModes:()NSRunLoop block:
{
  __CFRunLoop *v8;
  NSString *v9;

  if (!a4)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block targets for run loops cannot be nil"), _NSMethodExceptionProem(a1, a2));
LABEL_7:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  if (!a3 || !objc_msgSend(a3, "count"))
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: modes for block performers on run loops cannot be nil or contain no elements"), _NSMethodExceptionProem(a1, a2));
    goto LABEL_7;
  }
  v8 = (__CFRunLoop *)-[objc_class getCFRunLoop](a1, "getCFRunLoop");
  CFRunLoopPerformBlock(v8, a3, a4);
  CFRunLoopWakeUp(v8);
}

+ (id)_new:()NSRunLoop
{
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (objc_class *)objc_opt_self();
  v5 = NSAllocateObject(v4, 0, 0);
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  objc_msgSend(v5, "_initWithRl:dperf:perft:info:ports:", a3, v6, v7, v8, objc_opt_new());
  return v5;
}

+ (uint64_t)currentRunLoop
{
  uint64_t v0;

  _CFAutoreleasePoolPush();
  CFRunLoopGetCurrent();
  v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (uint64_t)_addPort:()NSRunLoop forMode:
{
  int v7;
  void *v8;

  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  if (a3 && !objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", a3))
  {
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", a1, sel__portInvalidated_, CFSTR("NSPortDidBecomeInvalidNotification"), a3);
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(a1, "_containsPort:forMode:", a3, a4) ^ 1;
  }
  objc_msgSend((id)objc_msgSend(a1, "_ports"), "addObject:", a3);
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", a3);
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", v8);

  if (v7)
    objc_msgSend(a3, "scheduleInRunLoop:forMode:", a1, v8);
  _CFAutoreleasePoolPop();
  return objc_sync_exit(a1);
}

- (__CFRunLoop)currentMode
{
  __CFRunLoop *result;

  result = (__CFRunLoop *)objc_msgSend(a1, "getCFRunLoop");
  if (result)
    return (__CFRunLoop *)(id)CFRunLoopCopyCurrentMode(result);
  return result;
}

- (uint64_t)addPort:()NSRunLoop forMode:
{
  void *v4;
  uint64_t result;
  NSString *v9;
  const char *v10;
  NSString *v11;

  v4 = a4;
  if ((!a3 || !a4) && _CFExecutableLinkedOnOrAfter())
  {
    v9 = _NSMethodExceptionProem(a1, a2);
    v10 = "port";
    if (a3)
      v10 = "mode";
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s argument cannot be nil"), v9, v10);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (result)
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
      v4 = (void *)*MEMORY[0x1E0C9B280];
    if (v4 == (void *)*MEMORY[0x1E0C99860]
      || objc_msgSend(v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    {
      v4 = (void *)*MEMORY[0x1E0C9B270];
    }
    return -[objc_class _addPort:forMode:](a1, "_addPort:forMode:", a3, v4);
  }
  return result;
}

- (void)addTimer:()NSRunLoop forMode:
{
  __CFString *v4;
  uint64_t v8;
  __CFRunLoop *v9;
  void *v10;

  v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v10);
  }
  v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (v8)
  {
    v9 = (__CFRunLoop *)v8;
    if (-[__CFString isEqual:](v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
      v4 = (__CFString *)*MEMORY[0x1E0C9B280];
    if (v4 == (__CFString *)*MEMORY[0x1E0C99860]
      || -[__CFString isEqual:](v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    {
      v4 = (__CFString *)*MEMORY[0x1E0C9B270];
    }
    CFRunLoopAddTimer(v9, a3, v4);
  }
}

- (void)runUntilDate:()NSRunLoop
{
  id v4;
  uint64_t v5;
  CFAbsoluteTime v6;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9B280];
  do
  {
    if (!objc_msgSend(a1, "runMode:beforeDate:", v5, a3))
      break;
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  }
  while (v6 > CFAbsoluteTimeGetCurrent());

}

- (uint64_t)run
{
  uint64_t v2;
  uint64_t result;

  v2 = *MEMORY[0x1E0C9B280];
  do
    result = objc_msgSend(a1, "runMode:beforeDate:", v2, objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"));
  while ((result & 1) != 0);
  return result;
}

- (uint64_t)runMode:()NSRunLoop beforeDate:
{
  __CFString *v5;
  uint64_t v8;
  double v10;
  double v11;
  CFAbsoluteTime Current;
  void *v13;

  v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v13);
  }
  if (!-[objc_class getCFRunLoop](a1, "getCFRunLoop") || !_CFRunLoopIsCurrent())
    return 0;
  if (-[__CFString isEqual:](v5, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
    v5 = (__CFString *)*MEMORY[0x1E0C9B280];
  if (_CFRunLoopFinished())
    return 0;
  _CFAutoreleasePoolPush();
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v11 = v10;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = 1;
  CFRunLoopRunInMode(v5, v11 - Current, 1u);
  _CFAutoreleasePoolPop();
  return v8;
}

+ (uint64_t)mainRunLoop
{
  uint64_t v0;

  _CFAutoreleasePoolPush();
  CFRunLoopGetMain();
  v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (uint64_t)_enumerateInfoPairsWithBlock:()NSRunLoop
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_msgSend(a1, "_info");
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (result)
  {
    v6 = result;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v4);
        if ((((_DWORD)v7 + (_DWORD)v10) & 1) != 0)
        {
          result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, char *))(a3 + 16))(a3, v8, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v7 + v10 - 1, &v11);
          if (v11)
            return result;
        }
        else
        {
          v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        }
        ++v10;
      }
      while (v6 != v10);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      v6 = result;
      v7 += v10;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_portInvalidated:()NSRunLoop
{
  id v5;
  void *v6;
  NSIndexSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD v12[7];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  v5 = (id)objc_msgSend(a3, "object");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = +[NSIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke;
  v12[3] = &unk_1E0F50A50;
  v12[4] = v5;
  v12[5] = v6;
  v12[6] = v7;
  objc_msgSend(a1, "_enumerateInfoPairsWithBlock:", v12);
  objc_msgSend((id)objc_msgSend(a1, "_info"), "removeObjectsAtIndexes:", v7);
  while (objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", v5))
    objc_msgSend((id)objc_msgSend(a1, "_ports"), "removeObject:", v5);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("NSPortDidBecomeInvalidNotification"), v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "removeFromRunLoop:forMode:", a1, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  _CFAutoreleasePoolPop();
  return objc_sync_exit(a1);
}

- (uint64_t)_containsPort:()NSRunLoop forMode:
{
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_sync_enter(a1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke;
  v9[3] = &unk_1E0F50A78;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = &v10;
  objc_msgSend(a1, "_enumerateInfoPairsWithBlock:", v9);
  objc_sync_exit(a1);
  v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (uint64_t)_removePort:()NSRunLoop forMode:
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke;
  v11[3] = &unk_1E0F50AA0;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = &v16;
  v11[7] = &v12;
  objc_msgSend(a1, "_enumerateInfoPairsWithBlock:", v11);
  if (v17[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend(a1, "_info");
    objc_msgSend(v8, "removeObjectsInRange:", v17[3], 2);
  }
  v9 = (void *)objc_msgSend(a1, "_ports");
  objc_msgSend(v9, "removeObject:", a3);
  if (!objc_msgSend(v9, "countForObject:", a3))
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("NSPortDidBecomeInvalidNotification"), a3);
  if (*((_BYTE *)v13 + 24))
    objc_msgSend(a3, "removeFromRunLoop:forMode:", a1, a4);
  _CFAutoreleasePoolPop();
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return objc_sync_exit(a1);
}

- (uint64_t)init
{

  return 0;
}

- (id)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("NSPortDidBecomeInvalidNotification"), 0);
  objc_msgSend(a1, "_deallocHelper");
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EDCF8208;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (CFStringRef)description
{
  const void *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (const void *)objc_msgSend(a1, "getCFRunLoop");
  if (v2)
    return (id)CFCopyDescription(v2);
  v4.receiver = a1;
  v4.super_class = (Class)&off_1EDCF8208;
  return (CFStringRef)objc_msgSendSuper2(&v4, sel_description);
}

- (uint64_t)removePort:()NSRunLoop forMode:
{
  void *v4;
  uint64_t result;
  void *v9;

  v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v9);
  }
  result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (a3 && result)
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
      v4 = (void *)*MEMORY[0x1E0C9B280];
    if (v4 == (void *)*MEMORY[0x1E0C99860]
      || objc_msgSend(v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    {
      v4 = (void *)*MEMORY[0x1E0C9B270];
    }
    return -[objc_class _removePort:forMode:](a1, "_removePort:forMode:", a3, v4);
  }
  return result;
}

- (uint64_t)containsPort:()NSRunLoop forMode:
{
  void *v4;
  uint64_t v8;
  void *v10;

  v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v10);
  }
  v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (!a3 || !v8)
    return 0;
  if (objc_msgSend(v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
    v4 = (void *)*MEMORY[0x1E0C9B280];
  if (v4 == (void *)*MEMORY[0x1E0C99860] || objc_msgSend(v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    v4 = (void *)*MEMORY[0x1E0C9B270];
  return -[objc_class _containsPort:forMode:](a1, "_containsPort:forMode:", a3, v4);
}

- (uint64_t)portsForMode:()NSRunLoop
{
  return objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (void)removeTimer:()NSRunLoop forMode:
{
  __CFString *v4;
  uint64_t v8;
  __CFRunLoop *v9;
  void *v10;

  v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v10);
  }
  v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (v8)
  {
    v9 = (__CFRunLoop *)v8;
    if (-[__CFString isEqual:](v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
      v4 = (__CFString *)*MEMORY[0x1E0C9B280];
    if (v4 == (__CFString *)*MEMORY[0x1E0C99860]
      || -[__CFString isEqual:](v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    {
      v4 = (__CFString *)*MEMORY[0x1E0C9B270];
    }
    CFRunLoopRemoveTimer(v9, a3, v4);
  }
}

- (uint64_t)timersForMode:()NSRunLoop
{
  return objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (uint64_t)containsTimer:()NSRunLoop forMode:
{
  __CFString *v4;
  uint64_t result;
  __CFRunLoop *v9;
  void *v10;

  v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v10);
  }
  result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (result)
  {
    v9 = (__CFRunLoop *)result;
    if (-[__CFString isEqual:](v4, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
      v4 = (__CFString *)*MEMORY[0x1E0C9B280];
    if (v4 == (__CFString *)*MEMORY[0x1E0C99860]
      || -[__CFString isEqual:](v4, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
    {
      v4 = (__CFString *)*MEMORY[0x1E0C9B270];
    }
    return CFRunLoopContainsTimer(v9, a3, v4) != 0;
  }
  return result;
}

- (CFArrayRef)allModes
{
  __CFRunLoop *v1;

  v1 = (__CFRunLoop *)objc_msgSend(a1, "getCFRunLoop");
  if (v1)
    return CFRunLoopCopyAllModes(v1);
  else
    return (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (uint64_t)limitDateForMode:()NSRunLoop
{
  __CFString *v3;
  uint64_t v6;
  __CFRunLoop *v7;
  void *v9;

  v3 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v9);
  }
  v6 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (!v6)
    return 0;
  v7 = (__CFRunLoop *)v6;
  if (!_CFRunLoopIsCurrent())
    return 0;
  if (-[__CFString isEqual:](v3, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
    v3 = (__CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopRunInMode(v3, -10.0, 1u);
  if (_CFRunLoopFinished())
    return 0;
  if (CFRunLoopGetNextTimerFireDate(v7, v3) == 0.0)
    return objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
}

- (void)_wakeup
{
  __CFRunLoop *v1;
  __CFRunLoop *v2;

  v1 = (__CFRunLoop *)objc_msgSend(a1, "getCFRunLoop");
  if (v1)
  {
    v2 = v1;
    CFRunLoopStop(v1);
    CFRunLoopWakeUp(v2);
  }
}

- (uint64_t)acceptInputForMode:()NSRunLoop beforeDate:
{
  __CFString *v5;
  uint64_t result;
  double v9;
  double v10;
  double v11;
  void *v12;

  v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v12);
  }
  result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
  if (result)
  {
    result = _CFRunLoopIsCurrent();
    if ((_DWORD)result)
    {
      if (-[__CFString isEqual:](v5, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
        v5 = (__CFString *)*MEMORY[0x1E0C9B280];
      objc_msgSend(a4, "timeIntervalSinceReferenceDate");
      v10 = v9;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      return CFRunLoopRunInMode(v5, v10 - v11, 1u);
    }
  }
  return result;
}

- (uint64_t)runMode:()NSRunLoop untilDate:
{
  id v8;
  double v9;
  double v10;
  double Current;
  unsigned int v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  void *v16;

  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mode argument cannot be nil"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v16);
  }
  if (!-[objc_class getCFRunLoop](a1, "getCFRunLoop"))
    return 0;
  v8 = a4;
  if (-[objc_class runMode:beforeDate:](a1, "runMode:beforeDate:", a3, a4))
  {
    objc_msgSend(a4, "timeIntervalSinceReferenceDate");
    v10 = v9;
    Current = CFAbsoluteTimeGetCurrent();
    if (v10 <= Current)
    {
      v12 = 1;
    }
    else
    {
      do
      {
        v12 = -[objc_class runMode:beforeDate:](a1, "runMode:beforeDate:", a3, a4);
        if (!v12)
          break;
        objc_msgSend(a4, "timeIntervalSinceReferenceDate");
      }
      while (v13 > CFAbsoluteTimeGetCurrent());
    }
    if (v10 > Current)
      v14 = 1;
    else
      v14 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)runBeforeDate:()NSRunLoop
{
  return objc_msgSend(a1, "runMode:beforeDate:", *MEMORY[0x1E0C9B280], a3);
}

@end
