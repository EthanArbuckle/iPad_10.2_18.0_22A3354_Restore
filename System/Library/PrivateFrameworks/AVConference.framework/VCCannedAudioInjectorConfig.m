@implementation VCCannedAudioInjectorConfig

- (VCCannedAudioInjectorConfig)init
{
  VCCannedAudioInjectorConfig *result;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCCannedAudioInjectorConfig;
  result = -[VCCannedAudioInjectorConfig init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_startHostTime = _Q0;
    result->_loopCount = -1;
    result->_sineWaveAmplitude = 0.05;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCannedAudioInjectorConfig;
  -[VCCannedAudioInjectorConfig dealloc](&v3, sel_dealloc);
}

- (id)description
{
  char __str[16];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0u;
  v6 = 0u;
  *(_OWORD *)__str = 0u;
  v4 = 0u;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%p] path=%@ fileName=%@ fromBeginning=%d startHostTime=%f loopLength=%f audioFormat=%s reportingAgent=%@"), self, self->_path, self->_fileName, self->_fromBeginning, *(_QWORD *)&self->_startHostTime, *(_QWORD *)&self->_loopLength, FormatToCStr((uint64_t)&self->_audioFormat, __str, 0x40uLL), self->_reportingAgent);
}

- (BOOL)isValid
{
  AudioStreamBasicDescription *p_audioFormat;
  double mSampleRate;
  unsigned int sineWaveFrequencyHz;
  uint64_t *p_sineWaveAmplitude;
  double sineWaveAmplitude;
  unsigned int v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v17;
  _OWORD __s1[2];
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  memset(__s1, 0, sizeof(__s1));
  p_audioFormat = &self->_audioFormat;
  if (!memcmp(__s1, &self->_audioFormat, 0x28uLL))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCCannedAudioInjectorConfig isValid].cold.1();
    }
    goto LABEL_35;
  }
  mSampleRate = p_audioFormat->mSampleRate;
  if (p_audioFormat->mSampleRate <= 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCCannedAudioInjectorConfig isValid].cold.2();
    }
    goto LABEL_35;
  }
  sineWaveFrequencyHz = self->_sineWaveFrequencyHz;
  if (!sineWaveFrequencyHz)
  {
    if (self->_loopLength == 0.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[VCCannedAudioInjectorConfig isValid].cold.3();
      }
      goto LABEL_35;
    }
    if (!self->_path)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[VCCannedAudioInjectorConfig isValid].cold.4();
      }
      goto LABEL_35;
    }
LABEL_15:
    LOBYTE(v10) = 1;
    return v10;
  }
  p_sineWaveAmplitude = (uint64_t *)&self->_sineWaveAmplitude;
  sineWaveAmplitude = self->_sineWaveAmplitude;
  if (sineWaveAmplitude < 0.0 || sineWaveAmplitude > 1.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCCannedAudioInjectorConfig isValid].cold.5(v11, p_sineWaveAmplitude, v12);
    }
    goto LABEL_35;
  }
  v9 = (mSampleRate * 0.5);
  if (sineWaveFrequencyHz > v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = v9;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      v15 = self->_sineWaveFrequencyHz;
      *(_DWORD *)buf = 136316162;
      v21 = v13;
      v22 = 2080;
      v23 = "-[VCCannedAudioInjectorConfig isValid]";
      v24 = 1024;
      v25 = 74;
      v26 = 1024;
      v27 = v15;
      v28 = 1024;
      v29 = v17;
      _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid sine wave frequency: 0 <= %u <= %u", buf, 0x28u);
    }
    goto LABEL_35;
  }
  if (!self->_path)
    goto LABEL_15;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    -[VCCannedAudioInjectorConfig isValid].cold.6();
  }
LABEL_35:
  LOBYTE(v10) = 0;
  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)fromBeginning
{
  return self->_fromBeginning;
}

- (void)setFromBeginning:(BOOL)a3
{
  self->_fromBeginning = a3;
}

- (double)startHostTime
{
  return self->_startHostTime;
}

- (void)setStartHostTime:(double)a3
{
  self->_startHostTime = a3;
}

- (double)loopLength
{
  return self->_loopLength;
}

- (void)setLoopLength:(double)a3
{
  self->_loopLength = a3;
}

- (AudioStreamBasicDescription)audioFormat
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (void)setAudioFormat:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_audioFormat.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_audioFormat.mSampleRate = v3;
  *(_OWORD *)&self->_audioFormat.mBytesPerPacket = v4;
}

- (unsigned)sineWaveFrequencyHz
{
  return self->_sineWaveFrequencyHz;
}

- (void)setSineWaveFrequencyHz:(unsigned int)a3
{
  self->_sineWaveFrequencyHz = a3;
}

- (double)sineWaveAmplitude
{
  return self->_sineWaveAmplitude;
}

- (void)setSineWaveAmplitude:(double)a3
{
  self->_sineWaveAmplitude = a3;
}

- (BOOL)forceVoiceActive
{
  return self->_forceVoiceActive;
}

- (void)setForceVoiceActive:(BOOL)a3
{
  self->_forceVoiceActive = a3;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (unsigned)loopCount
{
  return self->_loopCount;
}

- (void)setLoopCount:(unsigned int)a3
{
  self->_loopCount = a3;
}

- (void)isValid
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected path provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
