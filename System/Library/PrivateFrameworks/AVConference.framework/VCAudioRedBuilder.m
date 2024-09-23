@implementation VCAudioRedBuilder

- (void)setMaxREDPayloadSize:(unsigned int)a3
{
  objc_sync_enter(self);
  self->_maxREDPayloadSize = a3;
  objc_sync_exit(self);
}

- (tagVCAudioRedPayload)buildRedPayloadWithPrimaryPayload:(tagVCAudioRedPayload *)a3 redPayloads:(id)a4
{
  tagVCAudioRedPayload *v5;
  VCAudioRedBuilder *v6;
  const char *v7;
  char *v8;
  _BYTE *v9;
  NSObject **v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  size_t bufferLength;
  uint64_t v37;
  NSObject *v38;
  int v39;
  CFStringRef v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  tagVCAudioRedPayload *p_redPayloadToSend;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[10];
  char *v57;
  uint64_t v58;

  v5 = a3;
  v6 = self;
  v58 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    __str = 0;
    if (objc_opt_class())
      v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    else
      v7 = "<nil>";
    asprintf(&__str, "%s: primaryPayload:%s redPayloads:%s", v7, -[VCAudioRedBuilder redPayloadDescription:](v6, "redPayloadDescription:", v5), -[VCAudioRedBuilder redundantPayloadsDescription:](v6, "redundantPayloadsDescription:", a4));
    if (__str)
    {
      __lasts = 0;
      v8 = strtok_r(__str, "\n", &__lasts);
      v9 = (_BYTE *)MEMORY[0x1E0CF2748];
      v10 = (NSObject **)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v10;
          v13 = *v10;
          if (*v9)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v50 = v11;
              v51 = 2080;
              v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
              v53 = 1024;
              v54 = 157;
              v55 = 2080;
              *(_QWORD *)v56 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
              *(_WORD *)&v56[8] = 2080;
              v57 = v8;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            v50 = v11;
            v51 = 2080;
            v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
            v53 = 1024;
            v54 = 157;
            v55 = 2080;
            *(_QWORD *)v56 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
            *(_WORD *)&v56[8] = 2080;
            v57 = v8;
            _os_log_debug_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v8 = strtok_r(0, "\n", &__lasts);
      }
      while (v8);
      free(__str);
      v5 = a3;
    }
    v6 = self;
  }
  p_redPayloadToSend = &v6->_redPayloadToSend;
  v14 = -[VCAudioRedBuilder resetOutputPayload:](v6, "resetOutputPayload:");
  v15 = objc_msgSend(a4, "count");
  v16 = v15;
  LODWORD(v17) = 1472;
  v18 = (v15 - 1);
  if (v15 - 1 >= 0)
  {
    v19 = 0;
    v20 = 0;
    v17 = (1472 - 4 * v15);
    while (1)
    {
      v21 = objc_msgSend(a4, "pointerAtIndex:", v18);
      v22 = *(_DWORD *)(v21 + 16);
      if (v22 >= 0x400)
        break;
      if (v6->_includeSequenceOffset)
      {
        v23 = *(unsigned __int8 *)(v21 + 30);
        if (v23 >= 0x40)
        {
          v17 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.5();
          }
LABEL_37:
          v6 = self;
          v14 = -[VCAudioRedBuilder resetOutputPayload:](self, "resetOutputPayload:", p_redPayloadToSend);
          goto LABEL_45;
        }
        v24 = 100 * (a3->timestamp - *(_DWORD *)(v21 + 20)) / v6->_sampleRate;
        if (v24 >= 0x100)
        {
          v28 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.6();
          }
LABEL_44:
          v6 = self;
          v14 = -[VCAudioRedBuilder resetOutputPayload:](self, "resetOutputPayload:", p_redPayloadToSend);
          v17 = v28;
LABEL_45:
          v5 = a3;
          if ((int)v17 > 0)
            goto LABEL_46;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.1();
          }
          v33 = 0;
LABEL_61:
          v40 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Max RED payload size overflow. outputPayloadBufferLength=%ld, lastRedPayloadBufferLength=%d, maxPayloadLength=%zu, remainingLength=%d"), v14 - v6->_redPayloadToSend.buffer, v33, 1472, v17);
          VCTerminateProcess((uint64_t)v40, CFSTR("VCAudioRedBuilder"), 0);
          if (v40)
            CFRelease(v40);
          return 0;
        }
        v25 = (v23 << 18) | (v24 << 10);
      }
      else
      {
        v26 = a3->timestamp - *(_DWORD *)(v21 + 20);
        if (v26 >= 0x4000)
        {
          v28 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.4();
          }
          goto LABEL_44;
        }
        v25 = v26 << 10;
      }
      v6 = self;
      if ((_DWORD)v19 == 1472)
      {
        v14 += v19;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.3();
        }
        v33 = 0;
        v17 = 0;
        goto LABEL_61;
      }
      v27 = bswap32(v25 | (*(_DWORD *)v21 << 24) ^ 0x80000000 | v22);
      if (v20 <= *(unsigned __int8 *)(v21 + 31))
        v20 = *(_BYTE *)(v21 + 31);
      *(_DWORD *)&v14[v19] = v27;
      ++*(_BYTE *)(v21 + 29);
      --v16;
      --v18;
      v19 += 4;
      if (v16 <= 0)
      {
        v14 += v19;
        goto LABEL_45;
      }
    }
    v17 = 1472 - v19;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.2();
    }
    goto LABEL_37;
  }
  v20 = 0;
LABEL_46:
  *v14++ = v5->payloadType;
  v17 = (v17 - 1);
  v29 = objc_msgSend(a4, "count");
  v30 = (v29 - 1);
  if (v29 - 1 >= 0)
  {
    while (1)
    {
      v31 = objc_msgSend(a4, "pointerAtIndex:", v30);
      v32 = v31;
      v33 = *(unsigned int *)(v31 + 16);
      if ((int)v17 < (int)v33)
        break;
      memcpy(v14, *(const void **)(v31 + 8), (int)v33);
      v34 = *(int *)(v32 + 16);
      v14 += v34;
      v17 = (v17 - v34);
      --v29;
      --v30;
      if (v29 <= 0)
        goto LABEL_51;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v39 = *(_DWORD *)(v32 + 16);
        *(_DWORD *)buf = 136316162;
        v50 = v37;
        v51 = 2080;
        v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
        v53 = 1024;
        v54 = 242;
        v55 = 1024;
        *(_DWORD *)v56 = v39;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v17;
        _os_log_error_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough requiredLength %d remainingLength %d", buf, 0x28u);
      }
    }
    goto LABEL_61;
  }
  v33 = 0;
LABEL_51:
  bufferLength = v5->bufferLength;
  if ((int)v17 < (int)bufferLength)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v43 = v5->bufferLength;
        *(_DWORD *)buf = 136316162;
        v50 = v41;
        v51 = 2080;
        v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
        v53 = 1024;
        v54 = 249;
        v55 = 1024;
        *(_DWORD *)v56 = v43;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v17;
        _os_log_error_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough requiredLength %d remainingLength %d", buf, 0x28u);
      }
      v6 = self;
    }
    goto LABEL_61;
  }
  memcpy(v14, v5->buffer, bufferLength);
  v6->_redPayloadToSend.bufferLength = (_DWORD)v14 + v5->bufferLength - LODWORD(v6->_redPayloadToSend.buffer);
  v6->_redPayloadToSend.payloadType = v6->_redPayloadType;
  v6->_redPayloadToSend.timestamp = v5->timestamp;
  v6->_redPayloadToSend.priority = v20;
  return p_redPayloadToSend;
}

- (BOOL)isPayloadTimestampWithinThreshold:(tagVCAudioRedPayload *)a3 forTimestamp:(unsigned int)a4
{
  unsigned int samplesPerFrame;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int timestamp;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  unsigned int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  samplesPerFrame = self->_samplesPerFrame;
  v6 = a4 + 2 * samplesPerFrame;
  v7 = a4 - 2 * samplesPerFrame;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = 2 * samplesPerFrame;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v11 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        timestamp = a3->timestamp;
        v18 = 136316674;
        v19 = v9;
        v20 = 2080;
        v21 = "-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:]";
        v22 = 1024;
        v23 = 283;
        v24 = 1024;
        v25 = v8;
        v26 = 1024;
        v27 = v6;
        v28 = 1024;
        v29 = v7;
        v30 = 1024;
        v31 = timestamp;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d timestampOffsetThreshold:%d highThreshold:%d lowThreshold:%d payloadTimestamp:%d", (uint8_t *)&v18, 0x34u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = a3->timestamp;
      v18 = 136316674;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:]";
      v22 = 1024;
      v23 = 283;
      v24 = 1024;
      v25 = v8;
      v26 = 1024;
      v27 = v6;
      v28 = 1024;
      v29 = v7;
      v30 = 1024;
      v31 = v17;
      _os_log_debug_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d timestampOffsetThreshold:%d highThreshold:%d lowThreshold:%d payloadTimestamp:%d", (uint8_t *)&v18, 0x34u);
    }
  }
  v13 = a3->timestamp;
  if (v13 - v7 <= 0x7FFFFFFE && ((v14 = v13 - v6) != 0 ? (v15 = v14 > 0x7FFFFFFE) : (v15 = 1), v15))
    return 1;
  else
    return 0;
}

- (char)resetOutputPayload:(tagVCAudioRedPayload *)a3
{
  char *result;

  *(_OWORD *)&a3->payloadType = 0u;
  *(_OWORD *)&a3->bufferLength = 0u;
  result = (char *)self->_redPayloadBufferToSend;
  a3->buffer = result;
  return result;
}

- (tagVCAudioRedPayload)nearestRedPayloadForTimestamp:(unsigned int)a3 payloadHistory:(tagVCAudioRedPayload *)a4 payloadHistoryCount:(unsigned int)a5
{
  tagVCAudioRedPayload *v5;
  uint64_t v7;
  tagVCAudioRedPayload *v9;
  uint64_t v10;
  tagVCAudioRedPayload *v11;
  unsigned int v12;
  const char *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  VCAudioRedBuilder *v19;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  char *v31;
  uint64_t v32;

  v5 = 0;
  v32 = *MEMORY[0x1E0C80C00];
  if (a4 && a5)
  {
    v7 = *(_QWORD *)&a3;
    if (a4->timestamp - a3 <= 0x7FFFFFFE)
    {
      v9 = 0;
      v10 = 0;
      v5 = a4;
      while (a5 - 1 != v10)
      {
        v11 = v5;
        v12 = v5[1].timestamp - a3;
        ++v5;
        ++v10;
        v9 = v11;
        if (v12 >= 0x7FFFFFFF)
        {
          v9 = v5 - 1;
          goto LABEL_10;
        }
      }
      v10 = a5 - 1;
      v5 = &a4[v10];
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v5 = a4;
    }
LABEL_10:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      __str = 0;
      v13 = objc_opt_class()
          ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
          : "<nil>";
      asprintf(&__str, "%s: redTimestamp:%d current:%s previous:%s", v13, v7, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v5), -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v9));
      if (__str)
      {
        v19 = self;
        __lasts = 0;
        v14 = strtok_r(__str, "\n", &__lasts);
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            v17 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                v23 = v15;
                v24 = 2080;
                v25 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
                v26 = 1024;
                v27 = 316;
                v28 = 2080;
                v29 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
                v30 = 2080;
                v31 = v14;
                _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316162;
              v23 = v15;
              v24 = 2080;
              v25 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
              v26 = 1024;
              v27 = 316;
              v28 = 2080;
              v29 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
              v30 = 2080;
              v31 = v14;
              _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v14 = strtok_r(0, "\n", &__lasts);
        }
        while (v14);
        free(__str);
        self = v19;
      }
    }
    if (a4[v10].timestamp != (_DWORD)v7)
    {
      if (v9 && v9->timestamp == (_DWORD)v7)
      {
        return v9;
      }
      else if (!-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:](self, "isPayloadTimestampWithinThreshold:forTimestamp:", v5, v7))
      {
        if (-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:](self, "isPayloadTimestampWithinThreshold:forTimestamp:", v9, v7))
        {
          return v9;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return v5;
}

- (id)selectRedPayloadsForPrimaryPayload:(tagVCAudioRedPayload *)a3
{
  uint64_t v4;
  float v5;
  const char *v6;
  unsigned int payloadHistoryCount;
  const char *v8;
  char *v9;
  _BYTE *v10;
  NSObject **v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  tagVCAudioRedPayload *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  char *v24;
  char *v25;
  char *v26;
  _BYTE *v27;
  NSObject **v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  unsigned __int8 v33;
  VCAudioRedBuilder *v34;
  unsigned int historyCount;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unsigned int v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  char *v43;
  char *v45;
  char *v46;
  int v48;
  uint64_t v49;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  _BYTE v60[18];
  char *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray setCount:](self->_selectedRedPayloads, "setCount:", 0);
  if (self->_historyCount)
  {
    LODWORD(v4) = self->_numPayloads;
    v48 = self->_maxREDPayloadSize + ~a3->bufferLength;
    if (self->_includeSequenceOffset)
    {
      v5 = (float)self->_maxDelay / (float)v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        v6 = objc_opt_class()
           ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
           : "<nil>";
        asprintf(&__str, "%s: primary:%s numPayloads:%d maxDelay:%d strideInBlocks:%f", v6, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", a3), self->_numPayloads, self->_maxDelay, v5);
        if (__str)
        {
          __lasts = 0;
          v9 = strtok_r(__str, "\n", &__lasts);
          v10 = (_BYTE *)MEMORY[0x1E0CF2748];
          v11 = (NSObject **)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *v11;
              v14 = *v11;
              if (*v10)
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v54 = v12;
                  v55 = 2080;
                  v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  v57 = 1024;
                  v58 = 352;
                  v59 = 2080;
                  *(_QWORD *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  *(_WORD *)&v60[8] = 2080;
                  *(_QWORD *)&v60[10] = v9;
                  _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v54 = v12;
                v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                v57 = 1024;
                v58 = 352;
                v59 = 2080;
                *(_QWORD *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                *(_WORD *)&v60[8] = 2080;
                *(_QWORD *)&v60[10] = v9;
                _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
        }
      }
      if (self->_numPayloads)
      {
        v15 = 1;
        while (1)
        {
          v16 = vcvtps_s32_f32(v5 * (float)v15);
          v17 = self->_samplesPerFrame * v16;
          v18 = a3->timestamp - v17;
          v19 = self->_historyCount - 1;
          if (v19 >= v15)
            LOBYTE(v19) = v15;
          v20 = -[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:](self, "nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:", a3->timestamp - v17, self->_history[v19].payloadHistory, self->_history[v19].payloadHistoryCount);
          if ((int)VRTraceGetErrorLogLevelForModule() < 8)
            goto LABEL_33;
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          v23 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
            break;
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
          v25 = -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v20);
          *(_DWORD *)buf = 136316674;
          v54 = v21;
          v55 = 2080;
          v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
          v57 = 1024;
          v58 = 364;
          v59 = 1024;
          *(_DWORD *)v60 = v16;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v17;
          *(_WORD *)&v60[10] = 1024;
          *(_DWORD *)&v60[12] = v18;
          *(_WORD *)&v60[16] = 2080;
          v61 = v25;
          _os_log_debug_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d blockOffset:%d timestampOffset:%d redTimestamp:%d redPayload:%s", buf, 0x38u);
          if (v20)
          {
LABEL_34:
            if (self->_numPayloads > v20->redCount
              && !-[VCAudioRedBuilder redundantPayloads:containsPointer:](self, "redundantPayloads:containsPointer:", self->_selectedRedPayloads, v20)&& v48 > v20->bufferLength + 4)
            {
              -[NSPointerArray addPointer:](self->_selectedRedPayloads, "addPointer:", v20);
              v48 = v48 - v20->bufferLength - 4;
            }
          }
LABEL_38:
          if (++v15 > self->_numPayloads)
            return self->_selectedRedPayloads;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v20);
          *(_DWORD *)buf = 136316674;
          v54 = v21;
          v55 = 2080;
          v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
          v57 = 1024;
          v58 = 364;
          v59 = 1024;
          *(_DWORD *)v60 = v16;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v17;
          *(_WORD *)&v60[10] = 1024;
          *(_DWORD *)&v60[12] = v18;
          *(_WORD *)&v60[16] = 2080;
          v61 = v24;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d blockOffset:%d timestampOffset:%d redTimestamp:%d redPayload:%s", buf, 0x38u);
          if (v20)
            goto LABEL_34;
          goto LABEL_38;
        }
LABEL_33:
        if (v20)
          goto LABEL_34;
        goto LABEL_38;
      }
    }
    else
    {
      payloadHistoryCount = self->_history[0].payloadHistoryCount;
      if (payloadHistoryCount >= v4)
        v4 = v4;
      else
        v4 = payloadHistoryCount;
      v49 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        v8 = objc_opt_class()
           ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
           : "<nil>";
        asprintf(&__str, "%s: primary:%s numPayloads:%d maxDelay:%d count:%d", v8, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", a3), self->_numPayloads, self->_maxDelay, v49);
        if (__str)
        {
          __lasts = 0;
          v26 = strtok_r(__str, "\n", &__lasts);
          v27 = (_BYTE *)MEMORY[0x1E0CF2748];
          v28 = (NSObject **)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v29 = VRTraceErrorLogLevelToCSTR();
              v30 = *v28;
              v31 = *v28;
              if (*v27)
              {
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v54 = v29;
                  v55 = 2080;
                  v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  v57 = 1024;
                  v58 = 375;
                  v59 = 2080;
                  *(_QWORD *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  *(_WORD *)&v60[8] = 2080;
                  *(_QWORD *)&v60[10] = v26;
                  _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v54 = v29;
                v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                v57 = 1024;
                v58 = 375;
                v59 = 2080;
                *(_QWORD *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                *(_WORD *)&v60[8] = 2080;
                *(_QWORD *)&v60[10] = v26;
                _os_log_debug_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v26 = strtok_r(0, "\n", &__lasts);
          }
          while (v26);
          free(__str);
        }
      }
      if ((_DWORD)v49)
      {
        v32 = 0;
        v33 = 0;
        v34 = self;
        do
        {
          historyCount = self->_historyCount;
          v36 = historyCount - 1;
          if (historyCount - 1 >= v32)
            v36 = v32;
          if (historyCount > 1)
            v33 = v36;
          v37 = (char *)v34 + 344 * v33;
          v38 = v37 + 64;
          v39 = a3->timestamp - *((_DWORD *)v37 + 21);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v40 = VRTraceErrorLogLevelToCSTR();
            v41 = *MEMORY[0x1E0CF2758];
            v42 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v43 = -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v38);
                *(_DWORD *)buf = 136316162;
                v54 = v40;
                v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                v57 = 1024;
                v58 = 387;
                v59 = 1024;
                *(_DWORD *)v60 = v39;
                *(_WORD *)&v60[4] = 2080;
                *(_QWORD *)&v60[6] = v43;
                _os_log_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d timestampOffset:%d redPayload:%s", buf, 0x2Cu);
              }
            }
            else if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v46 = -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", v38);
              *(_DWORD *)buf = 136316162;
              v54 = v40;
              v55 = 2080;
              v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
              v57 = 1024;
              v58 = 387;
              v59 = 1024;
              *(_DWORD *)v60 = v39;
              *(_WORD *)&v60[4] = 2080;
              *(_QWORD *)&v60[6] = v46;
              _os_log_debug_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d timestampOffset:%d redPayload:%s", buf, 0x2Cu);
            }
          }
          if (self->_numPayloads > v34->_history[v33].payloadHistory[0].redCount
            && v39 >> 14 == 0
            && !-[VCAudioRedBuilder redundantPayloads:containsPointer:](self, "redundantPayloads:containsPointer:", self->_selectedRedPayloads, v38))
          {
            v45 = (char *)v34 + 344 * v33;
            if (v48 > *((_DWORD *)v45 + 20) + 4)
            {
              -[NSPointerArray addPointer:](self->_selectedRedPayloads, "addPointer:", v38);
              v48 = v48 - *((_DWORD *)v45 + 20) - 4;
            }
          }
          ++v32;
          v34 = (VCAudioRedBuilder *)((char *)v34 + 32);
        }
        while (v49 != v32);
      }
    }
  }
  return self->_selectedRedPayloads;
}

- (BOOL)redundantPayloads:(id)a3 containsPointer:(void *)a4
{
  uint64_t v6;
  void *v7;
  BOOL v8;

  if ((int)objc_msgSend(a3, "count") < 1)
    return 0;
  v6 = 0;
  do
  {
    v7 = (void *)objc_msgSend(a3, "pointerAtIndex:", v6);
    v8 = v7 == a4;
    if (v7 == a4)
      break;
    ++v6;
  }
  while (v6 < (int)objc_msgSend(a3, "count"));
  return v8;
}

- (char)redPayloadDescription:(tagVCAudioRedPayload *)a3
{
  char *redPayloadDebugMessage;

  redPayloadDebugMessage = self->_redPayloadDebugMessage;
  if (a3)
    snprintf(self->_redPayloadDebugMessage, 0x101uLL, "{ VCAudioRedPayload payloadType=%d bufferLen=%d timestamp=%u isRedAudio=%d redCount=%d sequenceOffset=%d }", a3->payloadType, a3->bufferLength, a3->timestamp, a3->isRedAudio, a3->redCount, a3->sequenceOffset);
  else
    strcpy(self->_redPayloadDebugMessage, "VCAudioRedPayload NULL");
  return redPayloadDebugMessage;
}

- (char)redundantPayloadsDescription:(id)a3
{
  char *redPayloadHistoryDebugMessage;
  uint64_t v6;
  char *v7;

  redPayloadHistoryDebugMessage = self->_redPayloadHistoryDebugMessage;
  strncpy(self->_redPayloadHistoryDebugMessage, "{ \n", 0x101uLL);
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v6 = 0;
    do
    {
      v7 = strncat(redPayloadHistoryDebugMessage, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", objc_msgSend(a3, "pointerAtIndex:", v6)), 0x101uLL);
      *(_WORD *)&redPayloadHistoryDebugMessage[strlen(v7)] = 10;
      ++v6;
    }
    while (v6 < (int)objc_msgSend(a3, "count"));
  }
  strcat(redPayloadHistoryDebugMessage, " }");
  return redPayloadHistoryDebugMessage;
}

- (char)payloadHistoryDescriptionForInfoIndex:(unsigned __int8)a3
{
  unsigned int v3;
  char *redPayloadHistoryDebugMessage;
  char *v6;
  unint64_t v7;
  unsigned int *v8;
  tagVCAudioRedPayload *payloadHistory;
  char *v10;

  v3 = a3;
  redPayloadHistoryDebugMessage = self->_redPayloadHistoryDebugMessage;
  strncpy(self->_redPayloadHistoryDebugMessage, "{ primary:\n", 0x101uLL);
  v6 = (char *)self + 344 * v3;
  if (*((_DWORD *)v6 + 88))
  {
    v7 = 0;
    v8 = (unsigned int *)(v6 + 352);
    payloadHistory = self->_history[v3].payloadHistory;
    do
    {
      v10 = strncat(redPayloadHistoryDebugMessage, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", payloadHistory), 0x101uLL);
      *(_WORD *)&redPayloadHistoryDebugMessage[strlen(v10)] = 10;
      ++v7;
      ++payloadHistory;
    }
    while (v7 < *v8);
  }
  strcat(redPayloadHistoryDebugMessage, " }");
  return redPayloadHistoryDebugMessage;
}

- (tagVCAudioRedPayload)redPayloadForPrimaryPayload:(tagVCAudioRedPayload *)a3
{
  tagVCAudioRedPayload *v5;

  objc_sync_enter(self);
  v5 = -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:](self, "buildRedPayloadWithPrimaryPayload:redPayloads:", a3, -[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:](self, "selectRedPayloadsForPrimaryPayload:", a3));
  objc_sync_exit(self);
  return v5;
}

- (void)resetShortREDHistoryAndPrimaryPayloadHistory:(BOOL)a3
{
  unint64_t v3;
  tagVCAudioRedBuilderHistory *history;
  _BYTE *v6;
  NSObject **v7;
  tagVCAudioRedBuilderHistory *v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  tagVCAudioRedBuilderHistory *v13;
  _BOOL4 v14;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v3 = !a3;
  if (self->_historyCount > v3)
  {
    history = self->_history;
    v6 = (_BYTE *)MEMORY[0x1E0CF2748];
    v7 = (NSObject **)MEMORY[0x1E0CF2758];
    v13 = self->_history;
    do
    {
      v8 = &history[v3];
      v8->payloadHistoryCount = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        asprintf(&__str, "resetPrimaryPayloadHistory=%d historyIndex=%u count=%u history=%s", v14, v3, v8->payloadHistoryCount, -[VCAudioRedBuilder payloadHistoryDescriptionForInfoIndex:](self, "payloadHistoryDescriptionForInfoIndex:", v3));
        if (__str)
        {
          __lasts = 0;
          v9 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v10 = VRTraceErrorLogLevelToCSTR();
              v11 = *v7;
              v12 = *v7;
              if (*v6)
              {
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v18 = v10;
                  v19 = 2080;
                  v20 = "-[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:]";
                  v21 = 1024;
                  v22 = 492;
                  v23 = 2080;
                  v24 = "";
                  v25 = 2080;
                  v26 = v9;
                  _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v18 = v10;
                v19 = 2080;
                v20 = "-[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:]";
                v21 = 1024;
                v22 = 492;
                v23 = 2080;
                v24 = "";
                v25 = 2080;
                v26 = v9;
                _os_log_debug_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
          history = v13;
        }
      }
      ++v3;
    }
    while (v3 < self->_historyCount);
  }
}

- (void)dealloc
{
  uint64_t v3;
  char v4;
  char v5;
  tagVCAudioRedBuilderHistory *v6;
  char *payloadBufferHistory;
  char **p_payloadBufferHistory;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];

  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v6 = &self->_history[v3];
    payloadBufferHistory = v6->payloadBufferHistory;
    if (payloadBufferHistory)
    {
      p_payloadBufferHistory = &v6->payloadBufferHistory;
      free(payloadBufferHistory);
      *p_payloadBufferHistory = 0;
    }
    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
  v9.receiver = self;
  v9.super_class = (Class)VCAudioRedBuilder;
  -[VCAudioRedBuilder dealloc](&v9, sel_dealloc);
}

- (VCAudioRedBuilder)initWithRedPayloadType:(int)a3 sampleRate:(unsigned int)a4 samplesPerFrame:(unsigned int)a5 numPayloads:(unsigned int)a6 maxDelay:(unsigned int)a7 includeSequenceOffset:(BOOL)a8
{
  VCAudioRedBuilder *v14;
  VCAudioRedBuilder *v15;
  unsigned int v16;
  char v17;
  uint64_t v18;
  char *v19;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VCAudioRedBuilder;
  v14 = -[VCAudioRedBuilder init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_redPayloadType = a3;
    v14->_sampleRate = a4;
    v14->_samplesPerFrame = a5;
    if (a7 <= a6)
      v16 = a6;
    else
      v16 = a7;
    v14->_numPayloads = a6;
    v14->_maxDelay = v16;
    v14->_includeSequenceOffset = a8;
    v14->_maxREDPayloadSize = 1280;
    v17 = 1;
    v14->_historyCount = 1;
    v18 = 0;
    v14->_selectedRedPayloads = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 258);
    do
    {
      if ((v17 & 1) == 0)
      {
        v15->_history[1].payloadBufferHistory = 0;
        return v15;
      }
      v19 = (char *)malloc_type_calloc(9uLL, 0x5C0uLL, 0xCC8079CFuLL);
      v17 = 0;
      v15->_history[v18].payloadBufferHistory = v19;
      v18 = 1;
    }
    while (v19);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRedBuilder initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:].cold.1();
    }

    return 0;
  }
  return v15;
}

+ (unsigned)redOverheadForNumPayloads:(unsigned int)a3
{
  if (a3)
    return (4 * a3) | 1;
  else
    return 0;
}

- (unsigned)maxDelay
{
  unsigned int maxDelay;

  objc_sync_enter(self);
  maxDelay = self->_maxDelay;
  objc_sync_exit(self);
  return maxDelay;
}

- (void)setMaxDelay:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int numPayloads;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (a3 < 0xA)
  {
    v7 = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() < 5)
  {
    v7 = 9;
  }
  else
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = 9;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioRedBuilder setMaxDelay:]";
      v13 = 1024;
      v14 = 594;
      v15 = 1024;
      v16 = a3;
      v17 = 1024;
      v18 = 9;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d Cap exceeded for maxDelay:%d using %d instead", (uint8_t *)&v9, 0x28u);
    }
  }
  if (self->_maxDelay != v7)
    self->_maxDelay = v7;
  numPayloads = self->_numPayloads;
  if (numPayloads > v7)
    self->_maxDelay = numPayloads;
  objc_sync_exit(self);
}

- (unsigned)numPayloads
{
  unsigned int numPayloads;

  objc_sync_enter(self);
  numPayloads = self->_numPayloads;
  objc_sync_exit(self);
  return numPayloads;
}

- (void)setNumPayloads:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (a3 < 4)
  {
    v7 = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() < 5)
  {
    v7 = 3;
  }
  else
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = 3;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCAudioRedBuilder setNumPayloads:]";
      v12 = 1024;
      v13 = 616;
      v14 = 1024;
      v15 = a3;
      v16 = 1024;
      v17 = 3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d Cap exceeded for number of red payloads:%d using %d instead", (uint8_t *)&v8, 0x28u);
    }
  }
  if (v7 != self->_numPayloads)
  {
    self->_numPayloads = v7;
    if (v7 > self->_maxDelay)
      self->_maxDelay = v7;
  }
  objc_sync_exit(self);
}

- (int)redPayloadType
{
  return self->_redPayloadType;
}

- (unsigned)maxREDPayloadSize
{
  return self->_maxREDPayloadSize;
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough remainingLength %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload that is too big :%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.3()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 223;
  v4 = v0;
  v5 = 0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough remainingLength %d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old timestamp offset :%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old sequence offset :%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old timestamp offset :%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Failed to allocate red payload buffer history", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
