@implementation BWStreamStartStopState

- (float)initWithStream:(void *)a3 masterState:(float)a4 timeoutInSeconds:
{
  float *v7;
  NSObject *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)BWStreamStartStopState;
  v7 = (float *)objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    if ((a3 == 0) == objc_msgSend(a2, "isSynchronizationMaster"))
    {
      *((_QWORD *)v7 + 2) = a2;
      *((_QWORD *)v7 + 6) = a3;
      v7[16] = a4;
      v8 = dispatch_group_create();
      *((_QWORD *)v7 + 3) = v8;
      dispatch_group_enter(v8);
      *((_BYTE *)v7 + 32) = 1;
      *((_QWORD *)v7 + 5) = dispatch_group_create();
      return v7;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (uint64_t)streamWillStart
{
  uint64_t v1;
  uint64_t v2;
  _BOOL4 started;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  if (*(_DWORD *)(result + 8))
    return 0;
  *(_DWORD *)(result + 8) = 1;
  v2 = *(_QWORD *)(result + 48);
  if (!v2)
    goto LABEL_7;
  started = -[BWStreamStartStopState dependentWillStart](v2);
  if (!*(_BYTE *)(v1 + 68) || objc_msgSend(*(id *)(v1 + 56), "count"))
  {
    if (started)
      goto LABEL_7;
    return 0;
  }
  usleep(0x186A0u);
  if (!started)
    return 0;
LABEL_7:
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(void **)(v1 + 56);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v5)
    return 1;
  v6 = v5;
  v7 = *(_QWORD *)v10;
LABEL_9:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v10 != v7)
      objc_enumerationMutation(v4);
    result = -[BWStreamStartStopState dependentWillStart](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
    if (!(_DWORD)result)
      return result;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      result = 1;
      if (v6)
        goto LABEL_9;
      return result;
    }
  }
}

- (BOOL)dependentWillStart
{
  uint64_t v1;
  float v2;
  dispatch_time_t v3;
  intptr_t v4;

  if (result)
  {
    v1 = result;
    v2 = *(float *)(result + 64);
    if (v2 == 0.0)
      v3 = -1;
    else
      v3 = dispatch_time(0, (uint64_t)(float)(v2 * 1000000000.0));
    v4 = dispatch_group_wait(*(dispatch_group_t *)(v1 + 24), v3);
    dispatch_group_enter(*(dispatch_group_t *)(v1 + 40));
    return v4 == 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasEnteredStartedGroup)
    dispatch_group_leave((dispatch_group_t)self->_hasStartedGroup);

  v3.receiver = self;
  v3.super_class = (Class)BWStreamStartStopState;
  -[BWStreamStartStopState dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start/Stop state for %@"), -[BWFigVideoCaptureStream portType](self->_stream, "portType"));
}

- (uint64_t)streamWillStop
{
  uint64_t v1;
  float v2;
  dispatch_time_t v3;

  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(result + 8) == 2)
    {
      *(_DWORD *)(result + 8) = 3;
      v2 = *(float *)(result + 64);
      if (v2 == 0.0)
        v3 = -1;
      else
        v3 = dispatch_time(0, (uint64_t)(float)(v2 * 1000000000.0));
      return dispatch_group_wait(*(dispatch_group_t *)(v1 + 40), v3) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)streamDidStop
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(result + 8) == 3)
    {
      *(_DWORD *)(result + 8) = 0;
      dispatch_group_enter(*(dispatch_group_t *)(result + 24));
      *(_BYTE *)(v1 + 32) = 1;
      v2 = *(_QWORD *)(v1 + 48);
      if (v2)
        dispatch_group_leave(*(dispatch_group_t *)(v2 + 40));
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v3 = *(void **)(v1 + 56);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v4 = result;
        v5 = *(_QWORD *)v9;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v9 != v5)
              objc_enumerationMutation(v3);
            v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
            if (v7)
              dispatch_group_leave(*(dispatch_group_t *)(v7 + 40));
            ++v6;
          }
          while (v4 != v6);
          result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

@end
