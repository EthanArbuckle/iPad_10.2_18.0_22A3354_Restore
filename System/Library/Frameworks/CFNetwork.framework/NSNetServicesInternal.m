@implementation NSNetServicesInternal

- (void)dealloc
{
  NSMutableArray *monitors;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __CFRunLoop *scheduledRunLoop;
  __CFString *scheduledMode;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_listener)
  {
    tcp_listener_cancel();
    tcp_listener_release();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  monitors = self->_monitors;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](monitors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(monitors);
        CFNetServiceMonitorInvalidate(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](monitors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  scheduledRunLoop = self->_scheduledRunLoop;
  if (scheduledRunLoop)
    CFRelease(scheduledRunLoop);
  scheduledMode = self->_scheduledMode;
  if (scheduledMode)
    CFRelease(scheduledMode);
  v10.receiver = self;
  v10.super_class = (Class)NSNetServicesInternal;
  -[NSNetServicesInternal dealloc](&v10, sel_dealloc);
}

- (_QWORD)setScheduledRunLoop:(const void *)a3 andMode:
{
  _QWORD *v5;
  const void *v6;
  const void *v7;

  if (result)
  {
    v5 = result;
    objc_sync_enter(result);
    v6 = (const void *)v5[3];
    if (v6)
    {
      CFRelease(v6);
      v5[3] = 0;
    }
    v7 = (const void *)v5[4];
    if (v7)
    {
      CFRelease(v7);
      v5[4] = 0;
    }
    if (a3)
    {
      v5[3] = CFRetain(a2);
      v5[4] = CFRetain(a3);
    }
    return (_QWORD *)objc_sync_exit(v5);
  }
  return result;
}

- (uint64_t)setListener:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(result + 16);
    if (result)
    {
      tcp_listener_cancel();
      result = tcp_listener_release();
    }
    *(_QWORD *)(v3 + 16) = a2;
    if (a2)
      return tcp_listener_retain();
  }
  return result;
}

@end
