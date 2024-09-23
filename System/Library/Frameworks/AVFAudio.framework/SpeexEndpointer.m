@implementation SpeexEndpointer

- (SpeexEndpointer)init
{
  char *v2;
  _QWORD *v3;
  unsigned int *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SpeexEndpointer;
  v2 = -[SpeexEndpointer init](&v7, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *(_OWORD *)(v2 + 8) = xmmword_19B85A190;
    *((_QWORD *)v2 + 3) = 0x3FF0000000000000;
    *((_DWORD *)v2 + 8) = 1;
    v4 = (unsigned int *)operator new();
    *v4 = 5;
    *((_QWORD *)v4 + 1) = operator new[]();
    *((_QWORD *)v4 + 2) = operator new[]();
    bzero(*((void **)v4 + 1), 4 * *v4);
    v4[6] = 0;
    *v3 = 0;
    v3[1] = v4;
    *((_DWORD *)v2 + 9) = 0;
    *((_DWORD *)v2 + 10) = 0;
    *((_QWORD *)v2 + 6) = v3;
  }
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v5 = *(NSObject **)kAVVCScope;
      if (*(_QWORD *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v9 = "SpeexEndpointer.mm";
          v10 = 1024;
          v11 = 122;
          _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer init:", buf, 0x12u);
        }
      }
    }
  }
  return (SpeexEndpointer *)v2;
}

- (void)dealloc
{
  NSObject *v3;
  Impl *impl;
  Averager *var1;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v3 = *(NSObject **)kAVVCScope;
      if (*(_QWORD *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v10 = "SpeexEndpointer.mm";
          v11 = 1024;
          v12 = 128;
          _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer dealloc:", buf, 0x12u);
        }
      }
    }
  }
  impl = self->_impl;
  if (impl->var0)
    QualityDetectorDestroy((uint64_t *)impl->var0);
  var1 = impl->var1;
  if (var1)
  {
    v6 = *((_QWORD *)var1 + 1);
    if (v6)
      MEMORY[0x1A1AC5BBC](v6, 0x1000C8052888210);
    v7 = *((_QWORD *)var1 + 2);
    if (v7)
      MEMORY[0x1A1AC5BBC](v7, 0x1000C8052888210);
    MEMORY[0x1A1AC5BD4](var1, 0x1080C40ABE71A98);
  }
  MEMORY[0x1A1AC5BD4](impl, 0xA0C40BD48D6D6);
  self->_impl = 0;
  v8.receiver = self;
  v8.super_class = (Class)SpeexEndpointer;
  -[SpeexEndpointer dealloc](&v8, sel_dealloc);
}

- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4
{
  NSObject *v6;
  uint64_t **impl;
  double mInterspeechWaitTime;
  double mStartWaitTime;
  int v10;
  double mEndWaitTime;
  int v12;
  int v13;
  int v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v6 = *(NSObject **)kAVVCScope;
      if (*(_QWORD *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          v17 = 136315394;
          v18 = "SpeexEndpointer.mm";
          v19 = 1024;
          v20 = 140;
          _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer configureWithSampleRate:", (uint8_t *)&v17, 0x12u);
        }
      }
    }
  }
  impl = (uint64_t **)self->_impl;
  if (*impl)
    QualityDetectorDestroy(*impl);
  if (!a4)
  {
    if (kAVVCScope)
    {
      v16 = *(NSObject **)kAVVCScope;
      if (!*(_QWORD *)kAVVCScope)
        goto LABEL_9;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "SpeexEndpointer.mm";
      v19 = 1024;
      v20 = 146;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d SpeexEndpointer configureWithSampleRate:andFrameRate: illegal frame rate!", (uint8_t *)&v17, 0x12u);
    }
  }
LABEL_9:
  self->mFrameRate = a4;
  mStartWaitTime = self->mStartWaitTime;
  mInterspeechWaitTime = self->mInterspeechWaitTime;
  if (mInterspeechWaitTime == -1.0)
    v10 = 0x7FFFFFFF;
  else
    v10 = (mInterspeechWaitTime * (double)a4);
  mEndWaitTime = self->mEndWaitTime;
  if (mStartWaitTime == -1.0)
    v12 = 0x7FFFFFFF;
  else
    v12 = (mStartWaitTime * (double)a4);
  if (mEndWaitTime == -1.0)
    v13 = 0x7FFFFFFF;
  else
    v13 = (mEndWaitTime * (double)a4);
  if (self->mEndpointMode == 1)
    v14 = 1;
  else
    v14 = 2;
  *impl = (uint64_t *)QualityDetectorCreate(v14, v10, v12, v13);
  return 1;
}

- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4
{
  NSObject *v6;
  uint64_t **impl;
  double mInterspeechWaitTime;
  double mStartWaitTime;
  int v10;
  double mEndWaitTime;
  int v12;
  int v13;
  int v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v6 = *(NSObject **)kAVVCScope;
      if (*(_QWORD *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          v17 = 136315394;
          v18 = "SpeexEndpointer.mm";
          v19 = 1024;
          v20 = 169;
          _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer configureWithASBD:andFrameRate", (uint8_t *)&v17, 0x12u);
        }
      }
    }
  }
  impl = (uint64_t **)self->_impl;
  if (*impl)
    QualityDetectorDestroy(*impl);
  if (!a4)
  {
    if (kAVVCScope)
    {
      v16 = *(NSObject **)kAVVCScope;
      if (!*(_QWORD *)kAVVCScope)
        goto LABEL_9;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "SpeexEndpointer.mm";
      v19 = 1024;
      v20 = 175;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d SpeexEndpointer configureWithSampleRate:andFrameRate: illegal frame rate!", (uint8_t *)&v17, 0x12u);
    }
  }
LABEL_9:
  self->mFrameRate = a4;
  mStartWaitTime = self->mStartWaitTime;
  mInterspeechWaitTime = self->mInterspeechWaitTime;
  if (mInterspeechWaitTime == -1.0)
    v10 = 0x7FFFFFFF;
  else
    v10 = (mInterspeechWaitTime * (double)a4);
  mEndWaitTime = self->mEndWaitTime;
  if (mStartWaitTime == -1.0)
    v12 = 0x7FFFFFFF;
  else
    v12 = (mStartWaitTime * (double)a4);
  if (mEndWaitTime == -1.0)
    v13 = 0x7FFFFFFF;
  else
    v13 = (mEndWaitTime * (double)a4);
  if (self->mEndpointMode == 1)
    v14 = 1;
  else
    v14 = 2;
  *impl = (uint64_t *)QualityDetectorCreate(v14, v10, v12, v13);
  return 1;
}

- (int)getStatus:(AudioQueueBuffer *)a3
{
  return self->mLastStatus;
}

- (void)reset
{
  Impl *impl;
  unsigned int *var0;
  unint64_t v4;
  uint64_t v5;
  Averager *var1;

  impl = self->_impl;
  var0 = (unsigned int *)impl->var0;
  if (impl->var0)
  {
    if (var0[2])
    {
      v4 = 0;
      v5 = *(_QWORD *)var0;
      do
        *(_DWORD *)(v5 + 4 * v4++) = 0;
      while (v4 < var0[2]);
    }
    *((_QWORD *)var0 + 6) = 0;
    var0[11] = 0;
  }
  var1 = impl->var1;
  bzero(*((void **)var1 + 1), 4 * *(_DWORD *)var1);
  *((_DWORD *)var1 + 6) = 0;
}

- (int)endpointMode
{
  return self->mEndpointMode;
}

- (void)setEndpointMode:(int)a3
{
  Impl *impl;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  self->mEndpointMode = a3;
  if (kAVVCScope)
  {
    v6 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      goto LABEL_7;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "SpeexEndpointer.mm";
    v10 = 1024;
    v11 = 218;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setEndpointMode: %d", (uint8_t *)&v8, 0x18u);
  }
LABEL_7:
  if (impl->var0)
  {
    if (self->mEndpointMode == 1)
      v7 = 1;
    else
      v7 = 2;
    *((_DWORD *)impl->var0 + 5) = v7;
  }
}

- (double)startWaitTime
{
  return self->mStartWaitTime;
}

- (void)setStartWaitTime:(double)a3
{
  Impl *impl;
  double v5;
  double v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = fmax(a3, 0.25);
  if (a3 == -1.0)
    v6 = 10000000.0;
  else
    v6 = v5;
  self->mStartWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    v12 = 1024;
    v13 = 232;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setStartWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0)
    return;
  LODWORD(v5) = self->mFrameRate;
  v8 = (self->mStartWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 9) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "QualityDetector.cpp";
    v12 = 1024;
    v13 = 178;
    v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: Start Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (double)interspeechWaitTime
{
  return self->mInterspeechWaitTime;
}

- (void)setInterspeechWaitTime:(double)a3
{
  Impl *impl;
  double v5;
  double v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = fmax(a3, 0.25);
  if (a3 == -1.0)
    v6 = 10000000.0;
  else
    v6 = v5;
  self->mInterspeechWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    v12 = 1024;
    v13 = 246;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setInterspeechWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0)
    return;
  LODWORD(v5) = self->mFrameRate;
  v8 = (self->mInterspeechWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 8) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "QualityDetector.cpp";
    v12 = 1024;
    v13 = 184;
    v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: Interspeech Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (double)endWaitTime
{
  return self->mEndWaitTime;
}

- (void)setEndWaitTime:(double)a3
{
  Impl *impl;
  double v5;
  double v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = fmax(a3, 0.25);
  if (a3 == -1.0)
    v6 = 10000000.0;
  else
    v6 = v5;
  self->mEndWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    v12 = 1024;
    v13 = 260;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setEndWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0)
    return;
  LODWORD(v5) = self->mFrameRate;
  v8 = (self->mEndWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 10) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(_QWORD *)kAVVCScope)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "QualityDetector.cpp";
    v12 = 1024;
    v13 = 190;
    v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: End Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (int)getStatus:(float *)a3 count:(unsigned int)a4
{
  Impl *impl;
  uint64_t v6;
  uint64_t v7;
  Averager *var1;
  float v9;
  float v10;
  size_t v11;
  unsigned int v12;
  uint64_t v13;
  _DWORD *v14;
  _DWORD *v15;
  size_t v16;
  float v17;
  float v18;
  _BOOL4 v19;
  NSObject *v20;
  double v21;
  unsigned int *var0;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  NSObject **v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  NSObject *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  NSObject *v39;
  NSObject **v40;
  NSObject *v41;
  unsigned int v42;
  NSObject *v43;
  unsigned int v44;
  NSObject *v45;
  NSObject *v46;
  unsigned int v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  const char *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  int result;
  int v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  _BOOL4 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl->var0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B733000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " ASSERTION FAILED: getStatus called before object was configured!", buf, 2u);
    }
    __break(1u);
  }
  if (a4)
  {
    v6 = 0;
    v59 = 0;
    v7 = a4;
    while (1)
    {
      var1 = impl->var1;
      v9 = 0.0;
      v10 = fmaxf(a3[v6], 0.0);
      v11 = *(_DWORD *)var1;
      v12 = (*((_DWORD *)var1 + 6) + 1) % v11;
      *((_DWORD *)var1 + 6) = v12;
      v13 = *((_QWORD *)var1 + 1);
      *(float *)(v13 + 4 * v12) = v10;
      v14 = (_DWORD *)*((_QWORD *)var1 + 2);
      v15 = v14;
      v16 = v11;
      do
      {
        *v15++ = *(_DWORD *)(v13 + 4 * v12);
        v9 = v9 + *(float *)(v13 + 4 * v12);
        if (!v12)
          v12 = v11;
        --v12;
        --v16;
      }
      while (v16);
      v17 = v9 / (float)v11;
      v18 = *(float *)(*((_QWORD *)var1 + 2) + ((2 * *(_DWORD *)var1) & 0x1FFFFFFFCLL));
      v19 = v18 > 7.0 && v17 >= 7.0;
      if (kAVVCScope)
      {
        if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
        {
          v20 = *(NSObject **)kAVVCScope;
          if (*(_QWORD *)kAVVCScope)
          {
            if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
            {
              v21 = a3[v6];
              *(_DWORD *)buf = 136316930;
              v61 = "SpeexEndpointer.mm";
              v62 = 1024;
              v63 = 281;
              v64 = 1024;
              v65 = v6;
              v66 = 1024;
              v67 = a4;
              v68 = 2048;
              v69 = v21;
              v70 = 2048;
              v71 = v17;
              v72 = 2048;
              v73 = v18;
              v74 = 1024;
              v75 = v19;
              _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer getStatus: Raw Speex qlty frame %d/%d: %.2f rnng avrg: %.2f, med: %.2f, cls: %d", buf, 0x42u);
            }
          }
        }
      }
      var0 = (unsigned int *)impl->var0;
      v23 = (*((_DWORD *)impl->var0 + 11) + 1) % *((_DWORD *)impl->var0 + 2);
      var0[11] = v23;
      *(_DWORD *)(*(_QWORD *)var0 + 4 * v23) = v19;
      v24 = var0[12];
      switch(v24)
      {
        case 2u:
          v30 = v29;
          if (kAVVCScope)
          {
            if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
            {
              v31 = *(NSObject **)kAVVCScope;
              if (*(_QWORD *)kAVVCScope)
              {
                if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                {
                  v32 = var0[13];
                  v33 = var0[8];
                  *(_DWORD *)buf = 136315906;
                  v61 = "QualityDetector.cpp";
                  v62 = 1024;
                  v63 = 139;
                  v64 = 1024;
                  v65 = v32;
                  v66 = 1024;
                  v67 = v33;
                  _os_log_impl(&dword_19B733000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Speech Ending; End Counter %u / %u",
                    buf,
                    0x1Eu);
                }
              }
            }
          }
          v34 = var0[13] + 1;
          var0[13] = v34;
          if (v30 > var0[6])
          {
            var0[13] = 0;
            if (kAVVCScope)
            {
              v35 = *(NSObject **)kAVVCScope;
              if (!*(_QWORD *)kAVVCScope)
              {
LABEL_72:
                var0[12] = 1;
                break;
              }
            }
            else
            {
              v35 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "QualityDetector.cpp";
              v62 = 1024;
              v63 = 143;
              _os_log_impl(&dword_19B733000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: ENDING => ACTIVE", buf, 0x12u);
            }
            goto LABEL_72;
          }
          if (v34 >= var0[8])
          {
            v40 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v41 = *(NSObject **)kAVVCScope;
              if (!*(_QWORD *)kAVVCScope)
                goto LABEL_62;
            }
            else
            {
              v41 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "QualityDetector.cpp";
              v62 = 1024;
              v63 = 147;
              v51 = v41;
              v52 = "%25s:%-5d QualityDetector: ENDING => ENDED";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          break;
        case 1u:
          v37 = var0[13];
          v38 = var0[10];
          if (v37 < v38)
          {
            if (kAVVCScope)
            {
              if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
              {
                v39 = *(NSObject **)kAVVCScope;
                if (*(_QWORD *)kAVVCScope)
                {
                  if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315906;
                    v61 = "QualityDetector.cpp";
                    v62 = 1024;
                    v63 = 111;
                    v64 = 1024;
                    v65 = v37;
                    v66 = 1024;
                    v67 = v38;
                    _os_log_impl(&dword_19B733000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Active; End Counter %u / %u",
                      buf,
                      0x1Eu);
                    v37 = var0[13];
                  }
                }
              }
            }
            var0[13] = v37 + 1;
            break;
          }
          v42 = v36;
          if (kAVVCScope)
          {
            if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
            {
              v43 = *(NSObject **)kAVVCScope;
              if (*(_QWORD *)kAVVCScope)
              {
                if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v61 = "QualityDetector.cpp";
                  v62 = 1024;
                  v63 = 115;
                  v64 = 1024;
                  v65 = v42;
                  _os_log_impl(&dword_19B733000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Active; Watching for end point (current frame quality: %u)",
                    buf,
                    0x18u);
                }
              }
            }
          }
          if (v42 >= var0[7])
            break;
          v44 = var0[5];
          if (v44 == 2)
          {
            var0[13] = 0;
            if (kAVVCScope)
            {
              v53 = *(NSObject **)kAVVCScope;
              if (!*(_QWORD *)kAVVCScope)
                goto LABEL_104;
            }
            else
            {
              v53 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "QualityDetector.cpp";
              v62 = 1024;
              v63 = 126;
              _os_log_impl(&dword_19B733000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: ACTIVE => ENDING", buf, 0x12u);
            }
LABEL_104:
            var0[12] = 2;
            if (self->mEndpointMode != 2)
              break;
            if (!kAVVCScope)
            {
              v55 = MEMORY[0x1E0C81028];
LABEL_109:
              v59 = 2;
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v61 = "SpeexEndpointer.mm";
                v62 = 1024;
                v63 = 289;
                v59 = 2;
                _os_log_impl(&dword_19B733000, v55, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected soft end point ####\n", buf, 0x12u);
              }
              break;
            }
            v55 = *(NSObject **)kAVVCScope;
            if (*(_QWORD *)kAVVCScope)
              goto LABEL_109;
            v50 = 2;
LABEL_98:
            v59 = v50;
            break;
          }
          if (v44 == 1)
          {
            v40 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v45 = *(NSObject **)kAVVCScope;
              if (!*(_QWORD *)kAVVCScope)
              {
LABEL_62:
                var0[12] = 3;
                goto LABEL_92;
              }
            }
            else
            {
              v45 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "QualityDetector.cpp";
              v62 = 1024;
              v63 = 120;
              v51 = v45;
              v52 = "%25s:%-5d QualityDetector: ACTIVE => ENDED";
LABEL_90:
              _os_log_impl(&dword_19B733000, v51, OS_LOG_TYPE_DEBUG, v52, buf, 0x12u);
            }
LABEL_91:
            v40 = (NSObject **)kAVVCScope;
            var0[12] = 3;
            if (v40)
            {
LABEL_92:
              v54 = *v40;
              if (!*v40)
              {
LABEL_97:
                v50 = 3;
                goto LABEL_98;
              }
            }
            else
            {
              v54 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "SpeexEndpointer.mm";
              v62 = 1024;
              v63 = 294;
              _os_log_impl(&dword_19B733000, v54, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected hard end point ####\n", buf, 0x12u);
            }
            goto LABEL_97;
          }
          var0[12] = 4;
          break;
        case 0u:
          v25 = var0[13] + 1;
          var0[13] = v25;
          if (v26 <= var0[6])
          {
            if (kAVVCScope)
            {
              if ((*(_BYTE *)(kAVVCScope + 12) & 0x10) != 0)
              {
                v46 = *(NSObject **)kAVVCScope;
                if (*(_QWORD *)kAVVCScope)
                {
                  if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                  {
                    v47 = var0[9];
                    *(_DWORD *)buf = 136315906;
                    v61 = "QualityDetector.cpp";
                    v62 = 1024;
                    v63 = 100;
                    v64 = 1024;
                    v65 = v25;
                    v66 = 1024;
                    v67 = v47;
                    _os_log_impl(&dword_19B733000, v46, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: NoSpeech; End Counter %u / %u",
                      buf,
                      0x1Eu);
                    v25 = var0[13];
                  }
                }
              }
            }
            if (v25 <= var0[9])
              break;
            v40 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v48 = *(NSObject **)kAVVCScope;
              if (!*(_QWORD *)kAVVCScope)
                goto LABEL_62;
            }
            else
            {
              v48 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "QualityDetector.cpp";
              v62 = 1024;
              v63 = 102;
              v51 = v48;
              v52 = "%25s:%-5d QualityDetector: NONE => ENDED (TIMEOUT AT START)";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          var0[13] = 0;
          v27 = (NSObject **)kAVVCScope;
          if (kAVVCScope)
          {
            v28 = *(NSObject **)kAVVCScope;
            if (!*(_QWORD *)kAVVCScope)
            {
              v59 = 1;
              var0[12] = 1;
              break;
            }
          }
          else
          {
            v28 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v61 = "QualityDetector.cpp";
            v62 = 1024;
            v63 = 94;
            _os_log_impl(&dword_19B733000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: NONE => ACTIVE", buf, 0x12u);
            v27 = (NSObject **)kAVVCScope;
          }
          var0[12] = 1;
          if (!v27)
          {
            v49 = MEMORY[0x1E0C81028];
LABEL_74:
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v61 = "SpeexEndpointer.mm";
              v62 = 1024;
              v63 = 284;
              _os_log_impl(&dword_19B733000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected start point ####\n", buf, 0x12u);
            }
            v50 = 1;
            goto LABEL_98;
          }
          v49 = *v27;
          if (*v27)
            goto LABEL_74;
          v59 = 1;
          break;
      }
      if (++v6 == v7)
        goto LABEL_112;
    }
  }
  v59 = 0;
LABEL_112:
  result = v59;
  self->mLastStatus = v59;
  return result;
}

@end
