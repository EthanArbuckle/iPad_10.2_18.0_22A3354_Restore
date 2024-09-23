@implementation BWVideoStabilizationAnalyticsPayload

- (BWVideoStabilizationAnalyticsPayload)init
{
  BWVideoStabilizationAnalyticsPayload *v2;
  BWVideoStabilizationAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoStabilizationAnalyticsPayload;
  v2 = -[BWVideoStabilizationAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWVideoStabilizationAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  uint64_t v3;
  NSString **portType;
  float (*overscanHistogram)[7];

  v3 = 0;
  portType = self->_portType;
  do
  {

    portType[v3++] = 0;
  }
  while (v3 != 6);
  *(_OWORD *)&self->_overscanHistogram[0][0] = 0u;
  overscanHistogram = self->_overscanHistogram;
  (*overscanHistogram)[-26] = 0.0;
  *(_QWORD *)&(*overscanHistogram)[43] = 0;
  *(_QWORD *)&(*overscanHistogram)[-11] = 0;
  *(_QWORD *)&(*overscanHistogram)[-13] = 0;
  *(_QWORD *)&(*overscanHistogram)[-7] = 0;
  *(_QWORD *)&(*overscanHistogram)[-9] = 0;
  *(_QWORD *)&(*overscanHistogram)[-3] = 0;
  *(_QWORD *)&(*overscanHistogram)[-5] = 0;
  (*overscanHistogram)[-1] = 0.0;
  *(_OWORD *)&(*overscanHistogram)[4] = 0u;
  *(_OWORD *)&(*overscanHistogram)[8] = 0u;
  *(_OWORD *)&(*overscanHistogram)[12] = 0u;
  *(_OWORD *)&(*overscanHistogram)[16] = 0u;
  *(_OWORD *)&(*overscanHistogram)[20] = 0u;
  *(_OWORD *)&(*overscanHistogram)[24] = 0u;
  *(_OWORD *)&(*overscanHistogram)[28] = 0u;
  *(_OWORD *)&(*overscanHistogram)[32] = 0u;
  *(_OWORD *)&(*overscanHistogram)[36] = 0u;
  *(_QWORD *)&(*overscanHistogram)[40] = 0;
}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 40; i != 88; i += 8)

  v4.receiver = self;
  v4.super_class = (Class)BWVideoStabilizationAnalyticsPayload;
  -[BWVideoStabilizationAnalyticsPayload dealloc](&v4, sel_dealloc);
}

- (void)setSigmaHistogram:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  float *sigmaHistogram;
  float v8;

  if ((unint64_t)objc_msgSend(a3, "count") > 6)
  {
    v5 = 7;
  }
  else
  {
    v5 = objc_msgSend(a3, "count");
    if (!v5)
      return;
  }
  v6 = 0;
  sigmaHistogram = self->_sigmaHistogram;
  do
  {
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v6), "floatValue");
    sigmaHistogram[v6++] = v8;
  }
  while (v5 != v6);
}

- (void)setOverscanHistogram:(id)a3 BinningFactor:(int)a4 Histogram:(id)a5
{
  uint64_t count;
  uint64_t v8;
  unsigned int v9;
  uint64_t i;
  float v11;

  count = self->_count;
  if (count <= 5)
  {
    self->_portType[count] = (NSString *)a3;
    self->_binningFactor[count] = a4;
    if ((unint64_t)objc_msgSend(a5, "count") > 6)
    {
      v8 = 7;
    }
    else
    {
      v8 = objc_msgSend(a5, "count");
      if (!v8)
      {
        v9 = self->_count;
LABEL_8:
        self->_count = v9 + 1;
        return;
      }
    }
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", i), "floatValue");
      v9 = self->_count;
      self->_overscanHistogram[v9][i] = v11;
    }
    goto LABEL_8;
  }
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.VideoStabilizationAnalytics");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t i;
  uint64_t v8;
  double v9;
  unint64_t v10;
  float (*overscanHistogram)[7];
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_devicePosition), CFSTR("devicePosition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_height), CFSTR("height"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_width), CFSTR("width"));
  *(float *)&v4 = self->_startingUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("startingUIZoom"));
  *(float *)&v5 = self->_minUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("minUIZoom"));
  *(float *)&v6 = self->_maxUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("maxUIZoom"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_averageLuxValue), CFSTR("averageLuxValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_videoType, CFSTR("videoType"));
  for (i = 0; i != 7; ++i)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sigmaHist%d"), i);
    *(float *)&v9 = self->_sigmaHistogram[i];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), v8);
  }
  if (self->_count)
  {
    v10 = 0;
    overscanHistogram = self->_overscanHistogram;
    do
    {
      v12 = 0;
      v13 = self->_portType[v10];
      v14 = LOWORD(self->_binningFactor[v10]);
      do
      {
        v15 = -[NSString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("%doverscanHist%d"), v14, v12);
        *(float *)&v16 = (*overscanHistogram)[v12];
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16), v15);
        ++v12;
      }
      while (v12 != 7);
      ++v10;
      ++overscanHistogram;
    }
    while (v10 < self->_count);
  }
  return v3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (float)startingUIZoom
{
  return self->_startingUIZoom;
}

- (void)setStartingUIZoom:(float)a3
{
  self->_startingUIZoom = a3;
}

- (float)minUIZoom
{
  return self->_minUIZoom;
}

- (void)setMinUIZoom:(float)a3
{
  self->_minUIZoom = a3;
}

- (float)maxUIZoom
{
  return self->_maxUIZoom;
}

- (void)setMaxUIZoom:(float)a3
{
  self->_maxUIZoom = a3;
}

- (unsigned)averageLuxValue
{
  return self->_averageLuxValue;
}

- (void)setAverageLuxValue:(unsigned int)a3
{
  self->_averageLuxValue = a3;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

@end
