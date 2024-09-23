@implementation AVAudioSettingsValueConstrainer

- (AVAudioSettingsValueConstrainer)init
{
  AVAudioSettingsValueConstrainer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAudioSettingsValueConstrainer;
  result = -[AVAudioSettingsValueConstrainer init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_inputASBD.mBitsPerChannel = 0;
    *(_OWORD *)&result->_inputASBD.mBytesPerPacket = 0u;
    *(_OWORD *)&result->_inputASBD.mSampleRate = 0u;
    *(_OWORD *)&result->_outputASBD.mSampleRate = 0u;
    *(_OWORD *)&result->_outputASBD.mBytesPerPacket = 0u;
    *(_QWORD *)&result->_outputASBD.mBitsPerChannel = 0;
    *(_WORD *)&result->_needNewConverter = 257;
    result->_needApplicableParameters = 1;
  }
  return result;
}

- (void)dealloc
{
  OpaqueAudioConverter *audioConverter;
  objc_super v4;

  audioConverter = self->_audioConverter;
  if (audioConverter)
    AudioConverterDispose(audioConverter);

  v4.receiver = self;
  v4.super_class = (Class)AVAudioSettingsValueConstrainer;
  -[AVAudioSettingsValueConstrainer dealloc](&v4, sel_dealloc);
}

- (void)_buildAudioConverter
{
  OpaqueAudioConverter *audioConverter;
  OpaqueAudioConverter **p_audioConverter;
  __int128 v5;
  AudioStreamBasicDescription v7;
  UInt32 ioPropertyDataSize;

  ioPropertyDataSize = 40;
  p_audioConverter = &self->_audioConverter;
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    *p_audioConverter = 0;
  }
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &self->_inputASBD);
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &self->_outputASBD);
  v5 = *(_OWORD *)&self->_outputASBD.mBytesPerPacket;
  *(_OWORD *)&v7.mSampleRate = *(_OWORD *)&self->_outputASBD.mSampleRate;
  *(_OWORD *)&v7.mBytesPerPacket = v5;
  *(_QWORD *)&v7.mBitsPerChannel = *(_QWORD *)&self->_outputASBD.mBitsPerChannel;
  if (v7.mFormatID == 1819304813 && HIDWORD(v5) == 0)
    v7.mChannelsPerFrame = self->_inputASBD.mChannelsPerFrame;
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &v7);
  AudioConverterNew(&self->_inputASBD, &v7, p_audioConverter);
  self->_needNewConverter = 0;
}

- (void)_buildAvailableSampleRates
{
  OpaqueAudioConverter *audioConverter;
  NSArray *availableOutputSampleRates;
  void *v5;
  UInt32 outSize;

  outSize = 0;
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    availableOutputSampleRates = self->_availableOutputSampleRates;
    if (availableOutputSampleRates)
    {

      self->_availableOutputSampleRates = 0;
      audioConverter = self->_audioConverter;
    }
    v5 = 0;
    if (!AudioConverterGetPropertyInfo(audioConverter, 0x76657372u, &outSize, 0))
    {
      v5 = malloc_type_malloc(outSize, 0x3F695FC0uLL);
      if (v5)
      {
        if (!AudioConverterGetProperty(self->_audioConverter, 0x76657372u, &outSize, v5))
          self->_availableOutputSampleRates = (NSArray *)audioValueRangeArrayWithAudioValueRanges((uint64_t)v5, (unint64_t)outSize >> 4);
      }
    }
  }
  else
  {
    v5 = 0;
  }
  free(v5);
  self->_needAvailableSampleRates = 0;
}

- (void)_buildApplicableDataRatesForSampleRates
{
  Float64 mSampleRate;
  NSMutableArray *availableOutputDataRates;
  NSMutableArray *applicableOutputSampleRatesForDataRate;
  NSMutableArray *applicableOutputDataRatesForSampleRate;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  Float64 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  mSampleRate = self->_outputASBD.mSampleRate;
  availableOutputDataRates = self->_availableOutputDataRates;
  if (availableOutputDataRates)
  {

    self->_availableOutputDataRates = 0;
  }
  self->_availableOutputDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  applicableOutputSampleRatesForDataRate = self->_applicableOutputSampleRatesForDataRate;
  if (applicableOutputSampleRatesForDataRate)
  {

    self->_applicableOutputSampleRatesForDataRate = 0;
  }
  self->_applicableOutputSampleRatesForDataRate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  applicableOutputDataRatesForSampleRate = self->_applicableOutputDataRatesForSampleRate;
  if (applicableOutputDataRatesForSampleRate)
  {

    self->_applicableOutputDataRatesForSampleRate = 0;
  }
  self->_applicableOutputDataRatesForSampleRate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = self->_availableOutputSampleRates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "minimum");
        self->_outputASBD.mSampleRate = v11;
        -[AVAudioSettingsValueConstrainer _buildAudioConverter](self, "_buildAudioConverter");
        v12 = -[AVAudioSettingsValueConstrainer _fetchApplicableOutputDataRates](self, "_fetchApplicableOutputDataRates");
        -[NSMutableArray addObject:](self->_applicableOutputDataRatesForSampleRate, "addObject:", v12);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
              if (-[NSMutableArray indexOfObject:](self->_availableOutputDataRates, "indexOfObject:", v17) == 0x7FFFFFFFFFFFFFFFLL)
                -[NSMutableArray addObject:](self->_availableOutputDataRates, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v14);
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v8);
  }
  if (-[NSMutableArray count](self->_availableOutputDataRates, "count"))
  {
    v18 = 0;
    do
    {
      -[NSMutableArray addObject:](self->_applicableOutputSampleRatesForDataRate, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      ++v18;
    }
    while (v18 < -[NSMutableArray count](self->_availableOutputDataRates, "count"));
  }
  if (-[NSArray count](self->_availableOutputSampleRates, "count"))
  {
    v19 = 0;
    do
    {
      v20 = -[NSArray objectAtIndex:](self->_availableOutputSampleRates, "objectAtIndex:", v19);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = (void *)-[NSMutableArray objectAtIndex:](self->_applicableOutputDataRatesForSampleRate, "objectAtIndex:", v19);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            v26 = -[NSMutableArray indexOfObject:](self->_availableOutputDataRates, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
            if (v26 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v27 = (void *)-[NSMutableArray objectAtIndex:](self->_applicableOutputSampleRatesForDataRate, "objectAtIndex:", v26);
              if (objc_msgSend(v27, "indexOfObject:", v20) == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v27, "addObject:", v20);
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        }
        while (v23);
      }
      ++v19;
    }
    while (v19 < -[NSArray count](self->_availableOutputSampleRates, "count"));
  }
  self->_outputASBD.mSampleRate = mSampleRate;
  self->_needNewConverter = 1;
  self->_needApplicableParameters = 0;
}

- (id)_fetchApplicableOutputDataRates
{
  void *v3;
  OpaqueAudioConverter *audioConverter;
  void *v5;
  UInt32 outSize;

  outSize = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  audioConverter = self->_audioConverter;
  if (audioConverter && !AudioConverterGetPropertyInfo(audioConverter, 0x61656272u, &outSize, 0))
  {
    v5 = malloc_type_malloc(outSize, 0x334E525EuLL);
    if (v5 && !AudioConverterGetProperty(self->_audioConverter, 0x61656272u, &outSize, v5))
      v3 = audioValueRangeArrayWithAudioValueRanges((uint64_t)v5, (unint64_t)outSize >> 4);
  }
  else
  {
    v5 = 0;
  }
  free(v5);
  return v3;
}

- (void)_bringUpToDate
{
  OpaqueAudioConverter *audioConverter;
  UInt32 ioPropertyDataSize;

  ioPropertyDataSize = 40;
  if (self->_needNewConverter)
  {
    -[AVAudioSettingsValueConstrainer _buildAudioConverter](self, "_buildAudioConverter");
    *(_WORD *)&self->_needAvailableSampleRates = 257;
  }
  else if (!self->_needAvailableSampleRates)
  {
    goto LABEL_5;
  }
  -[AVAudioSettingsValueConstrainer _buildAvailableSampleRates](self, "_buildAvailableSampleRates");
LABEL_5:
  if (self->_needApplicableParameters)
    -[AVAudioSettingsValueConstrainer _buildApplicableDataRatesForSampleRates](self, "_buildApplicableDataRatesForSampleRates");
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    if (self->_needNewConverter)
    {
      -[AVAudioSettingsValueConstrainer _buildAudioConverter](self, "_buildAudioConverter");
      audioConverter = self->_audioConverter;
    }
    AudioConverterGetProperty(audioConverter, 0x61636964u, &ioPropertyDataSize, &self->_inputASBD);
    AudioConverterGetProperty(self->_audioConverter, 0x61636F64u, &ioPropertyDataSize, &self->_outputASBD);
  }
}

- (void)setInputPropertiesFromASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_inputASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_inputASBD.mBytesPerPacket = v4;
  *(_OWORD *)&self->_inputASBD.mSampleRate = v3;
  self->_needNewConverter = 1;
}

- (float)outputSampleRate
{
  return self->_outputASBD.mSampleRate;
}

- (void)setOutputSampleRate:(float)a3
{
  double v3;

  v3 = a3;
  if (self->_outputASBD.mSampleRate != v3)
  {
    self->_outputASBD.mSampleRate = v3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputFormat
{
  return self->_outputASBD.mFormatID;
}

- (void)setOutputFormat:(unsigned int)a3
{
  if (self->_outputASBD.mFormatID != a3)
  {
    self->_outputASBD.mFormatID = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputFormatFlags
{
  return self->_outputASBD.mFormatFlags;
}

- (void)setOutputFormatFlags:(unsigned int)a3
{
  if (self->_outputASBD.mFormatFlags != a3)
  {
    self->_outputASBD.mFormatFlags = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputBitsPerChannel
{
  return self->_outputASBD.mBitsPerChannel;
}

- (void)setOutputBitsPerChannel:(unsigned int)a3
{
  if (self->_outputASBD.mBitsPerChannel != a3)
  {
    self->_outputASBD.mBitsPerChannel = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputChannelCount
{
  return self->_outputASBD.mChannelsPerFrame;
}

- (void)setOutputChannelCount:(unsigned int)a3
{
  if (self->_outputASBD.mChannelsPerFrame != a3)
  {
    self->_outputASBD.mChannelsPerFrame = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputDataRate
{
  return self->_outputDataRate;
}

- (void)setOutputDataRate:(unsigned int)a3
{
  self->_outputDataRate = a3;
}

- (float)applicableOutputSampleRateForDesiredSampleRate:(float)a3 rounding:(int64_t)a4
{
  unsigned int v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  float result;

  -[AVAudioSettingsValueConstrainer _bringUpToDate](self, "_bringUpToDate");
  v7 = -[AVAudioSettingsValueConstrainer outputDataRate](self, "outputDataRate");
  if (v7)
  {
    v9 = indexOfValueInAudioValueRangeArray(self->_availableOutputDataRates, a4, (double)v7);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)-[NSMutableArray objectAtIndex:](self->_applicableOutputSampleRatesForDataRate, "objectAtIndex:", v9);
      v11 = indexOfValueInAudioValueRangeArray(v10, a4, a3);
      a3 = 0.0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v11), "minimum");
        return v12;
      }
    }
    return a3;
  }
  else
  {
    *(float *)&v8 = a3;
    -[AVAudioSettingsValueConstrainer _getAvailableOutputSampleRateFor:rounding:](self, "_getAvailableOutputSampleRateFor:rounding:", a4, v8);
  }
  return result;
}

- (unsigned)availableOutputChannelCountForDesiredChannelCount:(unsigned int)a3 rounding:(int64_t)a4
{
  AudioStreamBasicDescription *p_outputASBD;
  unsigned int *v7;
  UInt32 v8;
  unint64_t v9;
  void *v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  double v14;
  UInt32 outPropertyDataSize;

  outPropertyDataSize = 0;
  p_outputASBD = &self->_outputASBD;
  if (AudioFormatGetPropertyInfo(0x61766E63u, 0x28u, &self->_outputASBD, &outPropertyDataSize))
  {
    v7 = 0;
  }
  else
  {
    v7 = (unsigned int *)malloc_type_malloc(outPropertyDataSize, 0x33B701BuLL);
    if (v7)
    {
      if (!AudioFormatGetProperty(0x61766E63u, 0x28u, p_outputASBD, &outPropertyDataSize, v7))
      {
        v8 = outPropertyDataSize;
        v9 = (unint64_t)outPropertyDataSize >> 2;
        if ((_DWORD)v9 != 1 || *v7 != -1)
        {
          v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (unint64_t)outPropertyDataSize >> 2);
          if (v8 >= 4)
          {
            if (v9 <= 1)
              v9 = 1;
            v11 = v7;
            do
            {
              v12 = *v11++;
              objc_msgSend(v10, "addObject:", +[AVFloat64Range float64RangeWithMinimum:maximum:](AVFloat64Range, "float64RangeWithMinimum:maximum:", (double)v12, (double)v12));
              --v9;
            }
            while (v9);
          }
          v13 = indexOfValueInAudioValueRangeArray(v10, a4, (double)a3);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            a3 = 0;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v13), "minimum");
            a3 = v14;
          }
        }
      }
    }
  }
  free(v7);
  return a3;
}

- (float)_getAvailableOutputSampleRateFor:(float)a3 rounding:(int64_t)a4
{
  NSArray *availableOutputSampleRates;
  uint64_t v8;
  double v9;

  -[AVAudioSettingsValueConstrainer _bringUpToDate](self, "_bringUpToDate");
  availableOutputSampleRates = self->_availableOutputSampleRates;
  if (availableOutputSampleRates)
  {
    v8 = indexOfValueInAudioValueRangeArray(availableOutputSampleRates, a4, a3);
    a3 = 0.0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(-[NSArray objectAtIndex:](availableOutputSampleRates, "objectAtIndex:", v8), "minimum");
      return v9;
    }
  }
  return a3;
}

@end
