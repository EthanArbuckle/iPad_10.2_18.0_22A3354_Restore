@implementation CSRemoteVADCircularBuffer

- (CSRemoteVADCircularBuffer)initWithRecordingDuration:(float)a3 audioSamplesPerRemoteVAD:(int)a4 audioSampleRate:(float)a5
{
  CSRemoteVADCircularBuffer *v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *value;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CSRemoteVADCircularBuffer;
  v8 = -[CSRemoteVADCircularBuffer init](&v18, sel_init);
  if (v8)
  {
    v9 = operator new();
    v10 = a5 / (float)a4;
    *(_QWORD *)v9 = 1;
    *(float *)(v9 + 8) = a3;
    *(float *)(v9 + 12) = v10;
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 16) = (unint64_t)(float)(v10 * a3);
    v11 = operator new[]();
    *(_QWORD *)(v9 + 40) = v11;
    *(_QWORD *)(v9 + 48) = 0;
    v12 = *(_QWORD *)v9;
    *(_QWORD *)(v9 + 56) = 0;
    *(_QWORD *)(v9 + 64) = 0;
    if (v12)
    {
      if (v12 >> 61)
        std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
      v13 = (char *)operator new(8 * v12);
      *(_QWORD *)(v9 + 48) = v13;
      *(_QWORD *)(v9 + 64) = &v13[8 * v12];
      bzero(v13, 8 * v12);
      v14 = 0;
      *(_QWORD *)(v9 + 56) = &v13[8 * v12];
      v15 = *(_QWORD *)(v9 + 16);
      do
      {
        *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v14++) = v11;
        v11 += v15;
      }
      while (v12 != v14);
    }
    value = v8->_remoteVADCircularBufferImpl.__ptr_.__value_;
    v8->_remoteVADCircularBufferImpl.__ptr_.__value_ = (void *)v9;
    if (value)
      std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned char>>::operator()[abi:ne180100](value);
    v8->_audioSamplesPerRemoteVAD = a4;
  }
  return v8;
}

- (void)reset
{
  _QWORD *value;

  value = self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  value[3] = 0;
  value[4] = 0;
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4
{
  unint64_t *value;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  unint64_t v14;

  value = (unint64_t *)self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  v6 = value[2];
  if (*value)
  {
    v7 = 0;
    v8 = a4 - v6;
    v9 = (char *)a3;
    do
    {
      v10 = value[3];
      v11 = *(char **)(value[6] + 8 * v7);
      v12 = a4 - (v6 - v10);
      if (a4 <= v6 - v10)
      {
        memcpy(&v11[v10], v9, a4);
        v12 = v10 + a4;
      }
      else
      {
        if (a4 >= v6)
        {
          v12 = (v10 + v8) % v6;
          memcpy(&v11[v12], &v9[v8], v6 - v12);
          v13 = (char *)a3 + v7 * a4 + v8 + v6 - v12;
        }
        else
        {
          memcpy(&v11[v10], v9, v6 - v10);
          v13 = &v9[v6 - v10];
        }
        memcpy(v11, v13, v12);
      }
      ++v7;
      v9 += a4;
    }
    while (v7 < *value);
  }
  else
  {
    v12 = value[3];
  }
  v14 = value[4] + a4;
  value[3] = v12 % v6;
  value[4] = v14;
}

- (unint64_t)remoteVADSampleCount
{
  return *((_QWORD *)self->_remoteVADCircularBufferImpl.__ptr_.__value_ + 4);
}

- (id)copySamplesFromAudioSampleCount:(unint64_t)a3 toAudioSampleCount:(unint64_t)a4
{
  return -[CSRemoteVADCircularBuffer copySamplesFrom:to:](self, "copySamplesFrom:to:", a3 / self->_audioSamplesPerRemoteVAD, a4 / self->_audioSamplesPerRemoteVAD);
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t *value;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  os_log_t *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  const void **v24;
  size_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  size_t v30;
  char *__dst;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  value = (uint64_t *)self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  v7 = value[2];
  v8 = value[4];
  if (v8 >= v7)
    v9 = v8 - v7;
  else
    v9 = 0;
  if (v9 > a3 || a4 <= a3 || v8 < a4 || v8 <= a3 || v9 >= a4)
  {
    v14 = (os_log_t *)MEMORY[0x1E0D18F38];
    v15 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "copySamples";
      v36 = 2050;
      v37 = a3;
      v38 = 2050;
      v39 = a4;
      v40 = 2050;
      v41 = v9;
      v42 = 2050;
      v43 = v8;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
    }
    v16 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[CSRemoteVADCircularBuffer copySamplesFrom:to:]";
      v36 = 2050;
      v37 = a3;
      v38 = 2050;
      v39 = a4;
      v40 = 2050;
      v41 = 0;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    return 0;
  }
  else
  {
    v18 = a4 - a3;
    v19 = operator new[]();
    __dst = (char *)v19;
    v20 = *value;
    if (*value)
    {
      v21 = 0;
      v22 = a3 % v7;
      v23 = a4 % v7;
      v24 = (const void **)value[6];
      v25 = v7 - a3 % v7;
      v26 = (char *)v19;
      do
      {
        v27 = (char *)*v24;
        v28 = (char *)*v24 + v22;
        if (v22 >= v23)
        {
          memcpy(v26, v28, v25);
          v29 = &__dst[v21 * v18 + v25];
          v28 = v27;
          v30 = v18 - v25;
        }
        else
        {
          v29 = v26;
          v30 = v18;
        }
        memcpy(v29, v28, v30);
        ++v21;
        ++v24;
        v26 += v18;
        --v20;
      }
      while (v20);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __dst, *(_QWORD *)self->_remoteVADCircularBufferImpl.__ptr_.__value_ * v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1C3BC414C](__dst, 0x1000C8077774924);
  }
  return v17;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)beginSampleCount
{
  return self->_beginSampleCount;
}

- (void).cxx_destruct
{
  _QWORD *value;

  value = self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  self->_remoteVADCircularBufferImpl.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned char>>::operator()[abi:ne180100](value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
