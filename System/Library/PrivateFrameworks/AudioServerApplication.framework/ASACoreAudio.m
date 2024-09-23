@implementation ASACoreAudio

+ (id)sharedCoreAudioObject
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASACoreAudio_sharedCoreAudioObject__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoreAudioObject_onceToken != -1)
    dispatch_once(&sharedCoreAudioObject_onceToken, block);
  return (id)_sharedCoreAudioObject;
}

void __37__ASACoreAudio_sharedCoreAudioObject__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "coreAudio");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_sharedCoreAudioObject;
  _sharedCoreAudioObject = v1;

}

+ (id)coreAudio
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAudioObjectID:", 1);
}

- (ASACoreAudio)initWithAudioObjectID:(unsigned int)a3
{
  ASACoreAudio *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASACoreAudio;
  v3 = -[ASAObject initWithAudioObjectID:](&v7, sel_initWithAudioObjectID_, *(_QWORD *)&a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.AudioVideoBridging.ASACoreAudio.client", 0);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v4;

    if (v3->_clientQueue)
    {
      -[ASACoreAudio _setupDeathSource](v3, "_setupDeathSource");
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)addClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ASACoreAudio_addClient___block_invoke;
  block[3] = &unk_24E045640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(clientQueue, block);

}

void __26__ASACoreAudio_addClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x22077C4E4]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASACoreAudio_removeClient___block_invoke;
  block[3] = &unk_24E045640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(clientQueue, block);

}

uint64_t __29__ASACoreAudio_removeClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)addPlugin:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ASACoreAudio_addPlugin___block_invoke;
  block[3] = &unk_24E045640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(clientQueue, block);

}

void __26__ASACoreAudio_addPlugin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x22077C4E4]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)removePlugin:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASACoreAudio_removePlugin___block_invoke;
  block[3] = &unk_24E045640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(clientQueue, block);

}

uint64_t __29__ASACoreAudio_removePlugin___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (unsigned)boxObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841250, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)boxWithUID:(id)a3
{
  id v4;
  ASABox *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASABox alloc];
  v6 = -[ASACoreAudio boxObjectIDWithUID:](self, "boxObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)audioDeviceObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1920297316, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)audioDeviceWithUID:(id)a3
{
  id v4;
  ASAAudioDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAAudioDevice alloc];
  v6 = -[ASACoreAudio audioDeviceObjectIDWithUID:](self, "audioDeviceObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)clockDeviceObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841251, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)clockDeviceWithUID:(id)a3
{
  id v4;
  ASAClockDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAClockDevice alloc];
  v6 = -[ASACoreAudio clockDeviceObjectIDWithUID:](self, "clockDeviceObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)defaultInputAudioDeviceObjectID
{
  unsigned int v3;
  int v4;

  v4 = 4;
  v3 = 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1682533920, &v3, &v4, 0, 0);
  return v3;
}

- (void)_setDefaultInputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;

  v5 = a3;
  v4 = a4;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1682533920, &v5, 4, &v4, 4);
}

- (void)setDefaultInputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultInputAudioDeviceObjectID:transient:](self, "_setDefaultInputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 0);
}

- (ASAAudioDevice)defaultInputAudioDevice
{
  return -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", -[ASACoreAudio defaultInputAudioDeviceObjectID](self, "defaultInputAudioDeviceObjectID"));
}

- (void)setDefaultInputAudioDevice:(id)a3
{
  -[ASACoreAudio setDefaultInputAudioDeviceObjectID:](self, "setDefaultInputAudioDeviceObjectID:", objc_msgSend(a3, "objectID"));
}

- (unsigned)defaultOutputAudioDeviceObjectID
{
  unsigned int v3;
  int v4;

  v4 = 4;
  v3 = 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1682929012, &v3, &v4, 0, 0);
  return v3;
}

- (void)setDefaultOutputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultOutputAudioDeviceObjectID:transient:](self, "_setDefaultOutputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 0);
}

- (void)_setDefaultOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;

  v5 = a3;
  v4 = a4;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1682929012, &v5, 4, &v4, 4);
}

- (ASAAudioDevice)defaultOutputAudioDevice
{
  return -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", -[ASACoreAudio defaultOutputAudioDeviceObjectID](self, "defaultOutputAudioDeviceObjectID"));
}

- (void)setDefaultOutputAudioDevice:(id)a3
{
  -[ASACoreAudio setDefaultOutputAudioDeviceObjectID:](self, "setDefaultOutputAudioDeviceObjectID:", objc_msgSend(a3, "objectID"));
}

- (unsigned)defaultSystemOutputAudioDeviceObjectID
{
  unsigned int v3;
  int v4;

  v4 = 4;
  v3 = 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1934587252, &v3, &v4, 0, 0);
  return v3;
}

- (void)setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultSystemOutputAudioDeviceObjectID:transient:](self, "_setDefaultSystemOutputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 0);
}

- (void)_setDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3 transient:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;

  v5 = a3;
  v4 = a4;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1934587252, &v5, 4, &v4, 4);
}

- (ASAAudioDevice)defaultSystemOutputAudioDevice
{
  return -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", -[ASACoreAudio defaultSystemOutputAudioDeviceObjectID](self, "defaultSystemOutputAudioDeviceObjectID"));
}

- (void)setDefaultSystemOutputAudioDevice:(id)a3
{
  -[ASACoreAudio setDefaultSystemOutputAudioDeviceObjectID:](self, "setDefaultSystemOutputAudioDeviceObjectID:", objc_msgSend(a3, "objectID"));
}

- (void)setTransientDefaultInputAudioDevice:(id)a3
{
  -[ASACoreAudio _setDefaultInputAudioDeviceObjectID:transient:](self, "_setDefaultInputAudioDeviceObjectID:transient:", objc_msgSend(a3, "objectID"), 1);
}

- (void)setTransientDefaultOutputAudioDevice:(id)a3
{
  -[ASACoreAudio _setDefaultOutputAudioDeviceObjectID:transient:](self, "_setDefaultOutputAudioDeviceObjectID:transient:", objc_msgSend(a3, "objectID"), 1);
}

- (void)setTransientDefaultSystemOutputAudioDevice:(id)a3
{
  -[ASACoreAudio _setDefaultSystemOutputAudioDeviceObjectID:transient:](self, "_setDefaultSystemOutputAudioDeviceObjectID:transient:", objc_msgSend(a3, "objectID"), 1);
}

- (void)setTransientDefaultInputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultInputAudioDeviceObjectID:transient:](self, "_setDefaultInputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 1);
}

- (void)setTransientDefaultOutputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultOutputAudioDeviceObjectID:transient:](self, "_setDefaultOutputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 1);
}

- (void)setTransientDefaultSystemOutputAudioDeviceObjectID:(unsigned int)a3
{
  -[ASACoreAudio _setDefaultSystemOutputAudioDeviceObjectID:transient:](self, "_setDefaultSystemOutputAudioDeviceObjectID:transient:", *(_QWORD *)&a3, 1);
}

- (unsigned)transportManagerObjectIDWithBundleID:(id)a3
{
  int v5;
  int v6;
  id v7;

  v7 = a3;
  v5 = 0;
  v6 = 4;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1953325673, &v5, &v6, &v7, 8);
  LODWORD(self) = v5;

  return self;
}

- (id)transportManagerWithBundleID:(id)a3
{
  id v4;
  ASAPlugin *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAPlugin alloc];
  v6 = -[ASACoreAudio transportManagerObjectIDWithBundleID:](self, "transportManagerObjectIDWithBundleID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)pluginObjectIDWithBundleID:(id)a3
{
  int v5;
  int v6;
  id v7;

  v7 = a3;
  v5 = 0;
  v6 = 4;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651074160, &v5, &v6, &v7, 8);
  LODWORD(self) = v5;

  return self;
}

- (id)pluginWithBundleID:(id)a3
{
  id v4;
  ASAPlugin *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAPlugin alloc];
  v6 = -[ASACoreAudio pluginObjectIDWithBundleID:](self, "pluginObjectIDWithBundleID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (NSArray)pluginObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1886152483, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0xD4304762uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1886152483, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)plugins
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAPlugin *v10;
  ASAPlugin *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASACoreAudio pluginObjectIDs](self, "pluginObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASAPlugin alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)boxObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1651472419, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x5E7A0054uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651472419, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)boxes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASABox *v10;
  ASABox *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASACoreAudio boxObjectIDs](self, "boxObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASABox alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)audioDeviceObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1919186467, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x8B038CC0uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1919186467, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)audioDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAAudioDevice *v10;
  ASAAudioDevice *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASACoreAudio audioDeviceObjectIDs](self, "audioDeviceObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASAAudioDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)clockDeviceObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1668049699, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0xFBAA42E2uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668049699, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)clockDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAClockDevice *v10;
  ASAClockDevice *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASACoreAudio clockDeviceObjectIDs](self, "clockDeviceObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASAClockDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  ASABox *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  ASAAudioDevice *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  ASAClockDevice *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  ASAPlugin *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  ASACoreAudio *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v4 = a4;
  v77 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)ASACoreAudio;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v72, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASACoreAudio defaultInputAudioDevice](self, "defaultInputAudioDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Default Input UID: %@\n"), v6, v9);

  -[ASACoreAudio defaultOutputAudioDevice](self, "defaultOutputAudioDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Default Output UID: %@\n"), v6, v11);

  -[ASACoreAudio defaultSystemOutputAudioDevice](self, "defaultSystemOutputAudioDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Default System Output UID: %@\n"), v6, v13);

  -[ASACoreAudio boxObjectIDs](self, "boxObjectIDs");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self;
  if (objc_msgSend(v52, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Box Objects:\n"), v6);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v15 = v52;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v69 != v19)
            objc_enumerationMutation(v15);
          if (v4)
          {
            v21 = -[ASAObject initWithAudioObjectID:]([ASABox alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "unsignedIntValue"));
            -[ASABox diagnosticDescriptionWithIndent:walkTree:](v21, "diagnosticDescriptionWithIndent:walkTree:", v55, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v22);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v14, v18 + i, objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "unsignedIntValue"));
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        v18 = (v18 + i);
      }
      while (v17);
    }

    self = v53;
  }
  -[ASACoreAudio audioDeviceObjectIDs](self, "audioDeviceObjectIDs");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device Objects:\n"), v14);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v23 = v51;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v65 != v27)
            objc_enumerationMutation(v23);
          if (v4)
          {
            v29 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "unsignedIntValue"));
            -[ASAAudioDevice diagnosticDescriptionWithIndent:walkTree:](v29, "diagnosticDescriptionWithIndent:walkTree:", v55, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v30);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v14, v26 + j, objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "unsignedIntValue"));
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        v26 = (v26 + j);
      }
      while (v25);
    }

    self = v53;
  }
  -[ASACoreAudio clockDeviceObjectIDs](self, "clockDeviceObjectIDs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v31;
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Device Objects:\n"), v14);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v32);
          if (v4)
          {
            v38 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "unsignedIntValue"));
            -[ASAClockDevice diagnosticDescriptionWithIndent:walkTree:](v38, "diagnosticDescriptionWithIndent:walkTree:", v55, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v39);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v14, v35 + k, objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "unsignedIntValue"));
          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
        v35 = (v35 + k);
      }
      while (v34);
    }

    self = v53;
    v31 = v50;
  }
  -[ASACoreAudio pluginObjectIDs](self, "pluginObjectIDs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Plugin Objects:\n"), v14);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = v40;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    if (v42)
    {
      v43 = v42;
      v44 = 0;
      v45 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v57 != v45)
            objc_enumerationMutation(v41);
          if (v4)
          {
            v47 = -[ASAObject initWithAudioObjectID:]([ASAPlugin alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "unsignedIntValue"));
            -[ASAPlugin diagnosticDescriptionWithIndent:walkTree:](v47, "diagnosticDescriptionWithIndent:walkTree:", v55, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v48);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v14, v44 + m, objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "unsignedIntValue"));
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
        v44 = (v44 + m);
      }
      while (v43);
    }

    v31 = v50;
    v40 = v54;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("CoreAudio");
}

- (void)dealloc
{
  objc_super v3;

  -[ASACoreAudio _teardownDeathSource](self, "_teardownDeathSource");
  v3.receiver = self;
  v3.super_class = (Class)ASACoreAudio;
  -[ASACoreAudio dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_deathSource, 0);
}

@end
