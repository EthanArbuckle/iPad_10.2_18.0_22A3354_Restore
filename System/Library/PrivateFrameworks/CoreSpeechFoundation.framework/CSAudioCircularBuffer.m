@implementation CSAudioCircularBuffer

- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5
{
  return -[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:](self, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", a3, 0);
}

- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5 audioTimeConverter:(id)a6
{
  id v11;
  CSAudioCircularBuffer *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *value;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CSAudioCircularBuffer;
  v12 = -[CSAudioCircularBuffer init](&v22, sel_init);
  if (v12)
  {
    v13 = operator new();
    *(_QWORD *)v13 = a3;
    *(float *)(v13 + 8) = a4;
    *(float *)(v13 + 12) = a5;
    *(_QWORD *)(v13 + 24) = 0;
    *(_QWORD *)(v13 + 32) = 0;
    *(_QWORD *)(v13 + 16) = (unint64_t)(float)(a4 * a5);
    v14 = operator new[]();
    *(_QWORD *)(v13 + 40) = v14;
    *(_QWORD *)(v13 + 48) = 0;
    v15 = *(_QWORD *)v13;
    *(_QWORD *)(v13 + 56) = 0;
    *(_QWORD *)(v13 + 64) = 0;
    if (v15)
    {
      if (v15 >> 61)
        std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
      v16 = (char *)operator new(8 * v15);
      *(_QWORD *)(v13 + 48) = v16;
      *(_QWORD *)(v13 + 64) = &v16[8 * v15];
      bzero(v16, 8 * v15);
      v17 = 0;
      *(_QWORD *)(v13 + 56) = &v16[8 * v15];
      v18 = 2 * *(_QWORD *)(v13 + 16);
      do
      {
        *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * v17++) = v14;
        v14 += v18;
      }
      while (v15 != v17);
    }
    value = v12->_csAudioCircularBufferImpl.__ptr_.__value_;
    v12->_csAudioCircularBufferImpl.__ptr_.__value_ = (void *)v13;
    if (value)
      std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned short>>::operator()[abi:ne180100](value);
    v20 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:]";
      v25 = 2050;
      v26 = a3;
      v27 = 2050;
      v28 = a4;
      v29 = 2050;
      v30 = a5;
      _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s numChannels: %{public}lu, recordingDuration: %{public}f, sampleRate: %{public}f", buf, 0x2Au);
    }
    v12->_numInputChannels = a3;
    v12->_inputRecordingDuration = a4;
    v12->_bufferLength = *((_QWORD *)v12->_csAudioCircularBufferImpl.__ptr_.__value_ + 2);
    objc_storeStrong((id *)&v12->_audioTimeConverter, a6);
  }

  return v12;
}

- (unint64_t)numInputChannels
{
  return self->_numInputChannels;
}

- (float)inputRecordingDuration
{
  return self->_inputRecordingDuration;
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4
{
  -[CSAudioCircularBuffer addSamples:numSamples:atHostTime:](self, "addSamples:numSamples:atHostTime:", a3, a4, mach_absolute_time());
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4 atHostTime:(unint64_t)a5
{
  unint64_t *value;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  size_t v15;
  char *v16;
  void *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t __n;

  value = (unint64_t *)self->_csAudioCircularBufferImpl.__ptr_.__value_;
  v7 = value[2];
  if (*value)
  {
    v9 = 0;
    v20 = a4 - v7;
    __n = 2 * a4;
    do
    {
      v10 = value[3];
      v11 = *(char **)(value[6] + 8 * v9);
      v12 = (char *)a3 + 2 * v9 * a4;
      v13 = v7 - v10;
      v14 = a4 - (v7 - v10);
      if (a4 <= v7 - v10)
      {
        memcpy(&v11[2 * v10], (char *)a3 + 2 * v9 * a4, __n);
        v14 = v10 + a4;
      }
      else
      {
        if (a4 >= v7)
        {
          v14 = (v10 + v20) % v7;
          v18 = &v12[2 * v20];
          memcpy(&v11[2 * v14], v18, 2 * (v7 - v14));
          v16 = &v18[2 * (v7 - v14)];
          v17 = v11;
          v15 = 2 * v14;
        }
        else
        {
          memcpy(&v11[2 * v10], (char *)a3 + 2 * v9 * a4, 2 * v13);
          v15 = 2 * v14;
          v16 = &v12[2 * v13];
          v17 = v11;
        }
        memcpy(v17, v16, v15);
      }
      ++v9;
    }
    while (v9 < *value);
  }
  else
  {
    v14 = value[3];
  }
  v19 = value[4] + a4;
  value[3] = v14 % v7;
  value[4] = v19;
}

- (id)copySamplesFromHostTime:(unint64_t)a3
{
  CSAudioTimeConverter *audioTimeConverter;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self->_csAudioCircularBufferImpl.__ptr_.__value_ + 4))
  {
    audioTimeConverter = self->_audioTimeConverter;
    if (audioTimeConverter)
      v5 = -[CSAudioTimeConverter sampleCountFromHostTime:](audioTimeConverter, "sampleCountFromHostTime:", a3);
    else
      v5 = 0;
    return -[CSAudioCircularBuffer copySamplesFrom:to:](self, "copySamplesFrom:to:", v5, -[CSAudioCircularBuffer sampleCount](self, "sampleCount"));
  }
  else
  {
    v6 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSAudioCircularBuffer copySamplesFromHostTime:]";
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot copy samples since this is empty", (uint8_t *)&v8, 0xCu);
    }
    return 0;
  }
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  CSAudioTimeConverter *audioTimeConverter;
  uint64_t v12;
  NSObject *v13;
  CSAudioChunk *v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(&v17, (uint64_t *)self->_csAudioCircularBufferImpl.__ptr_.__value_, a3, a4);
  v7 = v17;
  if (v17)
  {
    v8 = *(_QWORD *)self->_csAudioCircularBufferImpl.__ptr_.__value_;
    v9 = a4 - a3;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 2 * (a4 - a3) * v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    audioTimeConverter = self->_audioTimeConverter;
    if (audioTimeConverter)
      v12 = -[CSAudioTimeConverter hostTimeFromSampleCount:](audioTimeConverter, "hostTimeFromSampleCount:", a3);
    else
      v12 = 0;
    LOBYTE(v16) = 1;
    v14 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:]([CSAudioChunk alloc], "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v10, v8, v9, 2, a3, v12, 0, v16, 0);

    MEMORY[0x1B5E46120](v7, 0x1000C80BDFB0063);
  }
  else
  {
    v13 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[CSAudioCircularBuffer copySamplesFrom:to:]";
      v20 = 2050;
      v21 = a3;
      v22 = 2050;
      v23 = a4;
      v24 = 2050;
      v25 = 0;
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    return 0;
  }
  return v14;
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  _QWORD *value;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v15;
  NSObject *v16;
  CSAudioChunk *v17;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  size_t v28;
  uint64_t v29;
  void *v30;
  CSAudioTimeConverter *audioTimeConverter;
  uint64_t v32;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  v8 = value[2];
  v9 = value[4];
  if (v9 >= v8)
    v10 = v9 - v8;
  else
    v10 = 0;
  if (v10 > a3 || a4 <= a3 || v9 < a4 || v9 <= a3 || v10 >= a4)
  {
    v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "copySamples";
      v37 = 2050;
      v38 = a3;
      v39 = 2050;
      v40 = a4;
      v41 = 2050;
      v42 = v10;
      v43 = 2050;
      v44 = v9;
      _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
    }
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[CSAudioCircularBuffer copySamplesFrom:to:channelIdx:]";
      v37 = 2050;
      v38 = a3;
      v39 = 2050;
      v40 = a4;
      v41 = 2050;
      v42 = 0;
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    return 0;
  }
  else
  {
    v20 = a3 % v8;
    v21 = a4 % v8;
    v22 = a4 - a3;
    v23 = 2 * (a4 - a3);
    v24 = (char *)operator new[]();
    v25 = v24;
    v26 = *(char **)(value[6] + 8 * a5);
    v27 = &v26[2 * v20];
    if (v20 >= v21)
    {
      v29 = v8 - v20;
      memcpy(v24, v27, 2 * v29);
      v24 = &v25[2 * v29];
      v28 = 2 * (v22 - v29);
      v27 = v26;
    }
    else
    {
      v28 = v23;
    }
    memcpy(v24, v27, v28);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    audioTimeConverter = self->_audioTimeConverter;
    if (audioTimeConverter)
      v32 = -[CSAudioTimeConverter hostTimeFromSampleCount:](audioTimeConverter, "hostTimeFromSampleCount:", a3);
    else
      v32 = 0;
    LOBYTE(v34) = 1;
    v17 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:]([CSAudioChunk alloc], "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v30, 1, v22, 2, a3, v32, 0, v34, 0);

    MEMORY[0x1B5E46120](v25, 0x1000C80BDFB0063);
  }
  return v17;
}

- (id)copybufferFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(&v11, (uint64_t *)self->_csAudioCircularBufferImpl.__ptr_.__value_, a3, a4);
  v7 = v11;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 2 * (a4 - a3) * *(_QWORD *)self->_csAudioCircularBufferImpl.__ptr_.__value_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1B5E46120](v7, 0x1000C80BDFB0063);
    return v8;
  }
  else
  {
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[CSAudioCircularBuffer copybufferFrom:to:]";
      v14 = 2050;
      v15 = a3;
      v16 = 2050;
      v17 = a4;
      v18 = 2050;
      v19 = 0;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    return 0;
  }
}

- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3
{
  _QWORD *value;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  v6 = value[4];
  v7 = value[2];
  v8 = v6 >= v7;
  v9 = v6 - v7;
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  v11 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a3;
    v17 = 136315906;
    v18 = "-[CSAudioCircularBuffer copyBufferWithNumSamplesCopiedIn:]";
    v19 = 2050;
    v20 = v10;
    v21 = 2050;
    v22 = v6;
    v23 = 2050;
    v24 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s copyBuffer: oldestSample: %{public}lu latestSample: %{public}lu, numSamplesCopied: %{public}lu", (uint8_t *)&v17, 0x2Au);
  }
  v13 = -[CSAudioCircularBuffer copySamplesFrom:to:](self, "copySamplesFrom:to:", v10, v6);
  v14 = v13;
  if (v13)
  {
    *a3 = objc_msgSend(v13, "numSamples");
    objc_msgSend(v14, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    *a3 = 0;
  }

  return v15;
}

- (void)reset
{
  NSObject *v3;
  _QWORD *value;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioCircularBuffer reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioCircularBuffer.reset", (uint8_t *)&v5, 0xCu);
  }
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  value[3] = 0;
  value[4] = 0;
}

- (unint64_t)sampleCount
{
  return *((_QWORD *)self->_csAudioCircularBufferImpl.__ptr_.__value_ + 4);
}

- (unint64_t)bufferLength
{
  return self->_bufferLength;
}

- (void)setBufferLength:(unint64_t)a3
{
  self->_bufferLength = a3;
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (void)setNumInputChannels:(unint64_t)a3
{
  self->_numInputChannels = a3;
}

- (void)setInputRecordingDuration:(float)a3
{
  self->_inputRecordingDuration = a3;
}

- (void).cxx_destruct
{
  _QWORD *value;

  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  self->_csAudioCircularBufferImpl.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned short>>::operator()[abi:ne180100](value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
