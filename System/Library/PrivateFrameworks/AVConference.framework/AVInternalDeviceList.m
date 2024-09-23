@implementation AVInternalDeviceList

+ (id)newDeviceList
{
  return 0;
}

+ (id)defaultDeviceOfType:(unsigned int)a3
{
  return 0;
}

- (unsigned)dataSourceControlID
{
  NSMutableArray *deviceList;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  deviceList = self->deviceList;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceList, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(deviceList);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v7, "isBuiltInDevice"))
        {
          v8 = objc_msgSend(v7, "getDataSourceControlID");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v12 = 136316162;
              v13 = v9;
              v14 = 2080;
              v15 = "-[AVInternalDeviceList dataSourceControlID]";
              v16 = 1024;
              v17 = 576;
              v18 = 2112;
              v19 = objc_msgSend(v7, "deviceID");
              v20 = 1024;
              v21 = v8;
              _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Built-in audio device[%@]'s data source control ID[%u]", (uint8_t *)&v12, 0x2Cu);
            }
          }
          return v8;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deviceList, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 0;
}

- (AVInternalDeviceList)init
{
  AVInternalDeviceList *v2;
  AVInternalDeviceList *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AVInternalDeviceList;
  v2 = -[AVInternalDeviceList init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->changeListener = 0;
    v2->deviceList = (NSMutableArray *)+[AVInternalDeviceList newDeviceList](AVInternalDeviceList, "newDeviceList");
    pthread_mutex_init(&v3->listLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_mutex_destroy(&self->listLock);
  v3.receiver = self;
  v3.super_class = (Class)AVInternalDeviceList;
  -[AVInternalDeviceList dealloc](&v3, sel_dealloc);
}

- (void)notifyDeviceListChanged
{
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

void __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *global_queue;
  id v5;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v5 = +[AVInternalDeviceList newDeviceList](AVInternalDeviceList, "newDeviceList");
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    objc_msgSend(*(id *)(v2 + 16), "setArray:", v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke_2;
    block[3] = &unk_1E9E53548;
    block[4] = v5;
    block[5] = v3;
    dispatch_async(global_queue, block);
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 24));

  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 24));

  }
}

uint64_t __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke_2(uint64_t a1)
{
  void *v2;
  const char *v3;
  char *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = *(void **)(a1 + 32);
    v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Calling changeListener %s", v3);
    if (__str)
    {
      __lasts = 0;
      v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v12 = v6;
            v13 = 2080;
            v14 = "-[AVInternalDeviceList notifyDeviceListChanged]_block_invoke_2";
            v15 = 1024;
            v16 = 684;
            v17 = 2080;
            v18 = "";
            v19 = 2080;
            v20 = v4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)deviceList
{
  _opaque_pthread_mutex_t *p_listLock;
  void *v4;

  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->deviceList);
  pthread_mutex_unlock(p_listLock);
  return v4;
}

- (void)setChangeListener:(id)a3
{
  _opaque_pthread_mutex_t *p_listLock;
  id changeListener;

  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  changeListener = self->changeListener;
  self->changeListener = (id)objc_msgSend(a3, "copy");
  pthread_mutex_unlock(p_listLock);

}

- (id)changeListener
{
  _opaque_pthread_mutex_t *p_listLock;
  id changeListener;

  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  changeListener = self->changeListener;
  pthread_mutex_unlock(p_listLock);
  return changeListener;
}

@end
