@implementation AFAudioPowerXPCProvider

- (AFAudioPowerXPCProvider)initWithXPCWrapper:(id)a3
{
  id v4;
  AFAudioPowerXPCProvider *v5;
  _AFAudioPowerXPCSharedMemory *v6;
  void *v7;
  uint64_t v8;
  _AFAudioPowerXPCSharedMemory *sharedMemory;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFAudioPowerXPCProvider;
  v5 = -[AFAudioPowerXPCProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = [_AFAudioPowerXPCSharedMemory alloc];
    objc_msgSend(v4, "xpcObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_AFAudioPowerXPCSharedMemory initWithXPCObject:](v6, "initWithXPCObject:", v7);
    sharedMemory = v5->_sharedMemory;
    v5->_sharedMemory = (_AFAudioPowerXPCSharedMemory *)v8;

  }
  return v5;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  _AFAudioPowerXPCSharedMemory *sharedMemory;
  BOOL v8;
  int v9;
  int v10;

  sharedMemory = self->_sharedMemory;
  if (!sharedMemory)
    return 0;
  v8 = a3 != 0;
  if (a3)
  {
    -[_AFAudioPowerXPCSharedMemory averagePower](sharedMemory, "averagePower");
    *(_DWORD *)a3 = v9;
  }
  if (a4)
  {
    -[_AFAudioPowerXPCSharedMemory peakPower](self->_sharedMemory, "peakPower");
    *(_DWORD *)a4 = v10;
    return 1;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedMemory, 0);
}

@end
