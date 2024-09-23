@implementation VCPacketBundler

- (VCPacketBundler)initWithOperatingMode:(int)a3 bundlingScheme:(int)a4
{
  VCPacketBundler *v6;
  VCPacketBundler *v7;
  _QWORD *p_cdrxBundleInfoRef;
  int v9;
  CMSimpleQueueRef *v10;
  BOOL v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCPacketBundler;
  v6 = -[VCPacketBundler init](&v13, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_10:

    return 0;
  }
  v6->_cdrxBundleInfoRef = 0;
  p_cdrxBundleInfoRef = &v6->_cdrxBundleInfoRef;
  v6->_maxPacketSize = 512;
  v9 = 1;
  v6->_allowLargePackets = 1;
  *(_QWORD *)&v6->_packetsPerBundle = 0x8000000001;
  v6->_operatingMode = a3;
  v6->_bundlingScheme = a4;
  if (a4 == 3)
  {
    v10 = (CMSimpleQueueRef *)malloc_type_calloc(1uLL, 0x58uLL, 0x10200404CEB7EB2uLL);
    *p_cdrxBundleInfoRef = v10;
    if (v10)
    {
      if (!CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 8, v10 + 10))
        goto LABEL_5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCPacketBundler initWithOperatingMode:bundlingScheme:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCPacketBundler initWithOperatingMode:bundlingScheme:].cold.2();
    }
    if (*p_cdrxBundleInfoRef)
      _VCPacketBundler_CleanupCDRXInfo((void ***)&v7->_cdrxBundleInfoRef);
    v9 = 0;
  }
LABEL_5:
  -[VCPacketBundler initLock](v7, "initLock");
  v11 = -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](v7, "reallocateBufferWithMaxPacketSize:maxPacketCount:", v7->_maxPacketSize, v7->_packetsPerBundle);
  if (!v9 || !v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCPacketBundler initWithOperatingMode:bundlingScheme:].cold.1();
    }
    goto LABEL_10;
  }
  return v7;
}

- (void)dealloc
{
  char *buffer;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  if (self->_cdrxBundleInfoRef)
    _VCPacketBundler_CleanupCDRXInfo((void ***)&self->_cdrxBundleInfoRef);
  pthread_mutex_destroy(&self->_mutex);
  v4.receiver = self;
  v4.super_class = (Class)VCPacketBundler;
  -[VCPacketBundler dealloc](&v4, sel_dealloc);
}

- (unsigned)bundleBufferSizeWidthMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4
{
  return (a3 + 2) * a4 + 2;
}

- (BOOL)allocateBundleBuffer:(unsigned int)a3
{
  return self->_maxPacketSize == a3
      || -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](self, "reallocateBufferWithMaxPacketSize:maxPacketCount:");
}

- (BOOL)reallocateBufferWithMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  unsigned int v10;
  BOOL v11;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[VCPacketBundler lock](self, "lock");
  v7 = -[VCPacketBundler bundleBufferSizeWidthMaxPacketSize:maxPacketCount:](self, "bundleBufferSizeWidthMaxPacketSize:maxPacketCount:", v5, v4);
  if (v7 > self->_bufferSize)
  {
    v8 = v7;
    v9 = (char *)malloc_type_realloc(self->_buffer, v7, 0x8E49C8CEuLL);
    self->_buffer = v9;
    if (v9)
      v10 = v8;
    else
      v10 = 0;
    self->_bufferSize = v10;
  }
  self->_packetsPerBundle = v4;
  self->_maxPacketSize = v5;
  if (self->_bundledPackets >= v4)
    self->_isFull = 1;
  v11 = self->_buffer != 0;
  -[VCPacketBundler unlock](self, "unlock");
  return v11;
}

- (unsigned)maxPacketSize
{
  return self->_maxPacketSize;
}

- (void)setMaxPacketSize:(unsigned int)a3
{
  if (self->_maxPacketSize != a3)
    -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](self, "reallocateBufferWithMaxPacketSize:maxPacketCount:");
}

- (BOOL)setPacketsPerBundle:(unsigned int)a3
{
  return self->_packetsPerBundle == a3
      || -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](self, "reallocateBufferWithMaxPacketSize:maxPacketCount:", self->_maxPacketSize, *(_QWORD *)&a3);
}

- (unsigned)packetsPerBundle
{
  return self->_packetsPerBundle;
}

- (char)encodedBuffer
{
  if (self->_bundlingScheme == 2)
    return -[VCPacketBundler encodedBufferForRFC3640](self, "encodedBufferForRFC3640");
  else
    return self->_buffer;
}

- (unsigned)encodedBufferSize
{
  if (self->_bundlingScheme == 2)
    return -[VCPacketBundler encodedBufferSizeForRFC3640](self, "encodedBufferSizeForRFC3640");
  else
    return self->_encodedBufferSize;
}

- (BOOL)isTalkSpurtStart
{
  return !self->_lastBundleVoiceActivity && self->_currentBundleVoiceActivity;
}

- (char)encodedBufferForRFC3640
{
  unsigned int v3;
  char *result;
  char *v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[VCPacketBundler accessUnitHeaderSectionSize](self, "accessUnitHeaderSectionSize");
  result = -[VCPacketBundler accessUnitDataSectionHead](self, "accessUnitDataSectionHead");
  v5 = result;
  if (v3)
  {
    result -= v3;
    *(_WORD *)result = bswap32(16 * self->_accessUnitHeaderInfo.accessUnitCount) >> 16;
    if (self->_accessUnitHeaderInfo.accessUnitCount)
    {
      v6 = 0;
      v7 = (uint64_t)&v5[-v3 + 2];
      do
      {
        *(_WORD *)(v7 + 2 * v6) = bswap32(8 * self->_accessUnitHeaderInfo.accessUnitSize[v6]) >> 16;
        ++v6;
      }
      while (v6 < self->_accessUnitHeaderInfo.accessUnitCount);
    }
  }
  return result;
}

- (unsigned)encodedBufferSizeForRFC3640
{
  return self->_accessUnitDataSectionSize
       + -[VCPacketBundler accessUnitHeaderSectionSize](self, "accessUnitHeaderSectionSize");
}

- (unsigned)accessUnitHeaderSectionSize
{
  if (self->_accessUnitHeaderInfo.accessUnitCount)
    return 2 * self->_accessUnitHeaderInfo.accessUnitCount + 2;
  else
    return 0;
}

- (unsigned)accessUnitHeaderSectionSizeMaximum
{
  return 2 * self->_packetsPerBundle + 2;
}

- (char)accessUnitDataSectionHead
{
  char *buffer;

  buffer = self->_buffer;
  return &buffer[-[VCPacketBundler accessUnitHeaderSectionSizeMaximum](self, "accessUnitHeaderSectionSizeMaximum")];
}

- (BOOL)bundleAudioRFC3640:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  uint64_t v7;
  char *v11;
  uint64_t accessUnitDataSectionSize;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  unsigned int bufferSize;
  unsigned int v19;
  unsigned int bundledPackets;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t accessUnitCount;
  unsigned int v27;
  unsigned int v28;
  BOOL v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  uint64_t v45;

  v7 = *(_QWORD *)&a5;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = -[VCPacketBundler accessUnitDataSectionHead](self, "accessUnitDataSectionHead");
  accessUnitDataSectionSize = self->_accessUnitDataSectionSize;
  v13 = +[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", v7, 2, self->_operatingMode);
  v14 = self->_accessUnitDataSectionSize + a4;
  if (v13)
  {
    if (v14 + -[VCPacketBundler accessUnitHeaderSectionSizeMaximum](self, "accessUnitHeaderSectionSizeMaximum") > self->_bufferSize)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v17)
        {
          bufferSize = self->_bufferSize;
          v19 = self->_accessUnitDataSectionSize;
          bundledPackets = self->_bundledPackets;
          v31 = 136316674;
          v32 = v15;
          v33 = 2080;
          v34 = "-[VCPacketBundler bundleAudioRFC3640:numInputBytes:payloadType:timestamp:]";
          v35 = 1024;
          v36 = 263;
          v37 = 1024;
          v38 = a4;
          v39 = 1024;
          v40 = bufferSize;
          v41 = 1024;
          v42 = v19;
          v43 = 1024;
          v44 = bundledPackets;
          v21 = " [%s] %s:%d RFC3640 bundling encountered an error: inputBytes=%u bufferSize=%u accessUnitDataSectionSize"
                "=%u bundledCount=%u";
LABEL_10:
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v31, 0x34u);
          goto LABEL_11;
        }
        return v17;
      }
LABEL_11:
      LOBYTE(v17) = 0;
      return v17;
    }
    accessUnitCount = self->_accessUnitHeaderInfo.accessUnitCount;
    self->_accessUnitHeaderInfo.accessUnitSize[accessUnitCount] = a4;
    self->_accessUnitHeaderInfo.accessUnitCount = accessUnitCount + 1;
LABEL_13:
    memcpy(&v11[accessUnitDataSectionSize], a3, a4);
    v27 = self->_bundledPackets;
    self->_accessUnitDataSectionSize += a4;
    if (!v27)
    {
      self->_payload = v7;
      self->_timestamp = a6;
    }
    v28 = v27 + 1;
    self->_bundledPackets = v28;
    v29 = !v13 || v28 == self->_packetsPerBundle;
    self->_isFull = v29;
    LOBYTE(v17) = 1;
    return v17;
  }
  if (v14 <= self->_bufferSize)
    goto LABEL_13;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_11;
  v22 = VRTraceErrorLogLevelToCSTR();
  v16 = *MEMORY[0x1E0CF2758];
  v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v17)
  {
    v23 = self->_bufferSize;
    v24 = self->_accessUnitDataSectionSize;
    v25 = self->_bundledPackets;
    v31 = 136316674;
    v32 = v22;
    v33 = 2080;
    v34 = "-[VCPacketBundler bundleAudioRFC3640:numInputBytes:payloadType:timestamp:]";
    v35 = 1024;
    v36 = 270;
    v37 = 1024;
    v38 = a4;
    v39 = 1024;
    v40 = v23;
    v41 = 1024;
    v42 = v24;
    v43 = 1024;
    v44 = v25;
    v21 = " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u accessUnitDataSectionSize=%u bundledCount=%u";
    goto LABEL_10;
  }
  return v17;
}

- (BOOL)_copyInputBytes:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  unsigned int v8;
  unsigned int bufferSize;
  uint64_t v12;
  NSObject *v13;
  unsigned int v15;
  unsigned int encodedBufferSize;
  unsigned int bundledPackets;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = self->_encodedBufferSize + a4;
  bufferSize = self->_bufferSize;
  if (v8 > bufferSize)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v15 = self->_bufferSize;
        encodedBufferSize = self->_encodedBufferSize;
        bundledPackets = self->_bundledPackets;
        v18 = 136316674;
        v19 = v12;
        v20 = 2080;
        v21 = "-[VCPacketBundler _copyInputBytes:numInputBytes:payloadType:timestamp:]";
        v22 = 1024;
        v23 = 360;
        v24 = 1024;
        v25 = a4;
        v26 = 1024;
        v27 = v15;
        v28 = 1024;
        v29 = encodedBufferSize;
        v30 = 1024;
        v31 = bundledPackets;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize=%u bundledCount=%u", (uint8_t *)&v18, 0x34u);
      }
    }
  }
  else
  {
    memcpy(self->_buffer, a3, a4);
    self->_timestamp = a6;
    self->_encodedBufferSize = a4;
    self->_payload = a5;
    self->_bundledPackets = 1;
    self->_isFull = 1;
  }
  return v8 <= bufferSize;
}

- (BOOL)bundleAudioLegacy:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  char *v11;
  _BOOL4 v12;
  unsigned int maxPacketSize;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  unsigned int bufferSize;
  unsigned int encodedBufferSize;
  unsigned int bundledPackets;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  char *v31;
  unsigned int v32;
  unsigned int v33;
  BOOL v36;
  int v38;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = &self->_buffer[self->_encodedBufferSize];
  v12 = +[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(_QWORD *)&a5, 1, self->_operatingMode);
  if (v12)
  {
    if (a4 >= 0x100 && self->_allowLargePackets)
    {
      maxPacketSize = self->_maxPacketSize;
      if (maxPacketSize >= 0x2FF)
        maxPacketSize = 767;
      if (maxPacketSize < a4 || a4 + self->_encodedBufferSize + 2 > self->_bufferSize)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v16)
          {
            bufferSize = self->_bufferSize;
            encodedBufferSize = self->_encodedBufferSize;
            bundledPackets = self->_bundledPackets;
            v38 = 136316674;
            v39 = v14;
            v40 = 2080;
            v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
            v42 = 1024;
            v43 = 383;
            v44 = 1024;
            v45 = a4;
            v46 = 1024;
            v47 = bufferSize;
            v48 = 1024;
            v49 = encodedBufferSize;
            v50 = 1024;
            v51 = bundledPackets;
            v20 = " [%s] %s:%d : Large packet bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSiz"
                  "e=%u bundledCount=%u";
LABEL_20:
            _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v38, 0x34u);
            goto LABEL_21;
          }
          return v16;
        }
LABEL_21:
        LOBYTE(v16) = 0;
        return v16;
      }
      *v11 = a4 & 1;
      v31 = v11 + 1;
      v30 = (a4 + 256) >> 1;
      v29 = 2;
    }
    else
    {
      if (a4 - 256 < 0xFFFFFF02 || a4 + self->_encodedBufferSize + 1 > self->_bufferSize)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v16)
          {
            v26 = self->_bufferSize;
            v27 = self->_encodedBufferSize;
            v28 = self->_bundledPackets;
            v38 = 136316674;
            v39 = v25;
            v40 = 2080;
            v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
            v42 = 1024;
            v43 = 391;
            v44 = 1024;
            v45 = a4;
            v46 = 1024;
            v47 = v26;
            v48 = 1024;
            v49 = v27;
            v50 = 1024;
            v51 = v28;
            v20 = " [%s] %s:%d Small packet bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize="
                  "%u bundledCount=%u";
            goto LABEL_20;
          }
          return v16;
        }
        goto LABEL_21;
      }
      v29 = 1;
      LOBYTE(v30) = a4;
      v31 = v11;
    }
    v11 += v29;
    *v31 = v30;
LABEL_25:
    memcpy(v11, a3, a4);
    self->_encodedBufferSize = (_DWORD)v11 + a4 - LODWORD(self->_buffer);
    v32 = self->_bundledPackets;
    if (!v32)
    {
      self->_payload = a5;
      self->_timestamp = a6;
    }
    v33 = v32 + 1;
    self->_bundledPackets = v33;
    v36 = !v12 || a4 < 7 && a5 == 108 || v33 == self->_packetsPerBundle;
    self->_isFull = v36;
    LOBYTE(v16) = 1;
    return v16;
  }
  if (self->_encodedBufferSize + a4 <= self->_bufferSize)
    goto LABEL_25;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_21;
  v21 = VRTraceErrorLogLevelToCSTR();
  v15 = *MEMORY[0x1E0CF2758];
  v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v16)
  {
    v22 = self->_bufferSize;
    v23 = self->_encodedBufferSize;
    v24 = self->_bundledPackets;
    v38 = 136316674;
    v39 = v21;
    v40 = 2080;
    v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
    v42 = 1024;
    v43 = 397;
    v44 = 1024;
    v45 = a4;
    v46 = 1024;
    v47 = v22;
    v48 = 1024;
    v49 = v23;
    v50 = 1024;
    v51 = v24;
    v20 = " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize=%u bundledCount=%u";
    goto LABEL_20;
  }
  return v16;
}

- (void)resetBuffer
{
  opaqueVCPacketBundlerCdrxBundleInfo *cdrxBundleInfoRef;

  *(_QWORD *)&self->_accessUnitDataSectionSize = 0;
  self->_encodedBufferSize = 0;
  self->_accessUnitHeaderInfo = 0;
  self->_lastBundleVoiceActivity = self->_currentBundleVoiceActivity;
  self->_currentBundleVoiceActivity = 0;
  self->_isFull = 0;
  self->_priority = 0;
  cdrxBundleInfoRef = self->_cdrxBundleInfoRef;
  if (cdrxBundleInfoRef)
  {
    *(_QWORD *)&cdrxBundleInfoRef->var0[1].var3 = 0;
    *(_OWORD *)&cdrxBundleInfoRef->var0[0].var0 = 0u;
    *(_OWORD *)&cdrxBundleInfoRef->var0[0].var4 = 0u;
  }
}

- (void)initLock
{
  pthread_mutexattr_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v3.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 2);
  pthread_mutex_init(&self->_mutex, &v3);
  pthread_mutexattr_destroy(&v3);
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

- (BOOL)allowLargePackets
{
  return self->_allowLargePackets;
}

- (void)setAllowLargePackets:(BOOL)a3
{
  self->_allowLargePackets = a3;
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (unsigned)bundledPackets
{
  return self->_bundledPackets;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unsigned int)a3
{
  self->_timestamp = a3;
}

- (int)bundlingScheme
{
  return self->_bundlingScheme;
}

- (void)setBundlingScheme:(int)a3
{
  self->_bundlingScheme = a3;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)initWithOperatingMode:bundlingScheme:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Bundler init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOperatingMode:bundlingScheme:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate CDRX container", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOperatingMode:bundlingScheme:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cdrx event queue creation failed with error=%d", v2, v3, v4, 81);
  OUTLINED_FUNCTION_3();
}

@end
