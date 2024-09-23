@implementation AVAudioConverter

- (AVAudioConverter)initFromFormat:(AVAudioFormat *)fromFormat toFormat:(AVAudioFormat *)toFormat
{
  OSStatus v7;
  AVAudioConverter *result;
  AVAudioChannelLayout *v9;
  AVAudioChannelLayout *v10;
  const AudioChannelLayout *v11;
  UInt32 v12;
  AVAudioChannelLayout *v13;
  AVAudioChannelLayout *v14;
  const AudioChannelLayout *v15;
  UInt32 v16;
  uint64_t v17;
  AVAudioFormat *v18;
  id v19;
  AVAudioFormat *v20;
  uint64_t v21;
  AudioConverterRef outAudioConverter;

  outAudioConverter = 0;
  v7 = AudioConverterNew(-[AVAudioFormat streamDescription](fromFormat, "streamDescription"), -[AVAudioFormat streamDescription](toFormat, "streamDescription"), &outAudioConverter);
  result = 0;
  if (!v7 && outAudioConverter)
  {
    v9 = -[AVAudioFormat channelLayout](fromFormat, "channelLayout");
    if ((!v9
       || (v10 = v9, -[AVAudioChannelLayout layoutTag](v9, "layoutTag") == 6553601)
       || -[AVAudioChannelLayout layoutTag](v10, "layoutTag") == 6619138
       || (v11 = -[AVAudioChannelLayout layout](v10, "layout"),
           v12 = -[AVAudioChannelLayout layoutSize](v10, "layoutSize"),
           !AudioConverterSetProperty(outAudioConverter, 0x69636C20u, v12, v11)))
      && ((v13 = -[AVAudioFormat channelLayout](toFormat, "channelLayout")) == 0
       || (v14 = v13, -[AVAudioChannelLayout layoutTag](v13, "layoutTag") == 6553601)
       || -[AVAudioChannelLayout layoutTag](v14, "layoutTag") == 6619138
       || (v15 = -[AVAudioChannelLayout layout](v14, "layout"),
           v16 = -[AVAudioChannelLayout layoutSize](v14, "layoutSize"),
           !AudioConverterSetProperty(outAudioConverter, 0x6F636C20u, v16, v15))))
    {
      v17 = operator new();
      *(_QWORD *)v17 = outAudioConverter;
      *(_QWORD *)(v17 + 8) = fromFormat;
      *(_QWORD *)(v17 + 48) = 0;
      *(_BYTE *)(v17 + 64) = 0;
      *(_QWORD *)(v17 + 24) = 0;
      *(_QWORD *)(v17 + 32) = 0;
      *(_QWORD *)(v17 + 16) = toFormat;
      v18 = fromFormat;
      v19 = *(id *)(v17 + 16);
      self->_impl = (void *)v17;
      if (-[AVAudioFormat magicCookie](fromFormat, "magicCookie"))
        v20 = fromFormat;
      else
        v20 = toFormat;
      v21 = -[AVAudioFormat magicCookie](v20, "magicCookie");
      if (v21)
        -[AVAudioConverter setMagicCookie:](self, "setMagicCookie:", v21);
      return self;
    }
    else
    {
      AudioConverterDispose(outAudioConverter);
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  id *impl;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  impl = (id *)self->_impl;
  if (impl)
  {

    v4 = impl[3];
    if (v4)

    v5 = impl[4];
    if (v5)

    v6 = impl[6];
    if (v6)

    AudioConverterDispose((AudioConverterRef)*impl);
    MEMORY[0x1A1AC5BD4](impl, 0x10A0C40A8DF87D0);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAudioConverter;
  -[AVAudioConverter dealloc](&v7, sel_dealloc);
}

- (AVAudioFormat)inputFormat
{
  return (AVAudioFormat *)*((_QWORD *)self->_impl + 1);
}

- (AVAudioFormat)outputFormat
{
  return (AVAudioFormat *)*((_QWORD *)self->_impl + 2);
}

- (void)reset
{
  AudioConverterRef *impl;

  impl = (AudioConverterRef *)self->_impl;
  *((_BYTE *)impl + 64) = 0;
  AudioConverterReset(*impl);
}

- (BOOL)dither
{
  AudioConverterRef *impl;
  BOOL v3;
  int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x64697468u, &ioPropertyDataSize, &outPropertyData))
    v3 = 1;
  else
    v3 = outPropertyData == 0;
  return !v3;
}

- (BOOL)downmix
{
  AudioConverterRef *impl;
  BOOL v3;
  int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x646D6978u, &ioPropertyDataSize, &outPropertyData))
    v3 = 1;
  else
    v3 = outPropertyData == 0;
  return !v3;
}

- (void)setDither:(BOOL)dither
{
  AudioConverterRef *impl;
  int v4;
  int inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  if (dither)
    v4 = 3;
  else
    v4 = 0;
  inPropertyData = v4;
  AudioConverterSetProperty(*impl, 0x64697468u, 4u, &inPropertyData);
}

- (void)setDownmix:(BOOL)downmix
{
  AudioConverterRef *impl;
  _BOOL4 inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  inPropertyData = downmix;
  AudioConverterSetProperty(*impl, 0x646D6978u, 4u, &inPropertyData);
}

- (NSInteger)sampleRateConverterQuality
{
  AudioConverterRef *impl;
  unsigned int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x73726371u, &ioPropertyDataSize, &outPropertyData))
    return 0;
  else
    return outPropertyData;
}

- (void)setSampleRateConverterQuality:(NSInteger)sampleRateConverterQuality
{
  AudioConverterRef *impl;
  int inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  inPropertyData = sampleRateConverterQuality;
  AudioConverterSetProperty(*impl, 0x73726371u, 4u, &inPropertyData);
}

- (NSString)sampleRateConverterAlgorithm
{
  AudioConverterRef *impl;
  const __CFString *v4;
  const __CFString *v5;
  int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x73726361u, &ioPropertyDataSize, &outPropertyData))
    return 0;
  if (outPropertyData == 1650553971)
    v4 = CFSTR("AVSampleRateConverterAlgorithm_Mastering");
  else
    v4 = 0;
  if (outPropertyData == 1835626096)
    v5 = CFSTR("AVSampleRateConverterAlgorithm_MinimumPhase");
  else
    v5 = v4;
  if (outPropertyData == 1852797549)
    return (NSString *)CFSTR("AVSampleRateConverterAlgorithm_Normal");
  else
    return &v5->isa;
}

- (void)setSampleRateConverterAlgorithm:(NSString *)sampleRateConverterAlgorithm
{
  AudioConverterRef *impl;
  int v5;
  int inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  if (-[NSString compare:](sampleRateConverterAlgorithm, "compare:", CFSTR("AVSampleRateConverterAlgorithm_Mastering")))
  {
    if (-[NSString compare:](sampleRateConverterAlgorithm, "compare:", CFSTR("AVSampleRateConverterAlgorithm_Normal")))
    {
      if (-[NSString compare:](sampleRateConverterAlgorithm, "compare:", CFSTR("AVSampleRateConverterAlgorithm_MinimumPhase")))
      {
        return;
      }
      v5 = 1835626096;
    }
    else
    {
      v5 = 1852797549;
    }
  }
  else
  {
    v5 = 1650553971;
  }
  inPropertyData = v5;
  AudioConverterSetProperty(*impl, 0x73726361u, 4u, &inPropertyData);
}

- (NSData)magicCookie
{
  AudioConverterRef *impl;
  void *v3;
  NSData *v4;
  id v6;
  AudioConverterRef v7;
  Boolean outWritable;
  UInt32 outSize;

  impl = (AudioConverterRef *)self->_impl;
  outSize = 0;
  outWritable = 0;
  if (AudioConverterGetPropertyInfo(*impl, 0x636D6763u, &outSize, &outWritable))
    return 0;
  v3 = malloc_type_calloc(1uLL, outSize, 0xBC4462F1uLL);
  if (AudioConverterGetProperty(*impl, 0x636D6763u, &outSize, v3))
  {
    free(v3);
    return 0;
  }
  v6 = objc_alloc(MEMORY[0x1E0C99D50]);
  v4 = (NSData *)objc_msgSend(v6, "initWithBytes:length:", v3, outSize);
  free(v3);
  v7 = impl[3];
  if (v7)

  impl[3] = (AudioConverterRef)v4;
  return v4;
}

- (void)setMagicCookie:(NSData *)magicCookie
{
  AudioConverterRef *impl;
  AudioConverterRef v5;

  impl = (AudioConverterRef *)self->_impl;
  if (!AudioConverterSetProperty(*impl, 0x636D6763u, -[NSData length](magicCookie, "length"), -[NSData bytes](magicCookie, "bytes")))
  {
    v5 = impl[3];
    if (v5)

    impl[3] = (AudioConverterRef)magicCookie;
  }
}

- (NSArray)channelMap
{
  AudioConverterRef *impl;
  AudioConverterRef v3;
  NSArray *result;

  impl = (AudioConverterRef *)self->_impl;
  v3 = impl[4];
  if (v3)

  result = (NSArray *)AVAudioConverterImpl::getInt32List(impl, 0x63686D70u, 0);
  impl[4] = (AudioConverterRef)result;
  if (!result)
  {
    result = (NSArray *)objc_opt_new();
    impl[4] = (AudioConverterRef)result;
  }
  return result;
}

- (void)setChannelMap:(NSArray *)channelMap
{
  AudioConverterRef *impl;
  uint64_t v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v8;
  unsigned int v9;

  impl = (AudioConverterRef *)self->_impl;
  v5 = -[NSArray count](channelMap, "count");
  v6 = (4 * v5);
  v7 = malloc_type_calloc(1uLL, v6, 0xE36CCDD3uLL);
  if (v5 >= 1)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v7[v8] = objc_msgSend(-[NSArray objectAtIndex:](channelMap, "objectAtIndex:", v8), "integerValue");
      v8 = v9;
    }
    while (v5 > v9++);
  }
  AudioConverterSetProperty(*impl, 0x63686D70u, v6, v7);
  free(v7);
}

- (NSInteger)maximumOutputPacketSize
{
  AudioConverterRef *impl;
  unsigned int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x786F7073u, &ioPropertyDataSize, &outPropertyData))
    return 0;
  else
    return outPropertyData;
}

- (AVAudioConverterPrimeMethod)primeMethod
{
  AudioConverterRef *impl;
  UInt32 ioPropertyDataSize;
  unsigned int outPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  outPropertyData = 0;
  ioPropertyDataSize = 4;
  AudioConverterGetProperty(*impl, 0x70726D6Du, &ioPropertyDataSize, &outPropertyData);
  return (unint64_t)outPropertyData;
}

- (void)setPrimeMethod:(AVAudioConverterPrimeMethod)primeMethod
{
  AudioConverterRef *impl;
  int inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  inPropertyData = primeMethod;
  AudioConverterSetProperty(*impl, 0x70726D6Du, 4u, &inPropertyData);
}

- (AVAudioConverterPrimeInfo)primeInfo
{
  AudioConverterRef *impl;
  UInt32 ioPropertyDataSize;
  AVAudioConverterPrimeInfo outPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 8;
  AudioConverterGetProperty(*impl, 0x7072696Du, &ioPropertyDataSize, &outPropertyData);
  return outPropertyData;
}

- (void)setPrimeInfo:(AVAudioConverterPrimeInfo)primeInfo
{
  AudioConverterRef *impl;
  AVAudioConverterPrimeInfo inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  inPropertyData = primeInfo;
  AudioConverterSetProperty(*impl, 0x7072696Du, 8u, &inPropertyData);
}

- (BOOL)convertToBuffer:(AVAudioPCMBuffer *)outputBuffer fromBuffer:(const AVAudioPCMBuffer *)inputBuffer error:(NSError *)outError
{
  AudioConverterRef *impl;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  OSStatus v12;
  id v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  impl = (AudioConverterRef *)self->_impl;
  v9 = -[AVAudioPCMBuffer frameCapacity](outputBuffer, "frameCapacity");
  if (v9 < -[AVAudioPCMBuffer frameLength]((id)inputBuffer, "frameLength"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "AVAEInternal.h";
      v17 = 1024;
      v18 = 71;
      v19 = 2080;
      v20 = "AVAudioConverter.mm";
      v21 = 1024;
      v22 = 469;
      v23 = 2080;
      v24 = "convert";
      v25 = 2080;
      v26 = "outputBuffer.frameCapacity >= inputBuffer.frameLength";
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "outputBuffer.frameCapacity >= inputBuffer.frameLength");
  }
  v11 = -[AVAudioPCMBuffer frameLength]((id)inputBuffer, "frameLength");
  -[AVAudioPCMBuffer setFrameLength:](outputBuffer, "setFrameLength:", v11);
  v12 = AudioConverterConvertComplexBuffer(*impl, v11, -[AVAudioBuffer audioBufferList]((id)inputBuffer, "audioBufferList"), -[AVAudioBuffer mutableAudioBufferList](outputBuffer, "mutableAudioBufferList"));
  if (v12)
  {
    if (outError)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *outError = (NSError *)objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, 0);
    }
    -[AVAudioPCMBuffer setFrameLength:](outputBuffer, "setFrameLength:", 0);
  }
  return v12 == 0;
}

- (AVAudioConverterOutputStatus)convertToBuffer:(AVAudioBuffer *)outputBuffer error:(NSError *)outError withInputFromBlock:(AVAudioConverterInputBlock)inputBlock
{
  AudioConverterRef *impl;
  AudioBufferList *v9;
  char isKindOfClass;
  char v11;
  UInt32 v12;
  AudioStreamPacketDescription *v13;
  OSStatus v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  UInt32 ioOutputDataPacketSize;

  impl = (AudioConverterRef *)self->_impl;
  if (-[AVAudioFormat isEqual:](-[AVAudioBuffer format](outputBuffer, "format"), "isEqual:", impl[2]))
  {
    -[AVAudioBuffer setByteLength:](outputBuffer, "setByteLength:", -[AVAudioBuffer byteCapacity](outputBuffer, "byteCapacity"));
    v9 = -[AVAudioBuffer mutableAudioBufferList](outputBuffer, "mutableAudioBufferList");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v12 = -[AVAudioBuffer frameCapacity](outputBuffer, "frameCapacity");
      v13 = 0;
      ioOutputDataPacketSize = v12;
      goto LABEL_6;
    }
    if ((v11 & 1) != 0)
    {
      ioOutputDataPacketSize = -[AVAudioBuffer packetCapacity](outputBuffer, "packetCapacity");
      v13 = (AudioStreamPacketDescription *)-[AVAudioBuffer packetDescriptions](outputBuffer, "packetDescriptions");
LABEL_6:
      impl[7] = (AudioConverterRef)inputBlock;
      v14 = AudioConverterFillComplexBuffer(*impl, (AudioConverterComplexInputDataProc)AVAudioConverterImpl::FillComplexProc, impl, &ioOutputDataPacketSize, v9, v13);
      impl[7] = 0;
      if ((isKindOfClass & 1) != 0)
      {
        -[AVAudioBuffer setFrameLength:](outputBuffer, "setFrameLength:", ioOutputDataPacketSize);
        if (v14)
        {
LABEL_8:
          if (v14 == 2002872692)
            return 1;
          if (!outError)
            return 3;
          v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v17 = *MEMORY[0x1E0CB2F90];
          v18 = v14;
          goto LABEL_12;
        }
      }
      else
      {
        -[AVAudioBuffer setByteLength:](outputBuffer, "setByteLength:", v9->mBuffers[0].mDataByteSize);
        -[AVAudioBuffer setPacketCount:](outputBuffer, "setPacketCount:", ioOutputDataPacketSize);
        if (v14)
          goto LABEL_8;
      }
      return 2 * (ioOutputDataPacketSize == 0);
    }
  }
  if (outError)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2F90];
    v18 = 1718449215;
LABEL_12:
    *outError = (NSError *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, v18, 0);
  }
  return 3;
}

- (NSInteger)bitRate
{
  AudioConverterRef *impl;
  unsigned int outPropertyData;
  UInt32 ioPropertyDataSize;

  impl = (AudioConverterRef *)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  AudioConverterGetProperty(*impl, 0x62726174u, &ioPropertyDataSize, &outPropertyData);
  return outPropertyData;
}

- (void)setBitRate:(NSInteger)bitRate
{
  AudioConverterRef *impl;
  int inPropertyData;

  impl = (AudioConverterRef *)self->_impl;
  inPropertyData = bitRate;
  AudioConverterSetProperty(*impl, 0x62726174u, 4u, &inPropertyData);
}

- (NSString)bitRateStrategy
{
  OpaqueAudioConverter *v2;
  unsigned int outPropertyData;
  UInt32 ioPropertyDataSize;

  v2 = *(OpaqueAudioConverter **)self->_impl;
  ioPropertyDataSize = 4;
  outPropertyData = 0;
  if (AudioConverterGetProperty(v2, 0x61636266u, &ioPropertyDataSize, &outPropertyData) || outPropertyData > 3)
    return 0;
  else
    return (NSString *)*(&off_1E3BED100 + (int)outPropertyData);
}

- (void)setBitRateStrategy:(NSString *)bitRateStrategy
{
  OpaqueAudioConverter *v4;
  int v5;
  int inPropertyData;

  v4 = *(OpaqueAudioConverter **)self->_impl;
  if (-[NSString compare:](bitRateStrategy, "compare:", CFSTR("AVAudioBitRateStrategy_Constant")))
  {
    if (-[NSString compare:](bitRateStrategy, "compare:", CFSTR("AVAudioBitRateStrategy_LongTermAverage")))
    {
      if (-[NSString compare:](bitRateStrategy, "compare:", CFSTR("AVAudioBitRateStrategy_VariableConstrained")))
      {
        if (-[NSString compare:](bitRateStrategy, "compare:", CFSTR("AVAudioBitRateStrategy_Variable")))
          return;
        v5 = 3;
      }
      else
      {
        v5 = 2;
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  inPropertyData = v5;
  AudioConverterSetProperty(v4, 0x61636266u, 4u, &inPropertyData);
}

- (NSArray)availableEncodeBitRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x76656272u, 0);
}

- (NSArray)applicableEncodeBitRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x61656272u, 0);
}

- (NSArray)availableEncodeSampleRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x76657372u, 1);
}

- (NSArray)applicableEncodeSampleRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x61657372u, 1);
}

- (NSArray)availableEncodeChannelLayoutTags
{
  return (NSArray *)AVAudioConverterImpl::getInt32List((AudioConverterRef *)self->_impl, 0x6165636Cu, 1);
}

@end
