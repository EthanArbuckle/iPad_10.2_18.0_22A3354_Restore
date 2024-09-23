@implementation VCSessionMediaTypeSettings

- (VCSessionMediaTypeSettings)initWithMediaType:(unsigned int)a3
{
  uint64_t v3;
  VCSessionMediaTypeSettings *v4;
  uint64_t v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCSessionMediaTypeSettings *v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCSessionMediaTypeSettings;
  v4 = -[VCObject init](&v12, sel_init);
  if (v4)
  {
    -[VCObject setLogPrefix:](v4, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaType=%@ "), VCSessionMediaType_Name(v3)));
    v4->_mediaType = v3;
    v4->_mediaState = 0;
    v5 = objc_opt_new();
    v4->_streamGroupIDs = (NSMutableSet *)v5;
    if (!v5)
    {
      if ((VCSessionMediaTypeSettings *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaTypeSettings initWithMediaType:].cold.1(v8, v9);
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCSessionMediaTypeSettings performSelector:](v4, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v14 = v10;
            v15 = 2080;
            v16 = "-[VCSessionMediaTypeSettings initWithMediaType:]";
            v17 = 1024;
            v18 = 33;
            v19 = 2112;
            v20 = v7;
            v21 = 2048;
            v22 = v4;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the streamGroupID set", buf, 0x30u);
          }
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaTypeSettings;
  -[VCObject dealloc](&v3, sel_dealloc);
}

+ (id)settingsWithMediaType:(unsigned int)a3
{
  return -[VCSessionMediaTypeSettings initWithMediaType:]([VCSessionMediaTypeSettings alloc], "initWithMediaType:", *(_QWORD *)&a3);
}

- (void)addStreamGroupID:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[VCObject lock](self, "lock");
  -[NSMutableSet addObject:](self->_streamGroupIDs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  -[VCObject unlock](self, "unlock");
}

- (NSSet)streamGroupIDs
{
  NSSet *v3;

  -[VCObject lock](self, "lock");
  v3 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_streamGroupIDs);
  -[VCObject unlock](self, "unlock");
  return v3;
}

- (id)description
{
  __CFString *v3;

  v3 = VCSessionMediaType_Name(self->_mediaType);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaType=%@ mediaState=%@"), v3, VCSessionMediaState_Name(self->_mediaState));
}

+ (id)serializationClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mediaType, CFSTR("type"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mediaState, CFSTR("state"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_streamGroupIDs, CFSTR("streamGroupIDs"));
}

- (VCSessionMediaTypeSettings)initWithCoder:(id)a3
{
  VCSessionMediaTypeSettings *v4;

  v4 = -[VCSessionMediaTypeSettings initWithMediaType:](self, "initWithMediaType:", objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("type")));
  if (v4)
  {
    v4->_mediaState = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("state"));
    -[NSMutableSet unionSet:](v4->_streamGroupIDs, "unionSet:", objc_msgSend(a3, "decodeObjectForKey:", CFSTR("streamGroupIDs")));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (unsigned)mediaState
{
  return self->_mediaState;
}

- (void)setMediaState:(unsigned int)a3
{
  self->_mediaState = a3;
}

- (unsigned)remoteMediaState
{
  return self->_remoteMediaState;
}

- (void)setRemoteMediaState:(unsigned int)a3
{
  self->_remoteMediaState = a3;
}

- (void)initWithMediaType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCSessionMediaTypeSettings initWithMediaType:]";
  v6 = 1024;
  v7 = 33;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate the streamGroupID set", (uint8_t *)&v2, 0x1Cu);
}

@end
