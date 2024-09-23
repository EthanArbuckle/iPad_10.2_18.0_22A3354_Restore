@implementation ASAObject

- (ASAObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASAObject init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (ASAObject)initWithAudioObjectID:(unsigned int)a3
{
  ASAObject *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASAObject;
  result = -[ASAObject init](&v5, sel_init);
  if (result)
  {
    if (a3)
    {
      result->_objectID = a3;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (BOOL)hasProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5
{
  AudioObjectPropertyAddress inAddress;

  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  return AudioObjectHasProperty(self->_objectID, &inAddress) != 0;
}

- (BOOL)hasInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1768845428, *(_QWORD *)&a4);
}

- (BOOL)hasMainInputProperty:(unsigned int)a3
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1768845428, 0);
}

- (BOOL)hasOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1869968496, *(_QWORD *)&a4);
}

- (BOOL)hasMainOutputProperty:(unsigned int)a3
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1869968496, 0);
}

- (BOOL)hasGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1735159650, *(_QWORD *)&a4);
}

- (BOOL)hasMainGlobalProperty:(unsigned int)a3
{
  return -[ASAObject hasProperty:scope:ofElement:](self, "hasProperty:scope:ofElement:", *(_QWORD *)&a3, 1735159650, 0);
}

- (unsigned)sizeOfProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  unsigned int result;
  OSStatus PropertyDataSize;
  unsigned int objectID;
  AudioObjectPropertyAddress v16;
  UInt32 outDataSize;
  uint8_t buf[4];
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  OSStatus v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v16.mElement = a5;
  outDataSize = 0;
  v16.mSelector = a3;
  v16.mScope = a4;
  result = AudioObjectHasProperty(self->_objectID, &v16);
  if (result)
  {
    PropertyDataSize = AudioObjectGetPropertyDataSize(self->_objectID, &v16, a7, a6, &outDataSize);
    if (PropertyDataSize)
      outDataSize = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      v19 = objectID;
      v20 = 1024;
      v21 = a3;
      v22 = 1024;
      v23 = a4;
      v24 = 1024;
      v25 = a5;
      v26 = 1024;
      v27 = PropertyDataSize;
      _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u sizeOfProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
    return outDataSize;
  }
  return result;
}

- (unsigned)sizeOfInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (unsigned)sizeOfMainInputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, 0, a4, *(_QWORD *)&a5);
}

- (unsigned)sizeOfOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (unsigned)sizeOfMainOutputProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, 0, a4, *(_QWORD *)&a5);
}

- (unsigned)sizeOfGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withQualifier:(void *)a5 ofSize:(unsigned int)a6
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (unsigned)sizeOfMainGlobalProperty:(unsigned int)a3 withQualifier:(void *)a4 ofSize:(unsigned int)a5
{
  return -[ASAObject sizeOfProperty:scope:ofElement:withQualifier:ofSize:](self, "sizeOfProperty:scope:ofElement:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, 0, a4, *(_QWORD *)&a5);
}

- (BOOL)getProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int *)a7 withQualifier:(void *)a8 ofSize:(unsigned int)inQualifierDataSize
{
  OSStatus PropertyData;
  BOOL v17;
  unsigned int objectID;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  OSStatus v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  if (AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    PropertyData = AudioObjectGetPropertyData(self->_objectID, &inAddress, inQualifierDataSize, a8, a7, a6);
    v17 = PropertyData == 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      v22 = objectID;
      v23 = 1024;
      v24 = a3;
      v25 = 1024;
      v26 = a4;
      v27 = 1024;
      v28 = a5;
      v29 = 1024;
      v30 = PropertyData;
      _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u getProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    v17 = 0;
    if (a6 && a7)
    {
      bzero(a6, *a7);
      return 0;
    }
  }
  return v17;
}

- (BOOL)getInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, *(_QWORD *)&a4, a5, a6, a7, v9);
}

- (BOOL)getMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, 0, a4, a5, a6, v8);
}

- (BOOL)getOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, *(_QWORD *)&a4, a5, a6, a7, v9);
}

- (BOOL)getMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, 0, a4, a5, a6, v8);
}

- (BOOL)getGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int *)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, *(_QWORD *)&a4, a5, a6, a7, v9);
}

- (BOOL)getMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int *)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "getProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, 0, a4, a5, a6, v8);
}

- (BOOL)setProperty:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5 withData:(void *)a6 ofSize:(unsigned int)a7 withQualifier:(void *)a8 ofSize:(unsigned int)a9
{
  BOOL v15;
  BOOL v16;
  OSStatus v17;
  unsigned int objectID;
  Boolean outIsSettable;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  OSStatus v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  inAddress.mSelector = a3;
  inAddress.mScope = a4;
  inAddress.mElement = a5;
  if (!AudioObjectHasProperty(self->_objectID, &inAddress))
    return 0;
  outIsSettable = 0;
  v15 = 0;
  if (AudioObjectIsPropertySettable(self->_objectID, &inAddress, &outIsSettable))
    v16 = 1;
  else
    v16 = outIsSettable == 0;
  if (!v16)
  {
    v17 = AudioObjectSetPropertyData(self->_objectID, &inAddress, 0, 0, a7, a6);
    v15 = v17 == 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      v23 = objectID;
      v24 = 1024;
      v25 = a3;
      v26 = 1024;
      v27 = a4;
      v28 = 1024;
      v29 = a5;
      v30 = 1024;
      v31 = v17;
      _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u setProperty {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  return v15;
}

- (BOOL)setInputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, v9);
}

- (BOOL)setMainInputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1768845428, 0, a4, *(_QWORD *)&a5, a6, v8);
}

- (BOOL)setOutputProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, v9);
}

- (BOOL)setMainOutputProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1869968496, 0, a4, *(_QWORD *)&a5, a6, v8);
}

- (BOOL)setGlobalProperty:(unsigned int)a3 ofElement:(unsigned int)a4 withData:(void *)a5 ofSize:(unsigned int)a6 withQualifier:(void *)a7 ofSize:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, v9);
}

- (BOOL)setMainGlobalProperty:(unsigned int)a3 withData:(void *)a4 ofSize:(unsigned int)a5 withQualifier:(void *)a6 ofSize:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[ASAObject setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:](self, "setProperty:scope:ofElement:withData:ofSize:withQualifier:ofSize:", *(_QWORD *)&a3, 1735159650, 0, a4, *(_QWORD *)&a5, a6, v8);
}

- (BOOL)isPropertySettable:(unsigned int)a3 scope:(unsigned int)a4 ofElement:(unsigned int)a5
{
  OSStatus IsPropertySettable;
  BOOL v10;
  BOOL v11;
  unsigned int objectID;
  AudioObjectPropertyAddress v14;
  Boolean outIsSettable;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  outIsSettable = 0;
  v14.mSelector = a3;
  v14.mScope = a4;
  v14.mElement = a5;
  if (!AudioObjectHasProperty(self->_objectID, &v14))
    return 0;
  IsPropertySettable = AudioObjectIsPropertySettable(self->_objectID, &v14, &outIsSettable);
  if (IsPropertySettable)
    v10 = 1;
  else
    v10 = outIsSettable == 0;
  v11 = !v10;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objectID = self->_objectID;
    *(_DWORD *)buf = 67110144;
    v17 = objectID;
    v18 = 1024;
    v19 = a3;
    v20 = 1024;
    v21 = a4;
    v22 = 1024;
    v23 = a5;
    v24 = 1024;
    v25 = IsPropertySettable;
    _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u isPropertySettable {%u, %u, %u} returned status %u", buf, 0x20u);
  }
  return v11;
}

- (BOOL)isInputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1768845428, *(_QWORD *)&a4);
}

- (BOOL)isMainInputPropertySettable:(unsigned int)a3
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1768845428, 0);
}

- (BOOL)isOutputPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1869968496, *(_QWORD *)&a4);
}

- (BOOL)isMainOutputPropertySettable:(unsigned int)a3
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1869968496, 0);
}

- (BOOL)isGlobalPropertySettable:(unsigned int)a3 ofElement:(unsigned int)a4
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1735159650, *(_QWORD *)&a4);
}

- (BOOL)isMainGlobalPropertySettable:(unsigned int)a3
{
  return -[ASAObject isPropertySettable:scope:ofElement:](self, "isPropertySettable:scope:ofElement:", *(_QWORD *)&a3, 1735159650, 0);
}

- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 addListener:(id)a7
{
  NSObject *v12;
  id v13;
  OSStatus v14;
  BOOL v15;
  unsigned int objectID;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  inAddress.mSelector = a4;
  inAddress.mScope = a5;
  inAddress.mElement = a6;
  if (a4 == 707406378 || AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    v14 = AudioObjectAddPropertyListenerBlock(self->_objectID, &inAddress, v12, v13);
    v15 = v14 == 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      v20 = objectID;
      v21 = 1024;
      v22 = a4;
      v23 = 1024;
      v24 = a5;
      v25 = 1024;
      v26 = a6;
      v27 = 1024;
      v28 = v14;
      _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u addListener {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1768845428, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 addListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1768845428, 0, a5);
}

- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1869968496, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 addListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1869968496, 0, a5);
}

- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 addListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1735159650, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 addListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:addListener:](self, "onQueue:forProperty:scope:ofElement:addListener:", a3, *(_QWORD *)&a4, 1735159650, 0, a5);
}

- (BOOL)onQueue:(id)a3 forProperty:(unsigned int)a4 scope:(unsigned int)a5 ofElement:(unsigned int)a6 removeListener:(id)a7
{
  NSObject *v12;
  id v13;
  OSStatus v14;
  BOOL v15;
  unsigned int objectID;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  inAddress.mSelector = a4;
  inAddress.mScope = a5;
  inAddress.mElement = a6;
  if (a4 == 707406378 || AudioObjectHasProperty(self->_objectID, &inAddress))
  {
    v14 = AudioObjectRemovePropertyListenerBlock(self->_objectID, &inAddress, v12, v13);
    v15 = v14 == 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objectID = self->_objectID;
      *(_DWORD *)buf = 67110144;
      v20 = objectID;
      v21 = 1024;
      v22 = a4;
      v23 = 1024;
      v24 = a5;
      v25 = 1024;
      v26 = a6;
      v27 = 1024;
      v28 = v14;
      _os_log_debug_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "object %u removeListener {%u, %u, %u} returned status %u", buf, 0x20u);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)onQueue:(id)a3 forInputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1768845428, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainInputProperty:(unsigned int)a4 removeListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1768845428, 0, a5);
}

- (BOOL)onQueue:(id)a3 forOutputProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1869968496, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainOutputProperty:(unsigned int)a4 removeListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1869968496, 0, a5);
}

- (BOOL)onQueue:(id)a3 forGlobalProperty:(unsigned int)a4 ofElement:(unsigned int)a5 removeListener:(id)a6
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1735159650, *(_QWORD *)&a5, a6);
}

- (BOOL)onQueue:(id)a3 forMainGlobalProperty:(unsigned int)a4 removeListener:(id)a5
{
  return -[ASAObject onQueue:forProperty:scope:ofElement:removeListener:](self, "onQueue:forProperty:scope:ofElement:removeListener:", a3, *(_QWORD *)&a4, 1735159650, 0, a5);
}

- (unsigned)baseClass
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1650682995, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read base class property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)objectClass
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668047219, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read object class property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)ownerID
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1937007734, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read object owner property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)ownedObjectIDs
{
  unsigned int v3;
  size_t v4;
  unsigned int *v5;
  unsigned int *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  unsigned int v15;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1870098020, 0, 0);
  v15 = v3;
  if (v3 && (v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0xB45735F4uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1870098020, v6, &v15, 0, 0);
    v8 = 0;
    if (v7)
    {
      v9 = v15;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 4)
      {
        v10 = v9 >> 2;
        v11 = v6;
        do
        {
          v12 = *v11++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAObject coreAudioClassName](self, "coreAudioClassName");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "appendFormat:", CFSTR("%@+%s\n"), v5, objc_msgSend(v7, "UTF8String"));

  objc_msgSend(v6, "appendFormat:", CFSTR("%@|    Object ID: %u\n"), v5, -[ASAObject objectID](self, "objectID"));
  v8 = -[ASAObject baseClass](self, "baseClass");
  LODWORD(v9) = v8 >> 24;
  if ((v8 - 0x20000000) >> 24 >= 0x5F)
    v9 = 32;
  else
    v9 = v9;
  LODWORD(v10) = v8 << 8 >> 24;
  if (((v8 << 8) - 0x20000000) >> 24 >= 0x5F)
    v10 = 32;
  else
    v10 = v10;
  LODWORD(v11) = (__int16)v8 >> 8;
  if (((v8 << 16) - 0x20000000) >> 24 >= 0x5F)
    v11 = 32;
  else
    v11 = v11;
  if (v8 << 24 == 2130706432 || v8 << 24 < 520093697)
    v13 = 32;
  else
    v13 = (char)v8;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@|    Base Class: %c%c%c%c\n"), v5, v9, v10, v11, v13);
  v14 = -[ASAObject objectClass](self, "objectClass");
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  LODWORD(v17) = (__int16)v14 >> 8;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = v17;
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697)
    v19 = 32;
  else
    v19 = (char)v14;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@|    Object Class: %c%c%c%c\n"), v5, v15, v16, v17, v19);
  objc_msgSend(v6, "appendFormat:", CFSTR("%@|    Owner ID: %u\n"), v5, -[ASAObject ownerID](self, "ownerID"));
  -[ASAObject ownedObjectIDs](self, "ownedObjectIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@|    Owned Objects:\n"), v5);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v21);
          objc_msgSend(v6, "appendFormat:", CFSTR("%@|        %u: %u\n"), v5, v24 + i, objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntValue"));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v24 = (v24 + i);
      }
      while (v23);
    }

  }
  return v6;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioObject");
}

- (unsigned)objectID
{
  return self->_objectID;
}

@end
