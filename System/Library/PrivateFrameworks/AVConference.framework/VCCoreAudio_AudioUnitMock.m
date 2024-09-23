@implementation VCCoreAudio_AudioUnitMock

+ (id)sharedInstance
{
  if (sharedInstance_token_5 != -1)
    dispatch_once(&sharedInstance_token_5, &__block_literal_global_88);
  return (id)sharedInstance__audioUnitMock;
}

- (VCCoreAudio_AudioUnitMock)init
{
  VCCoreAudio_AudioUnitMock *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCCoreAudio_AudioUnitMock;
  v2 = -[VCObject init](&v4, sel_init);
  if (v2)
    v2->_audioUnitInstanceMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)start
{
  -[VCObject lock](self, "lock");
  if (!self->_isMockingEnabled)
  {
    _audioUnitStub = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Initialize;
    off_1ED10CD08 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Uninitialize;
    off_1ED10CD10 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_SetProperty;
    off_1ED10CD18 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_GetProperty;
    off_1ED10CD20 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_Render;
    off_1ED10CD28 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_ComplexRender;
    off_1ED10CD30 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_OutputUnitStart;
    off_1ED10CD38 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_OutputUnitStop;
    off_1ED10CD40 = (uint64_t (*)(void))VCCoreAudio_AudioUnitMock_SetParameter;
    self->_isMockingEnabled = 1;
    if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceEnableAudioMockInputPathForAppleTV"), 0))
    {
      -[VCCoreAudio_AudioUnitMock startMicThread](self, "startMicThread");
    }
  }
  -[VCObject unlock](self, "unlock");
}

- (void)stop
{
  -[VCObject lock](self, "lock");
  if (self->_isMockingEnabled)
  {
    _audioUnitStub = (uint64_t (*)(void))MEMORY[0x1E0C921F0];
    off_1ED10CD08 = (uint64_t (*)(void))MEMORY[0x1E0C92228];
    off_1ED10CD10 = (uint64_t (*)(void))MEMORY[0x1E0C92220];
    off_1ED10CD18 = (uint64_t (*)(void))MEMORY[0x1E0C921E0];
    off_1ED10CD20 = (uint64_t (*)(void))MEMORY[0x1E0C92208];
    off_1ED10CD28 = MEMORY[0x1E0C921D0];
    off_1ED10CD30 = (uint64_t (*)(void))MEMORY[0x1E0C91FE0];
    off_1ED10CD38 = (uint64_t (*)(void))MEMORY[0x1E0C91FE8];
    off_1ED10CD40 = (uint64_t (*)(void))MEMORY[0x1E0C92218];
    self->_isMockingEnabled = 0;
    if (self->_micThread)
      -[VCCoreAudio_AudioUnitMock stopMicThread](self, "stopMicThread");
  }
  -[VCObject unlock](self, "unlock");
}

- (void)startMicThread
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create thread=%s", v2, v3, v4, v5, v6);
}

- (void)stopMicThread
{
  self->_terminateMicThread = 1;
  VCRealTimeThread_Stop((uint64_t)self->_micThread);
  VCRealTimeThread_Finalize((uint64_t)self->_micThread);
}

- (void)runAudioCallback
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)-[NSMutableDictionary allValues](self->_audioUnitInstanceMap, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[VCObject lock](self, "lock");
        if (!self->_terminateMicThread
          && self->_isMockingEnabled
          && objc_msgSend(v8, "isInitialized")
          && objc_msgSend(v8, "isRunning"))
        {
          v9 = objc_msgSend(v8, "isReconfiguring");
          -[VCObject unlock](self, "unlock");
          if ((v9 & 1) == 0)
            objc_msgSend(v8, "runAudioCallback");
        }
        else
        {
          -[VCObject unlock](self, "unlock");
        }
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v5 = v10;
    }
    while (v10);
  }
}

- (void)runAudioCallbackWithSampleCount:(unsigned int)a3 timeGap:(double)a4
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)-[NSMutableDictionary allValues](self->_audioUnitInstanceMap, "allValues");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[VCObject lock](self, "lock");
        if (!self->_terminateMicThread
          && self->_isMockingEnabled
          && objc_msgSend(v12, "isInitialized")
          && objc_msgSend(v12, "isRunning"))
        {
          v13 = objc_msgSend(v12, "isReconfiguring");
          -[VCObject unlock](self, "unlock");
          if ((v13 & 1) == 0)
            objc_msgSend(v12, "runAudioCallbackWithSampleCount:timeGap:", v5, a4);
        }
        else
        {
          -[VCObject unlock](self, "unlock");
        }
        ++v11;
      }
      while (v9 != v11);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      v9 = v14;
    }
    while (v14);
  }
}

- (BOOL)generateMutedTalkerNotification:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->_audioUnitInstanceMap, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[VCObject lock](self, "lock");
        if (!self->_terminateMicThread && self->_isMockingEnabled && objc_msgSend(v10, "isInitialized"))
        {
          v11 = objc_msgSend(v10, "isRunning");
          -[VCObject unlock](self, "unlock");
          if (v11)
            v8 &= objc_msgSend(v10, "generateMutedTalkerNotification:", a3);
        }
        else
        {
          -[VCObject unlock](self, "unlock");
        }
        ++v9;
      }
      while (v6 != v9);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      v6 = v12;
    }
    while (v12);
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8 & 1;
}

- (BOOL)registerAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3
{
  id v5;
  VCCoreAudio_AudioUnitMockInstance *v6;
  id v7;

  v5 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:");
  if (!v5)
  {
    v6 = objc_alloc_init(VCCoreAudio_AudioUnitMockInstance);
    v7 = -[VCCoreAudio_AudioUnitMock newKeyForAudioUnit:](self, "newKeyForAudioUnit:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioUnitInstanceMap, "setObject:forKeyedSubscript:", v6, v7);

  }
  return v5 == 0;
}

- (BOOL)unregisterAudioUnitMockInstance:(OpaqueAudioComponentInstance *)a3
{
  id v5;
  id v6;

  v5 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:");
  if (v5)
  {
    v6 = -[VCCoreAudio_AudioUnitMock newKeyForAudioUnit:](self, "newKeyForAudioUnit:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioUnitInstanceMap, "setObject:forKeyedSubscript:", 0, v6);

  }
  return v5 != 0;
}

- (BOOL)shouldProcessAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if ((uint64_t)a3 > 1919512424)
  {
    if (a3 == (OpaqueAudioComponentInstance *)1919512425)
      return result;
    v4 = 1987078510;
  }
  else
  {
    if (a3 == (OpaqueAudioComponentInstance *)1650616686)
      return result;
    v4 = 1684366953;
  }
  if (a3 != (OpaqueAudioComponentInstance *)v4)
    return a3 == (OpaqueAudioComponentInstance *)1937339241;
  return result;
}

- (id)newKeyForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), a3);
}

- (id)audioInstanceForAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  id v4;
  void *v5;

  v4 = -[VCCoreAudio_AudioUnitMock newKeyForAudioUnit:](self, "newKeyForAudioUnit:", a3);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_audioUnitInstanceMap, "objectForKey:", v4);

  return v5;
}

- (BOOL)setProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 inData:(const void *)a7 inDataSize:(unsigned int)a8 outStatus:(int *)a9
{
  uint64_t v9;
  uint64_t v11;
  id v15;
  BOOL v16;
  int v17;

  v9 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a5;
  -[VCObject lock](self, "lock", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  if (!self->_isMockingEnabled
    || !-[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v16 = 0;
    goto LABEL_23;
  }
  v15 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
  *a9 = 0;
  v16 = 1;
  if ((int)a4 > 2020)
  {
    if ((int)a4 > 2105)
    {
      if (a4 == 2106)
      {
        v17 = objc_msgSend(v15, "setMutedTalkerNotificiationHandlerWithScope:data:dataSize:", v11, a7, v9);
        goto LABEL_22;
      }
      if (a4 == 1718839674)
        objc_msgSend(v15, "setBufferFrameSizeSet:", 1);
    }
    else
    {
      if (a4 == 2021)
      {
        v17 = objc_msgSend(v15, "setIOBufferDurationWithScope:data:dataSize:", v11, a7, v9);
        goto LABEL_22;
      }
      if (a4 == 2023)
        objc_msgSend(v15, "setAudioSessionIDSet:", 1);
    }
  }
  else if ((int)a4 > 2002)
  {
    if (a4 == 2003)
    {
      v17 = objc_msgSend(v15, "setEnableIOWithScope:data:dataSize:", v11, a7, v9);
      goto LABEL_22;
    }
    if (a4 == 2005)
    {
      v17 = objc_msgSend(v15, "setInputCallbackWithScope:data:dataSize:", v11, a7, v9);
      goto LABEL_22;
    }
  }
  else
  {
    if (a4 == 8)
    {
      v17 = objc_msgSend(v15, "setStreamFormatWithScope:data:dataSize:", v11, a7, v9);
      goto LABEL_22;
    }
    if (a4 == 23)
    {
      v17 = objc_msgSend(v15, "setRenderCallbackWithScope:data:dataSize:", v11, a7, v9);
LABEL_22:
      *a9 = v17;
    }
  }
LABEL_23:
  -[VCObject unlock](self, "unlock");
  return v16;
}

- (BOOL)getProperty:(OpaqueAudioComponentInstance *)a3 inID:(unsigned int)a4 inScope:(unsigned int)a5 inElement:(unsigned int)a6 outData:(void *)a7 ioDataSize:(unsigned int *)a8 outStatus:(int *)a9
{
  uint64_t v11;
  id v15;
  int v16;
  BOOL v17;

  v11 = *(_QWORD *)&a5;
  -[VCObject lock](self, "lock", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v15 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    *a9 = 0;
    v16 = -2;
    if ((int)a4 > 2004)
    {
      switch(a4)
      {
        case 0x7D5u:
          v16 = objc_msgSend(v15, "getInputCallbackWithScope:data:dataSize:", v11, a7, a8);
          break;
        case 0x7E5u:
          v16 = objc_msgSend(v15, "getIOBufferDurationWithScope:data:dataSize:", v11, a7, a8);
          break;
        case 0x840u:
          v16 = objc_msgSend(v15, "getMaximumMediadataByteSizeWithScope:data:dataSize:", v11, a7, a8);
          break;
      }
    }
    else
    {
      switch(a4)
      {
        case 8u:
          v16 = objc_msgSend(v15, "getStreamFormatWithScope:data:dataSize:", v11, a7, a8);
          break;
        case 0x17u:
          v16 = objc_msgSend(v15, "getRenderCallbackWithScope:data:dataSize:", v11, a7, a8);
          break;
        case 0x7D3u:
          v16 = objc_msgSend(v15, "getEnableIOWithScope:data:dataSize:", v11, a7, a8);
          break;
      }
    }
    *a9 = v16;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v17;
}

- (BOOL)render:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberFrames:(unsigned int)a7 ioData:(AudioBufferList *)a8 outStatus:(int *)a9
{
  id v11;
  int v12;
  BOOL v13;

  -[VCObject lock](self, "lock", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v11 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if (objc_msgSend(v11, "isInitialized"))
    {
      v12 = -3;
      if (objc_msgSend(v11, "isRunning"))
      {
        if (objc_msgSend(v11, "isReconfiguring"))
          v12 = -3;
        else
          v12 = 0;
      }
    }
    else
    {
      v12 = -3;
    }
    *a9 = v12;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v13;
}

- (BOOL)complexRender:(OpaqueAudioComponentInstance *)a3 ioActionFlags:(unsigned int *)a4 inTimeStamp:(const AudioTimeStamp *)a5 inOutputBusNumber:(unsigned int)a6 inNumberOfPackets:(unsigned int)a7 outNumberOfPackets:(unsigned int *)a8 outPacketDescriptions:(AudioStreamPacketDescription *)a9 ioData:(AudioBufferList *)a10 outMetadata:(void *)a11 outMetadataByteSize:(unsigned int *)a12 outStatus:(int *)a13
{
  id v15;
  int v16;
  BOOL v17;

  -[VCObject lock](self, "lock", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v15 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if (objc_msgSend(v15, "isInitialized"))
    {
      v16 = -3;
      if (objc_msgSend(v15, "isRunning"))
      {
        if (objc_msgSend(v15, "isReconfiguring"))
          v16 = -3;
        else
          v16 = 0;
      }
    }
    else
    {
      v16 = -3;
    }
    *a13 = v16;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v17;
}

- (BOOL)initialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  id v7;
  int v8;
  BOOL v9;

  -[VCObject lock](self, "lock");
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v7 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if ((objc_msgSend(v7, "isRunning") & 1) != 0)
    {
      v8 = -3;
    }
    else
    {
      objc_msgSend(v7, "setIsInitialized:", 1);
      v8 = 0;
    }
    *a4 = v8;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v9;
}

- (BOOL)uninitialize:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  id v7;
  int v8;
  BOOL v9;

  -[VCObject lock](self, "lock");
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v7 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if (!objc_msgSend(v7, "isInitialized") || (objc_msgSend(v7, "isRunning") & 1) != 0)
    {
      v8 = -3;
    }
    else
    {
      objc_msgSend(v7, "setIsInitialized:", 0);
      v8 = 0;
    }
    *a4 = v8;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v9;
}

- (BOOL)outputUnitStart:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  id v7;
  BOOL v8;

  -[VCObject lock](self, "lock");
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v7 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if (!objc_msgSend(v7, "isInitialized") || objc_msgSend(v7, "isRunning"))
    {
      *a4 = -3;
      v8 = 1;
    }
    else
    {
      *a4 = 0;
      v8 = 1;
      objc_msgSend(v7, "setIsRunning:", 1);
    }
  }
  else
  {
    v8 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v8;
}

- (BOOL)outputUnitStop:(OpaqueAudioComponentInstance *)a3 outStatus:(int *)a4
{
  id v7;
  BOOL v8;

  -[VCObject lock](self, "lock");
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v7 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    if (objc_msgSend(v7, "isInitialized") && (objc_msgSend(v7, "isRunning") & 1) != 0)
    {
      *a4 = 0;
      objc_msgSend(v7, "setIsRunning:", 0);
    }
    else
    {
      *a4 = -3;
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v8;
}

- (BOOL)audioUnit:(OpaqueAudioComponentInstance *)a3 setParameter:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 value:(float)a7 bufferOffsetInFrames:(unsigned int)a8 outStatus:(int *)a9
{
  id v14;
  double v15;
  BOOL v16;

  -[VCObject lock](self, "lock", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a8);
  if (self->_isMockingEnabled
    && -[VCCoreAudio_AudioUnitMock shouldProcessAudioUnit:](self, "shouldProcessAudioUnit:", a3))
  {
    v14 = -[VCCoreAudio_AudioUnitMock audioInstanceForAudioUnit:](self, "audioInstanceForAudioUnit:", a3);
    *a9 = 0;
    if (a4 == 14)
    {
      *(float *)&v15 = a7;
      objc_msgSend(v14, "setDynamicDuckerVolume:", v15);
    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v16;
}

@end
