@implementation AVCAudioPowerSpectrum

- (AVCAudioPowerSpectrum)init
{
  AVCAudioPowerSpectrum *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCAudioPowerSpectrum;
  v2 = -[AVCAudioPowerSpectrum init](&v4, sel_init);
  if (v2)
    v2->_channels = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCAudioPowerSpectrum;
  -[AVCAudioPowerSpectrum dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  double v3;
  double v6;

  *(float *)&v3 = self->_minFrequency;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("minFrequency"), v3);
  *(float *)&v6 = self->_maxFrequency;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maxFrequency"), v6);
  objc_msgSend(a3, "encodeObject:forKey:", self->_channels, CFSTR("channels"));
}

- (AVCAudioPowerSpectrum)initWithCoder:(id)a3
{
  AVCAudioPowerSpectrum *v4;
  float v5;
  float v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)AVCAudioPowerSpectrum;
  v4 = -[AVCAudioPowerSpectrum init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("minFrequency"));
    v4->_minFrequency = v5;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maxFrequency"));
    v4->_maxFrequency = v6;
    v4->_channels = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("channels"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)minFrequency
{
  return self->_minFrequency;
}

- (float)maxFrequency
{
  return self->_maxFrequency;
}

- (NSArray)channels
{
  return &self->_channels->super;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4 channelID:(unsigned __int16)a5
{
  unsigned int v5;
  uint64_t v6;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BYTE v26[18];
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_channels, "count") > (unint64_t)a5)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_channels, "objectAtIndexedSubscript:", v5), "applyChannelBins:binCount:", a3, v6);
    if ((_DWORD)v6)
    {
      self->_minFrequency = a3->var0.min;
      self->_maxFrequency = a3[(v6 - 1)].var0.max;
    }
    return;
  }
  if ((AVCAudioPowerSpectrum *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v12 = -[NSMutableArray count](self->_channels, "count");
    v19 = 136316162;
    v20 = v10;
    v21 = 2080;
    v22 = "-[AVCAudioPowerSpectrum(VCPrivateAccess) applyChannelBins:binCount:channelID:]";
    v23 = 1024;
    v24 = 73;
    v25 = 1024;
    *(_DWORD *)v26 = v5;
    *(_WORD *)&v26[4] = 2048;
    *(_QWORD *)&v26[6] = v12;
    v13 = " [%s] %s:%d Number of channels is incorrect (%d >= %lu)";
    v14 = v11;
    v15 = 44;
LABEL_15:
    _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, v15);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (const __CFString *)-[AVCAudioPowerSpectrum performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v9 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v18 = -[NSMutableArray count](self->_channels, "count");
      v19 = 136316674;
      v20 = v16;
      v21 = 2080;
      v22 = "-[AVCAudioPowerSpectrum(VCPrivateAccess) applyChannelBins:binCount:channelID:]";
      v23 = 1024;
      v24 = 73;
      v25 = 2112;
      *(_QWORD *)v26 = v9;
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)&v26[10] = self;
      v27 = 1024;
      v28 = v5;
      v29 = 2048;
      v30 = v18;
      v13 = " [%s] %s:%d %@(%p) Number of channels is incorrect (%d >= %lu)";
      v14 = v17;
      v15 = 64;
      goto LABEL_15;
    }
  }
}

- (void)checkNumChannels:(unsigned __int16)a3
{
  unsigned int v3;
  unsigned int i;
  AVCAudioPowerSpectrumChannel *v6;

  v3 = a3;
  for (i = (unsigned __int16)-[NSMutableArray count](self->_channels, "count"); i < v3; ++i)
  {
    v6 = objc_alloc_init(AVCAudioPowerSpectrumChannel);
    -[NSMutableArray addObject:](self->_channels, "addObject:", v6);

  }
  if (-[NSMutableArray count](self->_channels, "count") > (unint64_t)v3)
    -[NSMutableArray removeObjectsInRange:](self->_channels, "removeObjectsInRange:", v3, -[NSMutableArray count](self->_channels, "count") - v3);
}

@end
