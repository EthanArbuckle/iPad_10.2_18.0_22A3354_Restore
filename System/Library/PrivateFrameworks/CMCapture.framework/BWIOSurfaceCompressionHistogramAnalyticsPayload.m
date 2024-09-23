@implementation BWIOSurfaceCompressionHistogramAnalyticsPayload

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfaceCompressionHistogramAnalyticsPayload;
  -[BWIOSurfaceCompressionHistogramAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_portType = 0;
  *(_OWORD *)self->_lumaCompressionHistogram = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[2] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[4] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[6] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[8] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[10] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[12] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[14] = 0u;
  *(_OWORD *)self->_chromaCompressionHistogram = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[2] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[4] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[6] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[8] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[10] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[12] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[14] = 0u;
}

- (void)setLumaCompressionHistogram:(unint64_t)a3[16]
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)a3;
  v4 = *((_OWORD *)a3 + 1);
  v5 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_lumaCompressionHistogram[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_lumaCompressionHistogram[6] = v5;
  *(_OWORD *)self->_lumaCompressionHistogram = v3;
  *(_OWORD *)&self->_lumaCompressionHistogram[2] = v4;
  v6 = *((_OWORD *)a3 + 4);
  v7 = *((_OWORD *)a3 + 5);
  v8 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_lumaCompressionHistogram[12] = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self->_lumaCompressionHistogram[14] = v8;
  *(_OWORD *)&self->_lumaCompressionHistogram[8] = v6;
  *(_OWORD *)&self->_lumaCompressionHistogram[10] = v7;
}

- (void)setChromaCompressionHistogram:(unint64_t)a3[16]
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)a3;
  v4 = *((_OWORD *)a3 + 1);
  v5 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_chromaCompressionHistogram[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_chromaCompressionHistogram[6] = v5;
  *(_OWORD *)self->_chromaCompressionHistogram = v3;
  *(_OWORD *)&self->_chromaCompressionHistogram[2] = v4;
  v6 = *((_OWORD *)a3 + 4);
  v7 = *((_OWORD *)a3 + 5);
  v8 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_chromaCompressionHistogram[12] = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self->_chromaCompressionHistogram[14] = v8;
  *(_OWORD *)&self->_chromaCompressionHistogram[8] = v6;
  *(_OWORD *)&self->_chromaCompressionHistogram[10] = v7;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.IOSurfaceCompressionHistogram");
}

- (id)eventDictionary
{
  void *v3;
  unsigned int bufferHeight;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_portType, CFSTR("portType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nodeType), CFSTR("nodeType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pixelFormatIsTenBit), CFSTR("pixelFormatIsTenBit"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSamples), CFSTR("numberOfSamples"));
  bufferHeight = self->_bufferHeight;
  if (bufferHeight - 1080 < 0x438)
    v5 = 1;
  else
    v5 = 2 * (bufferHeight > 0x86F);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), CFSTR("resolution"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", vaddvq_s64(vaddq_s64(*(int64x2_t *)self->_lumaCompressionHistogram, *(int64x2_t *)&self->_lumaCompressionHistogram[2]))), CFSTR("luma_128_to_512"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[4]), CFSTR("luma_640"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[5]), CFSTR("luma_768"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[6]), CFSTR("luma_896"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[7]), CFSTR("luma_1024"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[8]), CFSTR("luma_1152"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_lumaCompressionHistogram[9]), CFSTR("luma_1280"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_chromaCompressionHistogram[1] + self->_chromaCompressionHistogram[0]), CFSTR("chroma_128_to_256"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_chromaCompressionHistogram[2]), CFSTR("chroma_384"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_chromaCompressionHistogram[3]), CFSTR("chroma_512"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_chromaCompressionHistogram[4]), CFSTR("chroma_640"));
  return v3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)bufferHeight
{
  return self->_bufferHeight;
}

- (void)setBufferHeight:(unsigned int)a3
{
  self->_bufferHeight = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

- (BOOL)pixelFormatIsTenBit
{
  return self->_pixelFormatIsTenBit;
}

- (void)setPixelFormatIsTenBit:(BOOL)a3
{
  self->_pixelFormatIsTenBit = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

@end
