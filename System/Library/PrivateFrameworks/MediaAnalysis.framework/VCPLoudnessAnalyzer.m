@implementation VCPLoudnessAnalyzer

- (VCPLoudnessAnalyzer)init
{
  VCPLoudnessAnalyzer *v2;
  VCPLoudnessAnalyzer *v3;
  uint64_t v4;
  NSMutableArray *loudnessResults;
  VCPLoudnessAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPLoudnessAnalyzer;
  v2 = -[VCPLoudnessAnalyzer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_framePosition = 0;
    v2->_sampleRate = 16000.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    loudnessResults = v3->_loudnessResults;
    v3->_loudnessResults = (NSMutableArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  double *p_mSampleRate;
  CAStreamBasicDescription *v8;
  float v9;
  LkFsMeasure *v10;
  AUOutputBL *v11;

  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (!StreamBasicDescription)
    return -50;
  p_mSampleRate = &StreamBasicDescription->mSampleRate;
  v8 = (CAStreamBasicDescription *)operator new();
  CAStreamBasicDescription::CAStreamBasicDescription(v8, self->_sampleRate, 0x6C70636Du, 4u, 1u, 4u, 1u, 0x20u, 0x29u);
  self->_processFormat = v8;
  v9 = *p_mSampleRate;
  self->_sampleRate = v9;
  v10 = (LkFsMeasure *)operator new();
  LkFsMeasure::LkFsMeasure(v10, 1u, self->_sampleRate, (uint64_t)(self->_sampleRate * 0.4), 0);
  self->_loudnessAnalyzer = v10;
  LkFsMeasure::Reset(v10);
  self->_peakValues.__end_ = self->_peakValues.__begin_;
  self->_momentaryEnergyValues.__end_ = self->_momentaryEnergyValues.__begin_;
  self->_loudnessSampleBuffer.__end_ = self->_loudnessSampleBuffer.__begin_;
  self->_samplesFor100ms = (float)(self->_sampleRate * 0.1);
  v11 = (AUOutputBL *)operator new();
  AUOutputBL::AUOutputBL(v11, self->_processFormat, self->_samplesFor100ms);
  self->_samplesForProcessingBufferList = v11;
  AUOutputBL::Allocate(v11, self->_samplesFor100ms);
  AUOutputBL::Prepare(self->_samplesForProcessingBufferList, self->_samplesFor100ms, 0);
  return 0;
}

- (void)dealloc
{
  LkFsMeasure *loudnessAnalyzer;
  CAStreamBasicDescription *processFormat;
  AUOutputBL *samplesForProcessingBufferList;
  objc_super v6;

  loudnessAnalyzer = self->_loudnessAnalyzer;
  if (loudnessAnalyzer)
  {
    LkFsMeasure::~LkFsMeasure(loudnessAnalyzer);
    MEMORY[0x1BCCA12BC]();
  }
  processFormat = self->_processFormat;
  if (processFormat)
    MEMORY[0x1BCCA12BC](processFormat, 0x1000C400A747E1ELL);
  samplesForProcessingBufferList = self->_samplesForProcessingBufferList;
  if (samplesForProcessingBufferList)
  {
    AUOutputBL::~AUOutputBL(samplesForProcessingBufferList);
    MEMORY[0x1BCCA12BC]();
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPLoudnessAnalyzer;
  -[VCPLoudnessAnalyzer dealloc](&v6, sel_dealloc);
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  float *begin;
  unint64_t samplesFor100ms;
  AudioBufferList *var2;
  void *mData;
  uint64_t v9;
  double v10;
  double v11;
  double *value;
  double *end;
  double *v14;
  double *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  double *v21;
  double *v22;
  uint64_t v23;
  double *v24;
  double v25;
  double *v26;
  double *v27;
  double *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  double *v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  float *v39;
  float *v40;
  int64_t v41;
  float __C;
  void *__src;
  void *v45;
  uint64_t v46;

  std::vector<float>::__insert_with_size[abi:ne180100]<float *,float *>((uint64_t)&self->_loudnessSampleBuffer, (uint64_t)self->_loudnessSampleBuffer.__end_, (char *)a3->mBuffers[0].mData, (char *)a3->mBuffers[0].mData + ((int)a3->mBuffers[0].mDataByteSize & 0xFFFFFFFFFFFFFFFCLL), (uint64_t)(int)a3->mBuffers[0].mDataByteSize >> 2);
  begin = self->_loudnessSampleBuffer.__begin_;
  samplesFor100ms = self->_samplesFor100ms;
  if (samplesFor100ms <= self->_loudnessSampleBuffer.__end_ - begin)
  {
    __src = 0;
    v45 = 0;
    v46 = 0;
    std::vector<float>::__insert_with_size[abi:ne180100]<float *,float *>((uint64_t)&__src, 0, (char *)begin, (char *)&begin[samplesFor100ms], samplesFor100ms);
    var2 = self->_samplesForProcessingBufferList->var2;
    mData = var2->mBuffers[0].mData;
    v9 = self->_samplesFor100ms;
    if ((_DWORD)v9)
    {
      memmove(mData, __src, 4 * v9);
      var2 = self->_samplesForProcessingBufferList->var2;
      LODWORD(v9) = self->_samplesFor100ms;
    }
    v10 = LkFsMeasure::Process(self->_loudnessAnalyzer, var2, v9, 0);
    v11 = v10;
    value = self->_momentaryEnergyValues.__end_cap_.__value_;
    end = self->_momentaryEnergyValues.__end_;
    if (end >= value)
    {
      v15 = self->_momentaryEnergyValues.__begin_;
      v16 = end - v15;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
      v17 = (char *)value - (char *)v15;
      v18 = ((char *)value - (char *)v15) >> 2;
      if (v18 <= v16 + 1)
        v18 = v16 + 1;
      if (v17 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v18;
      if (v19)
      {
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&self->_momentaryEnergyValues.__end_cap_, v19);
        v15 = self->_momentaryEnergyValues.__begin_;
        end = self->_momentaryEnergyValues.__end_;
      }
      else
      {
        v20 = 0;
      }
      v21 = (double *)&v20[8 * v16];
      v22 = (double *)&v20[8 * v19];
      *v21 = v11;
      v14 = v21 + 1;
      while (end != v15)
      {
        v23 = *((_QWORD *)end-- - 1);
        *((_QWORD *)v21-- - 1) = v23;
      }
      self->_momentaryEnergyValues.__begin_ = v21;
      self->_momentaryEnergyValues.__end_ = v14;
      self->_momentaryEnergyValues.__end_cap_.__value_ = v22;
      if (v15)
        operator delete(v15);
    }
    else
    {
      *end = v10;
      v14 = end + 1;
    }
    self->_momentaryEnergyValues.__end_ = v14;
    __C = 0.0;
    vDSP_maxmgv((const float *)mData, 1, &__C, self->_samplesFor100ms);
    v24 = self->_peakValues.__end_cap_.__value_;
    v25 = __C;
    v26 = self->_peakValues.__end_;
    if (v26 >= v24)
    {
      v28 = self->_peakValues.__begin_;
      v29 = v26 - v28;
      if ((unint64_t)(v29 + 1) >> 61)
        std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
      v30 = (char *)v24 - (char *)v28;
      v31 = ((char *)v24 - (char *)v28) >> 2;
      if (v31 <= v29 + 1)
        v31 = v29 + 1;
      if (v30 >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
      {
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&self->_peakValues.__end_cap_, v32);
        v28 = self->_peakValues.__begin_;
        v26 = self->_peakValues.__end_;
      }
      else
      {
        v33 = 0;
      }
      v34 = (double *)&v33[8 * v29];
      v35 = (double *)&v33[8 * v32];
      *v34 = v25;
      v27 = v34 + 1;
      while (v26 != v28)
      {
        v36 = *((_QWORD *)v26-- - 1);
        *((_QWORD *)v34-- - 1) = v36;
      }
      self->_peakValues.__begin_ = v34;
      self->_peakValues.__end_ = v27;
      self->_peakValues.__end_cap_.__value_ = v35;
      if (v28)
        operator delete(v28);
    }
    else
    {
      *v26 = v25;
      v27 = v26 + 1;
    }
    self->_peakValues.__end_ = v27;
    v37 = self->_samplesFor100ms;
    if ((_DWORD)v37)
    {
      v39 = self->_loudnessSampleBuffer.__begin_;
      v38 = self->_loudnessSampleBuffer.__end_;
      v40 = &v39[v37];
      v41 = (char *)v38 - (char *)v40;
      if (v38 != v40)
        memmove(self->_loudnessSampleBuffer.__begin_, v40, (char *)v38 - (char *)v40);
      self->_loudnessSampleBuffer.__end_ = (float *)((char *)v39 + v41);
    }
    if (__src)
    {
      v45 = __src;
      operator delete(__src);
    }
  }
  return 0;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  double *begin;
  double *end;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  NSMutableArray *loudnessResults;
  CFDictionaryRef v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  CMTime v24;
  uint64_t v25;
  void *__p;
  void *v27;
  uint64_t v28;
  CMTime v29;
  CMTime v30;
  CMTime rhs;
  CMTime time;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[6];

  v36[3] = *MEMORY[0x1E0C80C00];
  begin = self->_momentaryEnergyValues.__begin_;
  end = self->_momentaryEnergyValues.__end_;
  if (begin != end)
  {
    v5 = (char *)end - (char *)begin;
    v6 = (unint64_t)v5 <= 0x18 ? 0 : 3;
    if (v6 < (unint64_t)(v5 >> 3))
    {
      v8 = 0;
      v9 = v5 >> 3;
      if (v9 >= 10)
        v9 = 10;
      v10 = v9 - v6;
      do
      {
        __p = 0;
        v27 = 0;
        v28 = 0;
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>>((uint64_t)&__p, 0, (char *)&begin[v6], (char *)&begin[v6 + v10], v10);
        v25 = 0;
        v11 = LkFsMeasure::ComputeProgramLoudnessFromBlockEnergies((uint64_t)&__p, (double *)&v25);
        v12 = v6 + v10;
        if (v10 < 1)
        {
          v14 = -INFINITY;
        }
        else
        {
          v14 = -INFINITY;
          do
          {
            v13 = self->_peakValues.__begin_;
            if (v14 <= v13[v6])
              v14 = v13[v6];
            ++v6;
          }
          while (v6 < v12);
        }
        CMTimeMake(&time, (uint64_t)(float)(self->_sampleRate * (float)v8), (int)self->_sampleRate);
        v30 = time;
        CMTimeMake(&time, (uint64_t)(float)((float)(self->_sampleRate * (float)v12) / 10.0), (int)self->_sampleRate);
        v29 = time;
        loudnessResults = self->_loudnessResults;
        v35[0] = CFSTR("start");
        time = v30;
        v16 = CMTimeCopyAsDictionary(&time, 0);
        v36[0] = v16;
        v35[1] = CFSTR("duration");
        time = v29;
        rhs = v30;
        CMTimeSubtract(&v24, &time, &rhs);
        time = v24;
        v17 = CMTimeCopyAsDictionary(&time, 0);
        v36[1] = v17;
        v35[2] = CFSTR("attributes");
        v33[0] = CFSTR("energyValues");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v18;
        v33[1] = CFSTR("peakValues");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](loudnessResults, "addObject:", v21);

        begin = self->_momentaryEnergyValues.__begin_;
        v22 = self->_momentaryEnergyValues.__end_ - begin;
        if ((uint64_t)(v22 - v12) >= 10)
          v10 = 10;
        else
          v10 = v22 - v12;
        if (__p)
        {
          v27 = __p;
          operator delete(__p);
          begin = self->_momentaryEnergyValues.__begin_;
          v22 = self->_momentaryEnergyValues.__end_ - begin;
        }
        ++v8;
        v6 = v12;
      }
      while (v12 < v22);
    }
  }
  return 0;
}

- (id)results
{
  NSMutableArray *loudnessResults;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  loudnessResults = self->_loudnessResults;
  v4 = CFSTR("LoudnessResults");
  v5[0] = loudnessResults;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  float *begin;
  double *v4;
  double *v5;

  objc_storeStrong((id *)&self->_loudnessResults, 0);
  begin = self->_loudnessSampleBuffer.__begin_;
  if (begin)
  {
    self->_loudnessSampleBuffer.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_momentaryEnergyValues.__begin_;
  if (v4)
  {
    self->_momentaryEnergyValues.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_peakValues.__begin_;
  if (v5)
  {
    self->_peakValues.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end
