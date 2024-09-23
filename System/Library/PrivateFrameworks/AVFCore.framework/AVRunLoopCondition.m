@implementation AVRunLoopCondition

- (void)signal
{
  if (-[NSMutableArray count](self->_runLoopStateList, "count"))
    -[AVRunLoopCondition _signalRunLoopWithState:](self, "_signalRunLoopWithState:", -[NSMutableArray objectAtIndex:](self->_runLoopStateList, "objectAtIndex:", 0));
}

- (BOOL)waitUntilDate:(id)a3 inMode:(id)a4
{
  return -[AVRunLoopCondition _waitInMode:untilDate:](self, "_waitInMode:untilDate:", a4, a3);
}

- (void)_signalRunLoopWithState:(id)a3
{
  CFRunLoopSourceSignal((CFRunLoopSourceRef)objc_msgSend(a3, "signalSource"));
  CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(a3, "runLoop"));
}

- (BOOL)_waitInMode:(id)a3 untilDate:(id)a4
{
  void *v7;
  __CFRunLoop *Current;
  AVRunLoopConditionRunLoopState *v9;
  CFRunLoopSourceRef v10;
  __CFRunLoopSource *v11;
  void *v12;
  CFTimeInterval v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFRunLoopSourceContext context;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC](self, a2);
  if (!a3)
    a3 = CFSTR("AVRunLoopConditionSignalRunLoopMode");
  Current = CFRunLoopGetCurrent();
  v9 = +[AVRunLoopConditionRunLoopState runLoopStateWithRunLoop:](AVRunLoopConditionRunLoopState, "runLoopStateWithRunLoop:", Current);
  context.version = 0;
  context.info = v9;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
  memset(&context.copyDescription, 0, 40);
  context.perform = (void (__cdecl *)(void *))AVRunLoopConditionSignal;
  v10 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &context);
  v11 = v10;
  -[NSMutableArray addObject:](self->_runLoopStateList, "addObject:", v9);
  CFRunLoopAddSource(Current, v10, (CFRunLoopMode)a3);
  -[AVRunLoopConditionRunLoopState setSignalSource:](v9, "setSignalSource:", v10);
  -[NSCondition unlock](self, "unlock");
  if (!-[AVRunLoopConditionRunLoopState signaled](v9, "signaled"))
  {
    do
    {
      v12 = (void *)MEMORY[0x1940343FC]();
      v13 = 1000000000.0;
      if (a4)
      {
        if (objc_msgSend(a4, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "date", 1000000000.0)) != 1)
        {
          if (dword_1ECDECDB8)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_autoreleasePoolPop(v12);
          break;
        }
        objc_msgSend(a4, "timeIntervalSinceNow");
      }
      CFRunLoopRunInMode((CFRunLoopMode)a3, v13, 1u);
      objc_autoreleasePoolPop(v12);
    }
    while (!-[AVRunLoopConditionRunLoopState signaled](v9, "signaled"));
  }
  -[NSCondition lock](self, "lock", v16, v17);
  -[AVRunLoopConditionRunLoopState setSignalSource:](v9, "setSignalSource:", 0);
  CFRunLoopRemoveSource(Current, v10, (CFRunLoopMode)a3);
  -[NSMutableArray removeObject:](self->_runLoopStateList, "removeObject:", v9);
  v14 = -[AVRunLoopConditionRunLoopState signaled](v9, "signaled");
  objc_autoreleasePoolPop(v7);
  return v14;
}

- (AVRunLoopCondition)init
{
  AVRunLoopCondition *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVRunLoopCondition;
  v2 = -[NSCondition init](&v4, sel_init);
  if (v2)
    v2->_runLoopStateList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVRunLoopCondition;
  -[NSCondition dealloc](&v3, sel_dealloc);
}

- (void)wait
{
  -[AVRunLoopCondition waitInMode:](self, "waitInMode:", 0);
}

- (BOOL)waitUntilDate:(id)a3
{
  return -[AVRunLoopCondition waitUntilDate:inMode:](self, "waitUntilDate:inMode:", a3, 0);
}

- (void)waitInMode:(id)a3
{
  -[AVRunLoopCondition _waitInMode:untilDate:](self, "_waitInMode:untilDate:", a3, 0);
}

- (void)broadcast
{
  NSMutableArray *runLoopStateList;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  runLoopStateList = self->_runLoopStateList;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runLoopStateList, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(runLoopStateList);
        -[AVRunLoopCondition _signalRunLoopWithState:](self, "_signalRunLoopWithState:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runLoopStateList, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

@end
