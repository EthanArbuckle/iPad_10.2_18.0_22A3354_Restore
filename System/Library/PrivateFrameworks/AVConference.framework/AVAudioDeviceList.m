@implementation AVAudioDeviceList

+ (id)defaultInputDevice
{
  return 0;
}

+ (id)defaultOutputDevice
{
  return 0;
}

+ (id)currentInputDevice
{
  return 0;
}

+ (BOOL)setInputDevice:(id)a3
{
  return 1;
}

+ (id)deviceForUID:(id)a3
{
  AVAudioDeviceList *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(AVAudioDeviceList);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[AVAudioDeviceList devices](v4, "devices");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if ((objc_msgSend((id)objc_msgSend(v10, "UID"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  v11 = v10;

  return v10;
}

+ (id)deviceForDeviceID:(unsigned int)a3
{
  AVAudioDeviceList *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(AVAudioDeviceList);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[AVAudioDeviceList devices](v4, "devices");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "deviceID"), "unsignedIntValue") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  v11 = v10;

  return v10;
}

- (AVAudioDeviceList)init
{
  AVAudioDeviceList *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVAudioDeviceList;
  v2 = -[AVAudioDeviceList init](&v4, sel_init);
  if (v2)
    v2->_internalList = objc_alloc_init(AVInternalDeviceList);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[AVInternalDeviceList cleanup](self->_internalList, "cleanup");

  v3.receiver = self;
  v3.super_class = (Class)AVAudioDeviceList;
  -[AVAudioDeviceList dealloc](&v3, sel_dealloc);
}

- (void)setChangeListener:(id)a3
{
  -[AVInternalDeviceList setChangeListener:](self->_internalList, "setChangeListener:", a3);
}

- (id)changeListener
{
  return -[AVInternalDeviceList changeListener](self->_internalList, "changeListener");
}

- (id)devices
{
  id v3;
  const char *v4;
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[AVInternalDeviceList deviceList](self->_internalList, "deviceList");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v4 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    v5 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s devices=%s", v4, v5);
    if (__str)
    {
      __lasts = 0;
      v6 = strtok_r(__str, "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v14 = v8;
            v15 = 2080;
            v16 = "-[AVAudioDeviceList devices]";
            v17 = 1024;
            v18 = 826;
            v19 = 2080;
            v20 = "AVAudioDeviceList-devices";
            v21 = 2080;
            v22 = v6;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
    }
  }
  return v3;
}

- (id)inputDevices
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  char *v7;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[AVInternalDeviceList deviceList](self->_internalList, "deviceList");
  v4 = (void *)objc_msgSend(v3, "objectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_57));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v5 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    v6 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s inputDevices=%s", v5, v6);
    if (__str)
    {
      __lasts = 0;
      v7 = strtok_r(__str, "\n", &__lasts);
      v8 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVAudioDeviceList inputDevices]";
            v18 = 1024;
            v19 = 844;
            v20 = 2080;
            v21 = "AVAudioDeviceList-inputDevices";
            v22 = 2080;
            v23 = v7;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v7 = strtok_r(0, "\n", &__lasts);
      }
      while (v7);
      free(__str);
    }
  }
  return v4;
}

uint64_t __33__AVAudioDeviceList_inputDevices__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "inputAvailable");
  if (v3)
    v4 = objc_msgSend(a2, "isValidInputDevice");
  else
    v4 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316418;
      v9 = v5;
      v10 = 2080;
      v11 = "-[AVAudioDeviceList inputDevices]_block_invoke";
      v12 = 1024;
      v13 = 839;
      v14 = 2048;
      v15 = a2;
      v16 = 1024;
      v17 = v3;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d audioDevice=%p isInputAvailable=%{BOOL}d isValidInputDevice=%{BOOL}d", (uint8_t *)&v8, 0x32u);
    }
  }
  return v4;
}

- (id)outputDevices
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  char *v7;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[AVInternalDeviceList deviceList](self->_internalList, "deviceList");
  v4 = (void *)objc_msgSend(v3, "objectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_103));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v5 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    v6 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s outputDevices=%s", v5, v6);
    if (__str)
    {
      __lasts = 0;
      v7 = strtok_r(__str, "\n", &__lasts);
      v8 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVAudioDeviceList outputDevices]";
            v18 = 1024;
            v19 = 858;
            v20 = 2080;
            v21 = "AVAudioDeviceList-outputDevices";
            v22 = 2080;
            v23 = v7;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v7 = strtok_r(0, "\n", &__lasts);
      }
      while (v7);
      free(__str);
    }
  }
  return v4;
}

uint64_t __34__AVAudioDeviceList_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "outputAvailable");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v4;
      v9 = 2080;
      v10 = "-[AVAudioDeviceList outputDevices]_block_invoke";
      v11 = 1024;
      v12 = 853;
      v13 = 2048;
      v14 = a2;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d audioDevice=%p outputAvailable=%{BOOL}d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return v3;
}

@end
