@implementation TCPBufferPool

- (TCPBufferPool)init
{
  TCPBufferPool *v2;
  TCPBufferPool *v3;
  int v4;
  tagBufferNode *v5;
  tagBufferNode *avail;
  tagBufferNode *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)TCPBufferPool;
  v2 = -[TCPBufferPool init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    v2->poolSize = 48;
    v2->tail = 0;
    v2->avail = 0;
    v2->head = 0;
    while (1)
    {
      v5 = (tagBufferNode *)malloc_type_malloc(0x18uLL, 0x1030040D5FA72FAuLL);
      v3->avail = v5;
      if (!v5)
        break;
      v3->avail->var0 = (char *)malloc_type_malloc(0x3E0uLL, 0x1A05E7F6uLL);
      avail = v3->avail;
      if (!avail->var0)
        break;
      *(_QWORD *)&avail->var1 = 992;
      avail->var3 = v3->head;
      v7 = v3->avail;
      if (!v3->head)
        v3->tail = v7;
      v3->head = v7;
      if (++v4 >= v3->poolSize)
      {
        v3->poolLock = 0;
        return v3;
      }
    }

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  tagBufferNode *i;
  tagBufferNode **p_head;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  p_head = &self->head;
  for (i = self->head; i; i = self->head)
  {
    self->avail = i;
    self->head = i->var3;
    free(i->var0);
    free(self->avail);
  }
  *p_head = 0;
  p_head[1] = 0;
  p_head[2] = 0;
  v5.receiver = self;
  v5.super_class = (Class)TCPBufferPool;
  -[TCPBufferPool dealloc](&v5, sel_dealloc);
}

- (char)getBufferFromPool:(int)a3
{
  size_t v3;
  tagBufferNode *avail;
  char *var0;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int var1;
  int *p_poolSize;
  uint64_t v12;
  NSObject *v13;
  tagBufferNode *v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  LODWORD(v3) = a3;
  v32 = *MEMORY[0x1E0C80C00];
  _os_nospin_lock_lock();
  avail = self->avail;
  if (avail)
  {
    if (avail->var1 >= (int)v3)
    {
      var0 = avail->var0;
      if (!avail->var0)
        goto LABEL_39;
      goto LABEL_38;
    }
    var0 = (char *)malloc_type_malloc((int)v3, 0x7DABEA3FuLL);
    if (var0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        v9 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            var1 = self->avail->var1;
            v22 = 136316162;
            v23 = v7;
            v24 = 2080;
            v25 = "-[TCPBufferPool getBufferFromPool:]";
            v26 = 1024;
            v27 = 1424;
            v28 = 1024;
            v29 = var1;
            v30 = 1024;
            v31 = v3;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: replace %d with %d.", (uint8_t *)&v22, 0x28u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v21 = self->avail->var1;
          v22 = 136316162;
          v23 = v7;
          v24 = 2080;
          v25 = "-[TCPBufferPool getBufferFromPool:]";
          v26 = 1024;
          v27 = 1424;
          v28 = 1024;
          v29 = v21;
          v30 = 1024;
          v31 = v3;
          _os_log_debug_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCPTUNNEL: replace %d with %d.", (uint8_t *)&v22, 0x28u);
        }
      }
      free(self->avail->var0);
      self->avail->var0 = var0;
      avail = self->avail;
      avail->var1 = v3;
LABEL_38:
      ++avail->var2;
      self->avail = avail->var3;
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPBufferPool getBufferFromPool:].cold.4();
    }
LABEL_33:
    var0 = 0;
    goto LABEL_39;
  }
  p_poolSize = &self->poolSize;
  if (self->poolSize == 1024)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315650;
        v23 = v12;
        v24 = 2080;
        v25 = "-[TCPBufferPool getBufferFromPool:]";
        v26 = 1024;
        v27 = 1392;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: buffer pool limit reached.", (uint8_t *)&v22, 0x1Cu);
      }
    }
    goto LABEL_33;
  }
  v14 = (tagBufferNode *)malloc_type_malloc(0x18uLL, 0x1030040D5FA72FAuLL);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPBufferPool getBufferFromPool:].cold.1();
    }
    goto LABEL_33;
  }
  if ((int)v3 <= 992)
    v3 = 992;
  else
    v3 = v3;
  v15 = (char *)malloc_type_malloc(v3, 0xBEAAC485uLL);
  var0 = v15;
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPBufferPool getBufferFromPool:].cold.2();
    }
    free(v14);
    goto LABEL_33;
  }
  v14->var0 = v15;
  v14->var1 = v3;
  v14->var2 = 1;
  v14->var3 = 0;
  self->tail->var3 = v14;
  self->tail = v14;
  ++self->poolSize;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v18 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *p_poolSize;
        v22 = 136315906;
        v23 = v16;
        v24 = 2080;
        v25 = "-[TCPBufferPool getBufferFromPool:]";
        v26 = 1024;
        v27 = 1411;
        v28 = 1024;
        v29 = v19;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: add new buffer to the pool %d", (uint8_t *)&v22, 0x22u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[TCPBufferPool getBufferFromPool:].cold.3();
    }
  }
LABEL_39:
  _os_nospin_lock_unlock();
  return var0;
}

- (void)returnBufferToPool:(char *)a3
{
  tagBufferNode *avail;
  tagBufferNode *head;
  BOOL v7;
  TCPBufferPool *v8;
  BOOL v9;

  _os_nospin_lock_lock();
  avail = self->avail;
  head = self->head;
  if (head)
    v7 = head == avail;
  else
    v7 = 1;
  if (v7 || head->var0 == a3)
  {
    v8 = 0;
  }
  else
  {
    do
    {
      v8 = (TCPBufferPool *)head;
      head = head->var3;
      if (head)
        v9 = head == avail;
      else
        v9 = 1;
    }
    while (!v9 && head->var0 != a3);
  }
  if (avail == head)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[TCPBufferPool returnBufferToPool:].cold.1();
    }
  }
  else
  {
    if (head != self->tail)
    {
      if (!v8)
        v8 = self;
      v8->head = head->var3;
      head->var3 = 0;
      self->tail->var3 = head;
      self->tail = head;
      avail = self->avail;
    }
    if (!avail)
      self->avail = head;
  }
  _os_nospin_lock_unlock();
}

- (void)monitorBufferPool
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  v4 = 1508;
  v5 = v0;
  v6 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCPTUNNEL: %s", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)getBufferFromPool:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: malloc error for a new node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getBufferFromPool:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPBufferPool getBufferFromPool:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: malloc error for buffer %d", v2, *(const char **)v3, (unint64_t)"-[TCPBufferPool getBufferFromPool:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)getBufferFromPool:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d TCPTUNNEL: add new buffer to the pool %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)getBufferFromPool:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPBufferPool getBufferFromPool:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: malloc error for buffer %d", v2, *(const char **)v3, (unint64_t)"-[TCPBufferPool getBufferFromPool:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)returnBufferToPool:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[TCPBufferPool returnBufferToPool:]";
  OUTLINED_FUNCTION_4();
  LODWORD(v4) = 0x8000000;
  HIDWORD(v4) = v0;
  OUTLINED_FUNCTION_5_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: not found in buffer pool %p", v2, *(const char **)v3, (unint64_t)"-[TCPBufferPool returnBufferToPool:]" >> 16, 1456, v4);
  OUTLINED_FUNCTION_19();
}

@end
