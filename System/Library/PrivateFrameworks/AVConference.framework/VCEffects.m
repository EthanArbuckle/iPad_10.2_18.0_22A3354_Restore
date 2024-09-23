@implementation VCEffects

- (VCEffects)init
{
  VCEffects *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCEffects;
  v2 = -[VCEffects init](&v4, sel_init);
  if (v2)
  {
    v2->_bufferPool = -[VCVideoFrameBufferPool initWithCapacity:]([VCVideoFrameBufferPool alloc], "initWithCapacity:", 5);
    *(_WORD *)&v2->_effectsApplied = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCEffects;
  -[VCEffects dealloc](&v3, sel_dealloc);
}

- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4
{
  return -[VCVideoFrameBufferPool addFrame:time:](self->_bufferPool, "addFrame:time:", a3, a4);
}

- (BOOL)releaseFrameWithTime:(int64_t)a3
{
  return -[VCVideoFrameBufferPool releaseFrameWithTime:](self->_bufferPool, "releaseFrameWithTime:", a3);
}

- (void)setEffectsMode:(int)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_effectsMode = a3;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCEffects setEffectsMode:]";
        v10 = 1024;
        v11 = 49;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting effects to disabled, re-initialize the buffer", (uint8_t *)&v6, 0x1Cu);
      }
    }

    self->_bufferPool = -[VCVideoFrameBufferPool initWithCapacity:]([VCVideoFrameBufferPool alloc], "initWithCapacity:", 5);
  }
}

- (void)setEffectsType:(int)a3
{
  self->_effectsType = a3;
  self->_faceMeshTrackingEnabled = a3 == 2;
  self->_effectsApplied = (a3 - 1) < 2;
}

- (int)effectsMode
{
  return self->_effectsMode;
}

- (int)effectsType
{
  return self->_effectsType;
}

- (BOOL)effectsApplied
{
  return self->_effectsApplied;
}

- (void)setEffectsApplied:(BOOL)a3
{
  self->_effectsApplied = a3;
}

- (BOOL)faceMeshTrackingEnabled
{
  return self->_faceMeshTrackingEnabled;
}

- (void)setFaceMeshTrackingEnabled:(BOOL)a3
{
  self->_faceMeshTrackingEnabled = a3;
}

@end
