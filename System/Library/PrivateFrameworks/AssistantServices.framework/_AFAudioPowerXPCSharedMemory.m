@implementation _AFAudioPowerXPCSharedMemory

- (_AFAudioPowerXPCSharedMemory)initWithXPCObject:(id)a3
{
  id v5;
  _AFAudioPowerXPCSharedMemory *v6;
  NSObject *v7;
  const char *v8;
  size_t v9;
  void *sharedRegion;
  BOOL v11;
  unint64_t mappedLength;
  NSObject *v13;
  NSObject *v14;
  _AFAudioPowerXPCSharedMemory *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_AFAudioPowerXPCSharedMemory;
  v6 = -[_AFAudioPowerXPCSharedMemory init](&v17, sel_init);
  if (!v6)
    goto LABEL_21;
  if (v5)
  {
    if (MEMORY[0x1A1AC0F84](v5) != MEMORY[0x1E0C81388])
    {
      v7 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
        v8 = "%s Unexpectec XPC object type.";
LABEL_8:
        _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    objc_storeStrong((id *)&v6->_xpcObject, a3);
    v9 = xpc_shmem_map(v5, &v6->_sharedRegion);
    v6->_mappedLength = v9;
    sharedRegion = v6->_sharedRegion;
    if (sharedRegion)
      v11 = v9 > 7;
    else
      v11 = 0;
    if (!v11)
    {
      mappedLength = v9;
      if (!sharedRegion)
      {
        v13 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
          _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s Mapping failed due to nil shared region.", buf, 0xCu);
          mappedLength = v6->_mappedLength;
        }
      }
      if (mappedLength <= 7)
      {
        v14 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
          v20 = 2048;
          v21 = mappedLength;
          _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Mapping failed due to unexpected mapped length (mappedLength = %zd).", buf, 0x16u);
        }
      }
      -[_AFAudioPowerXPCSharedMemory _destroyMapping](v6, "_destroyMapping");
      goto LABEL_20;
    }
LABEL_21:
    v15 = v6;
    goto LABEL_22;
  }
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[_AFAudioPowerXPCSharedMemory initWithXPCObject:]";
    v8 = "%s XPC object is nil.";
    goto LABEL_8;
  }
LABEL_20:
  v15 = 0;
LABEL_22:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[_AFAudioPowerXPCSharedMemory _destroyMapping](self, "_destroyMapping");
  v3.receiver = self;
  v3.super_class = (Class)_AFAudioPowerXPCSharedMemory;
  -[_AFAudioPowerXPCSharedMemory dealloc](&v3, sel_dealloc);
}

- (float)averagePower
{
  return *(float *)self->_sharedRegion;
}

- (float)peakPower
{
  return *((float *)self->_sharedRegion + 1);
}

- (void)_destroyMapping
{
  void *sharedRegion;
  size_t mappedLength;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sharedRegion = self->_sharedRegion;
  if (sharedRegion)
  {
    mappedLength = self->_mappedLength;
    if (mappedLength)
    {
      v5 = munmap(sharedRegion, mappedLength);
      if (v5)
      {
        v6 = v5;
        v7 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          v8 = 136315394;
          v9 = "-[_AFAudioPowerXPCSharedMemory _destroyMapping]";
          v10 = 1024;
          v11 = v6;
          _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s %d", (uint8_t *)&v8, 0x12u);
        }
      }
    }
  }
  self->_mappedLength = 0;
  self->_sharedRegion = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcObject, 0);
}

@end
