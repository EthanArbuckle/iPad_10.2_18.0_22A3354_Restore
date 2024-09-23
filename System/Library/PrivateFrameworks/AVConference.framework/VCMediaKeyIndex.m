@implementation VCMediaKeyIndex

- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4 uniquePrefixLength:(unint64_t)a5
{
  VCMediaKeyIndex *v8;
  VCMediaKeyIndex *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaKeyIndex;
  v8 = -[VCMediaKeyIndex init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      if (a4 - 17 >= 0xFFFFFFF0 && a4 >= a5)
      {
        *(_QWORD *)v8->_MKI = 0;
        v8->_activeSize = a4;
        v8->_uniquePrefixLength = a5;
        *(_QWORD *)&v8->_MKI[8] = 0;
        memcpy(v8->_MKI, a3, a4);
        return v9;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v15 = v10;
          v16 = 2080;
          v17 = "-[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:]";
          v18 = 1024;
          v19 = 39;
          v20 = 1024;
          v21 = a4;
          v22 = 2048;
          v23 = a5;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid size of input data bufferSize=%d, uniquePrefixLength=%llu", buf, 0x2Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:].cold.1();
    }

    return 0;
  }
  return v9;
}

- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4
{
  return -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:](self, "initWithBytes:bufferSize:uniquePrefixLength:", a3, *(_QWORD *)&a4, 0);
}

- (VCMediaKeyIndex)initWithUUID:(unsigned __int8)a3[16]
{
  return -[VCMediaKeyIndex initWithBytes:bufferSize:](self, "initWithBytes:bufferSize:", a3, 16);
}

- (VCMediaKeyIndex)initWithNSUUID:(id)a3 uniquePrefixLength:(unint64_t)a4
{
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(a3, "getUUIDBytes:", v7);
  return -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:](self, "initWithBytes:bufferSize:uniquePrefixLength:", v7, 16, a4);
}

- (VCMediaKeyIndex)initWithNSUUID:(id)a3
{
  return -[VCMediaKeyIndex initWithNSUUID:uniquePrefixLength:](self, "initWithNSUUID:uniquePrefixLength:", a3, 0);
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCMediaKeyIndex;
  -[VCMediaKeyIndex dealloc](&v2, sel_dealloc);
}

+ (id)newMKIWithBytes:(char *)a3 bufferSize:(unsigned int)a4
{
  return -[VCMediaKeyIndex initWithBytes:bufferSize:]([VCMediaKeyIndex alloc], "initWithBytes:bufferSize:", a3, *(_QWORD *)&a4);
}

- (unsigned)activeSize
{
  unsigned int activeSize;

  objc_sync_enter(self);
  activeSize = self->_activeSize;
  objc_sync_exit(self);
  return activeSize;
}

- (void)setActiveSize:(unsigned int)a3
{
  objc_sync_enter(self);
  self->_activeSize = a3;
  objc_sync_exit(self);
}

- (const)MKI
{
  return (const char *)self->_MKI;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_MKI);
  objc_sync_enter(self);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%d):%zu"), objc_msgSend(v3, "UUIDString"), self->_activeSize, self->_uniquePrefixLength);
  objc_sync_exit(self);

  return v4;
}

- (void)fullKeyBytes:(unsigned __int8)a3[16]
{
  objc_sync_enter(self);
  *(_OWORD *)a3 = *(_OWORD *)self->_MKI;
  objc_sync_exit(self);
}

+ (id)makeInvalidKey
{
  return -[VCMediaKeyIndex initWithBytes:bufferSize:]([VCMediaKeyIndex alloc], "initWithBytes:bufferSize:", &invalidMKI, 16);
}

- (unint64_t)hash
{
  __memcpy_chk();
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    return VCMediaKeyIndex_isEqual((uint64_t)self, (uint64_t)a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaKeyIndex isEqual:].cold.1();
  }
  return 0;
}

- (BOOL)isStartingWithPrefix:(id)a3
{
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    return VCMediaKeyIndex_isStartingWithPrefix((uint64_t)self, (uint64_t)a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaKeyIndex isStartingWithPrefix:].cold.1();
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCMediaKeyIndex *v5;

  objc_sync_enter(self);
  v5 = -[VCMediaKeyIndex initWithUUID:](+[VCMediaKeyIndex allocWithZone:](VCMediaKeyIndex, "allocWithZone:", a3), "initWithUUID:", self->_MKI);
  -[VCMediaKeyIndex setActiveSize:](v5, "setActiveSize:", self->_activeSize);
  -[VCMediaKeyIndex setUniquePrefixLength:](v5, "setUniquePrefixLength:", self->_uniquePrefixLength);
  objc_sync_exit(self);
  return v5;
}

- (unint64_t)uniquePrefixLength
{
  return self->_uniquePrefixLength;
}

- (void)setUniquePrefixLength:(unint64_t)a3
{
  self->_uniquePrefixLength = a3;
}

- (void)initWithBytes:bufferSize:uniquePrefixLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameters 'buffer' passed to the method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isEqual:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d keyToCompare is not of VCMediaKeyIndex class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isStartingWithPrefix:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d prefix is not of VCMediaKeyIndex class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
