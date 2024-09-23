@implementation VCVideoFrameBufferPool

- (VCVideoFrameBufferPool)initWithCapacity:(int)a3
{
  VCVideoFrameBufferPool *v4;
  VCVideoFrameBufferPool *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoFrameBufferPool;
  v4 = -[VCVideoFrameBufferPool init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxBufferCount = a3;
    v4->_bufferPool = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoFrameBufferPool;
  -[VCVideoFrameBufferPool dealloc](&v3, sel_dealloc);
}

- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4
{
  int v7;
  int maxBufferCount;
  uint64_t v9;
  NSObject *v10;

  v7 = -[NSMutableDictionary count](self->_bufferPool, "count");
  maxBufferCount = self->_maxBufferCount;
  if (maxBufferCount == v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoFrameBufferPool addFrame:time:].cold.1(v9, v10);
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPool, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4));
  }
  return maxBufferCount != v7;
}

- (BOOL)releaseFrameWithTime:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bufferPool, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:"));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPool, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoFrameBufferPool releaseFrameWithTime:].cold.1(v6, a3, v7);
  }
  return v5 != 0;
}

- (void)addFrame:(uint64_t)a1 time:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCVideoFrameBufferPool addFrame:time:]";
  v6 = 1024;
  v7 = 35;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Dropping the frame, Client fell behind. Buffer is full.", (uint8_t *)&v2, 0x1Cu);
}

- (void)releaseFrameWithTime:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCVideoFrameBufferPool releaseFrameWithTime:]";
  v7 = 1024;
  v8 = 44;
  v9 = 2048;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Can't release frame with time %lld, doesn't exist", (uint8_t *)&v3, 0x26u);
}

@end
