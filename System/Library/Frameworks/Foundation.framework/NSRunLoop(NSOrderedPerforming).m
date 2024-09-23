@implementation NSRunLoop(NSOrderedPerforming)

- (uint64_t)cancelPerformSelector:()NSOrderedPerforming target:argument:
{
  uint64_t result;
  __CFRunLoop *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFRunLoopObserver *ValueAtIndex;
  _QWORD *info;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const __CFString *v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  CFRunLoopObserverContext context;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "getCFRunLoop");
  if (result)
  {
    v10 = (__CFRunLoop *)result;
    objc_sync_enter(a1);
    obj = a1;
    v11 = objc_msgSend((id)objc_msgSend(a1, "_perft"), "count");
    if (v11)
    {
      v12 = (const __CFString *)*MEMORY[0x1E0C99860];
      v13 = (const __CFString *)*MEMORY[0x1E0C9B270];
      v25 = a4;
      v26 = a5;
      v24 = a3;
      do
      {
        ValueAtIndex = (__CFRunLoopObserver *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(obj, "_perft"), --v11);
        memset(&context, 0, sizeof(context));
        CFRunLoopObserverGetContext(ValueAtIndex, &context);
        info = context.info;
        if (*((_QWORD *)context.info + 1) == a3)
        {
          if (objc_msgSend(*(id *)context.info, "isEqual:", a4))
          {
            v16 = info[2];
            if (!(a5 | v16) || objc_msgSend((id)v16, "isEqual:", a5))
            {
              CFRetain(ValueAtIndex);
              v27 = v11;
              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              v17 = (void *)info[3];
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
              if (v18)
              {
                v19 = *(_QWORD *)v32;
                do
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v32 != v19)
                      objc_enumerationMutation(v17);
                    v21 = *(const __CFString **)(*((_QWORD *)&v31 + 1) + 8 * i);
                    v22 = v13;
                    if (v21 != v12)
                    {
                      v23 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "isEqual:", CFSTR("kCFRunLoopCommonModes"));
                      v22 = v21;
                      if (v23)
                        v22 = v13;
                    }
                    CFRunLoopRemoveObserver(v10, ValueAtIndex, v22);
                  }
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
                }
                while (v18);
              }
              CFRunLoopObserverInvalidate(ValueAtIndex);
              a4 = v25;
              a5 = v26;
              a3 = v24;
              v11 = v27;
              CFRelease(ValueAtIndex);
              objc_msgSend((id)objc_msgSend(obj, "_perft"), "removeObjectAtIndex:", v27);
            }
          }
        }
      }
      while (v11);
    }
    return objc_sync_exit(obj);
  }
  return result;
}

- (uint64_t)performSelector:()NSOrderedPerforming target:argument:order:modes:
{
  uint64_t result;
  __CFRunLoop *v13;
  malloc_zone_t *v14;
  _QWORD *v15;
  CFIndex v16;
  __CFRunLoopObserver *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t i;
  __CFString *v24;
  id v26;
  CFRunLoopObserverContext context;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "getCFRunLoop");
  if (result)
  {
    v13 = (__CFRunLoop *)result;
    *(_OWORD *)&context.version = xmmword_1E0F50AC0;
    *(_OWORD *)&context.retain = unk_1E0F50AD0;
    context.copyDescription = 0;
    result = objc_msgSend(a7, "count");
    if (result)
    {
      objc_sync_enter(a1);
      v14 = malloc_default_zone();
      v15 = malloc_type_zone_calloc(v14, 1uLL, 0x30uLL, 0xC2E5A2B2uLL);
      context.info = v15;
      *v15 = a4;
      v15[1] = a3;
      v15[2] = a5;
      v15[3] = objc_msgSend(a7, "copyWithZone:", 0);
      v15[5] = a1;
      if (a6 >= 0x7FFFFFFFFFFFFFFFLL)
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v16 = a6;
      v17 = CFRunLoopObserverCreate(0, 2uLL, 0, v16, (CFRunLoopObserverCallBack)__NSFirePerformWithOrder, &context);
      v15[4] = v17;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v26 = a7;
      v18 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v30;
        v20 = (__CFString *)*MEMORY[0x1E0C9B280];
        v21 = (__CFString *)*MEMORY[0x1E0C99860];
        v22 = (__CFString *)*MEMORY[0x1E0C9B270];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v26);
            v24 = *(__CFString **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (-[__CFString isEqual:](v24, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
              v24 = v20;
            if (v24 == v21 || -[__CFString isEqual:](v24, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
              v24 = v22;
            CFRunLoopAddObserver(v13, v17, v24);
          }
          v18 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        }
        while (v18);
      }
      CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(a1, "_perft"), v17);
      CFRelease(v17);
      return objc_sync_exit(a1);
    }
  }
  return result;
}

- (uint64_t)cancelPerformSelectorsWithTarget:()NSOrderedPerforming
{
  uint64_t result;
  __CFRunLoop *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFRunLoopObserver *ValueAtIndex;
  _QWORD *info;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  CFRunLoopObserverContext context;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "getCFRunLoop");
  if (result)
  {
    v6 = (__CFRunLoop *)result;
    objc_sync_enter(a1);
    obj = a1;
    v7 = objc_msgSend((id)objc_msgSend(a1, "_perft"), "count");
    if (v7)
    {
      v8 = (const __CFString *)*MEMORY[0x1E0C99860];
      v9 = (const __CFString *)*MEMORY[0x1E0C9B270];
      v19 = a3;
      do
      {
        ValueAtIndex = (__CFRunLoopObserver *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(obj, "_perft"), --v7);
        memset(&context, 0, sizeof(context));
        CFRunLoopObserverGetContext(ValueAtIndex, &context);
        info = context.info;
        if (*(_QWORD *)context.info == a3 || objc_msgSend(*(id *)context.info, "isEqual:", a3))
        {
          CFRetain(ValueAtIndex);
          v20 = v7;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v12 = (void *)info[3];
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(const __CFString **)(*((_QWORD *)&v24 + 1) + 8 * i);
                v17 = v9;
                if (v16 != v8)
                {
                  v18 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isEqual:", CFSTR("kCFRunLoopCommonModes"));
                  v17 = v16;
                  if (v18)
                    v17 = v9;
                }
                CFRunLoopRemoveObserver(v6, ValueAtIndex, v17);
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
            }
            while (v13);
          }
          CFRunLoopObserverInvalidate(ValueAtIndex);
          a3 = v19;
          v7 = v20;
          CFRelease(ValueAtIndex);
          objc_msgSend((id)objc_msgSend(obj, "_perft"), "removeObjectAtIndex:", v20);
        }
      }
      while (v7);
    }
    return objc_sync_exit(obj);
  }
  return result;
}

@end
