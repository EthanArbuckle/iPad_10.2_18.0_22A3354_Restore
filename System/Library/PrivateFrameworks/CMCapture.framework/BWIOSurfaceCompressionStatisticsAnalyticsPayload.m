@implementation BWIOSurfaceCompressionStatisticsAnalyticsPayload

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.IOSurfaceStats");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int bufferHeight;
  uint64_t v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  *(float *)&v4 = self->_averageRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("avgRatio"));
  *(float *)&v5 = self->_minRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("minRatio"));
  *(float *)&v6 = self->_maxRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("maxRatio"));
  *(float *)&v7 = self->_standardDeviation;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("stdDev"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_compressionType), CFSTR("compressionType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSamples), CFSTR("numFrames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalCompressedSize), CFSTR("totalCompressedSize"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalUncompressedSize), CFSTR("totalUncompressedSize"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nodeType), CFSTR("nodeType"));
  bufferHeight = self->_bufferHeight;
  if (bufferHeight - 1080 < 0x438)
    v9 = 1;
  else
    v9 = 2 * (bufferHeight > 0x86F);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9), CFSTR("resolution"));
  return v3;
}

- (float)averageRatio
{
  return self->_averageRatio;
}

- (void)setAverageRatio:(float)a3
{
  self->_averageRatio = a3;
}

- (float)minRatio
{
  return self->_minRatio;
}

- (void)setMinRatio:(float)a3
{
  self->_minRatio = a3;
}

- (float)maxRatio
{
  return self->_maxRatio;
}

- (void)setMaxRatio:(float)a3
{
  self->_maxRatio = a3;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(float)a3
{
  self->_standardDeviation = a3;
}

- (int)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int)a3
{
  self->_compressionType = a3;
}

- (unsigned)bufferHeight
{
  return self->_bufferHeight;
}

- (void)setBufferHeight:(unsigned int)a3
{
  self->_bufferHeight = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

- (unint64_t)totalCompressedSize
{
  return self->_totalCompressedSize;
}

- (void)setTotalCompressedSize:(unint64_t)a3
{
  self->_totalCompressedSize = a3;
}

- (unint64_t)totalUncompressedSize
{
  return self->_totalUncompressedSize;
}

- (void)setTotalUncompressedSize:(unint64_t)a3
{
  self->_totalUncompressedSize = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

@end
