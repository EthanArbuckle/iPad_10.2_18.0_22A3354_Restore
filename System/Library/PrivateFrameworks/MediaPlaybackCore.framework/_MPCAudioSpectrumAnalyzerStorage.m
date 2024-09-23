@implementation _MPCAudioSpectrumAnalyzerStorage

- (_MPCAudioSpectrumAnalyzerStorage)initWithMaximumNumberOfFrames:(int64_t)a3 sampleRate:(float)a4
{
  _MPCAudioSpectrumAnalyzerStorage *v6;
  _MPCAudioSpectrumAnalyzerStorage *v7;
  int64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MPCAudioSpectrumAnalyzerStorage;
  v6 = -[_MPCAudioSpectrumAnalyzerStorage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_sampleRate = a4;
    if (a3 >= 0)
      v8 = a3;
    else
      v8 = a3 + 1;
    v6->_maxNumberOfFrames = a3;
    v6->_halfN = (uint64_t)(double)(v8 >> 1);
    v6->_log2N = vcvtpd_s64_f64(log2((double)a3));
    -[_MPCAudioSpectrumAnalyzerStorage _prepareBuffers](v7, "_prepareBuffers");
  }
  return v7;
}

- (void)_prepareBuffers
{
  self->_fftSetup = vDSP_create_fftsetup(self->_log2N, 0);
  self->_fftBuffer.imagp = (float *)malloc_type_calloc(self->_halfN, 4uLL, 0x100004052888210uLL);
  self->_fftBuffer.realp = (float *)malloc_type_calloc(self->_halfN, 4uLL, 0x100004052888210uLL);
  self->_intermediateBuffer = (float *)malloc_type_calloc(self->_maxNumberOfFrames, 4uLL, 0x100004052888210uLL);
}

- (void)dealloc
{
  objc_super v3;

  -[_MPCAudioSpectrumAnalyzerStorage _freeBuffers](self, "_freeBuffers");
  -[_MPCAudioSpectrumAnalyzerStorage _destroyFFTSetup](self, "_destroyFFTSetup");
  v3.receiver = self;
  v3.super_class = (Class)_MPCAudioSpectrumAnalyzerStorage;
  -[_MPCAudioSpectrumAnalyzerStorage dealloc](&v3, sel_dealloc);
}

- (void)_destroyFFTSetup
{
  OpaqueFFTSetup *fftSetup;

  fftSetup = self->_fftSetup;
  if (fftSetup)
  {
    vDSP_destroy_fftsetup(fftSetup);
    self->_fftSetup = 0;
  }
}

- (void)_freeBuffers
{
  float *intermediateBuffer;
  float *imagp;
  float *realp;

  intermediateBuffer = self->_intermediateBuffer;
  if (intermediateBuffer)
    free(intermediateBuffer);
  imagp = self->_fftBuffer.imagp;
  if (imagp)
    free(imagp);
  realp = self->_fftBuffer.realp;
  if (realp)
    free(realp);
}

- (void)analyzeFrequencies:(AudioBufferList *)a3 numberFrames:(unint64_t)a4 observers:(id)a5
{
  id v8;
  const float *mData;
  const float *v10;
  float *intermediateBuffer;
  size_t v12;
  float __C;

  v8 = a5;
  if (a3->mNumberBuffers)
  {
    mData = (const float *)a3->mBuffers[0].mData;
    if (a3->mNumberBuffers == 1)
    {
      if (!mData)
        goto LABEL_12;
    }
    else
    {
      v10 = *(const float **)&a3[1].mBuffers[0].mNumberChannels;
      if (mData && v10)
      {
        __C = 0.5;
        vDSP_vasm(mData, 1, v10, 1, &__C, self->_intermediateBuffer, 1, a4);
LABEL_11:
        -[_MPCAudioSpectrumAnalyzerStorage analyzeAudioData:numberFrames:observers:](self, "analyzeAudioData:numberFrames:observers:", self->_intermediateBuffer, a4, v8);
        goto LABEL_12;
      }
      if (!mData)
      {
        if (!v10)
          goto LABEL_12;
        intermediateBuffer = self->_intermediateBuffer;
        mData = *(const float **)&a3[1].mBuffers[0].mNumberChannels;
        v12 = 4 * a4;
        goto LABEL_10;
      }
    }
    intermediateBuffer = self->_intermediateBuffer;
    v12 = 4 * a4;
LABEL_10:
    memcpy(intermediateBuffer, mData, v12);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)analyzeAudioData:(void *)a3 numberFrames:(unsigned int)a4 observers:(id)a5
{
  id v8;
  float *intermediateBuffer;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int64_t v14;
  float v15;
  float v16;
  float v17;
  float sampleRate;
  id v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t j;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  float *v29;
  id v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  float __C;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  intermediateBuffer = self->_intermediateBuffer;
  if (intermediateBuffer != a3)
    memcpy(intermediateBuffer, a3, 4 * a4);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "beginReport");
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v11);
  }
  vDSP_ctoz((const DSPComplex *)self->_intermediateBuffer, 2, &self->_fftBuffer, 1, self->_halfN);
  vDSP_fft_zrip(self->_fftSetup, &self->_fftBuffer, 1, self->_log2N, 1);
  vDSP_vclr(self->_intermediateBuffer, 1, a4);
  vDSP_zaspec(&self->_fftBuffer, self->_intermediateBuffer, self->_halfN);
  __C = 0.0;
  vDSP_sve(self->_intermediateBuffer, 1, &__C, self->_halfN);
  if (__C > 0.0 && self->_halfN >= 1)
  {
    v14 = 0;
    v15 = (float)a4;
    do
    {
      v16 = self->_intermediateBuffer[v14];
      v17 = __C;
      sampleRate = self->_sampleRate;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v19 = v8;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v20)
      {
        v21 = v20;
        v22 = v16 / v17;
        v23 = *(_QWORD *)v42;
        v24 = (float)(sampleRate * (float)(int)v14) / v15;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v42 != v23)
              objc_enumerationMutation(v19);
            v26 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * j);
            v27 = v26[4];
            if (v27)
            {
              v28 = 0;
              v29 = (float *)(v26[1] + 24);
              do
              {
                if (*(v29 - 4) < v24 && *(v29 - 3) >= v24)
                {
                  ++*(_QWORD *)v29;
                  *(v29 - 2) = v22 + *(v29 - 2);
                  v27 = v26[4];
                }
                ++v28;
                v29 += 8;
              }
              while (v28 < v27);
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        }
        while (v21);
      }

      ++v14;
    }
    while (self->_halfN > v14);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v30);
        v36 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
        *(float *)&v32 = __C;
        objc_msgSend(v36, "setPowerLevel:", v32, (_QWORD)v37);
        objc_msgSend(v36, "finishReport");
      }
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v33);
  }

}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (int64_t)maxNumberOfFrames
{
  return self->_maxNumberOfFrames;
}

- (void)setMaxNumberOfFrames:(int64_t)a3
{
  self->_maxNumberOfFrames = a3;
}

- (int64_t)halfN
{
  return self->_halfN;
}

- (void)setHalfN:(int64_t)a3
{
  self->_halfN = a3;
}

- (int64_t)log2N
{
  return self->_log2N;
}

- (void)setLog2N:(int64_t)a3
{
  self->_log2N = a3;
}

@end
