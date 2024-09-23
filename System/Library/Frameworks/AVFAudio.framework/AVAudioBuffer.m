@implementation AVAudioBuffer

- (AVAudioBuffer)initWithFormat:(id)a3 byteCapacity:(unsigned int)a4
{
  AVAudioBuffer *v6;
  uint64_t v7;
  id v8;
  CA::AudioBuffers *v9;
  CA::AudioBuffers *v10;
  _BYTE *impl;
  std::logic_error *exception;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVAudioBuffer;
  v6 = -[AVAudioBuffer init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(a3, "streamDescription");
    v7 = operator new();
    *(_DWORD *)(v7 + 40) = 0;
    *(_BYTE *)(v7 + 48) = 0;
    *(_BYTE *)(v7 + 56) = 0;
    *(_BYTE *)(v7 + 64) = 0;
    *(_BYTE *)(v7 + 88) = 0;
    *(_BYTE *)(v7 + 96) = 0;
    *(_BYTE *)(v7 + 120) = 0;
    v6->_impl = (void *)v7;
    *(_QWORD *)v7 = a3;
    v8 = a3;
    *((_DWORD *)v6->_impl + 10) = a4;
    v9 = (CA::AudioBuffers *)ExtendedAudioBufferList_Create();
    if (!v9)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "ExtendedAudioBufferList_CreateWithFormat failed");
    }
    v10 = v9;
    CA::AudioBuffers::Prepare(v9);
    impl = v6->_impl;
    if (!impl[56])
      impl[56] = 1;
    *((_QWORD *)impl + 6) = v10;
    ExtendedAudioBufferList_Destroy();
    CA::AudioBuffers::Prepare(*((CA::AudioBuffers **)v6->_impl + 6));
    v6->_deallocator = 0;
  }
  return v6;
}

- (AVAudioBuffer)initWithPCMFormat:(id)a3 byteCapacity:(unsigned int)a4 bufferListNoCopy:(const AudioBufferList *)a5 deallocator:(id)a6
{
  AVAudioBuffer *v10;
  uint64_t v11;
  __int128 v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;
  _BYTE buf[18];
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)AVAudioBuffer;
  v10 = -[AVAudioBuffer init](&v23, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(a3, "streamDescription");
    v12 = *(_OWORD *)(v11 + 16);
    v20 = *(_OWORD *)v11;
    v21 = v12;
    v22 = *(_QWORD *)(v11 + 32);
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        v25 = 2080;
        v26 = "AVAudioBuffer.mm";
        v27 = 1024;
        v28 = 136;
        v29 = 2080;
        v30 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        v31 = 2080;
        v32 = "isPCMFormat(fmt)";
        _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "isPCMFormat(fmt)");
    }
    if ((BYTE12(v20) & 0x20) != 0)
      v14 = HIDWORD(v21);
    else
      v14 = 1;
    if (!a5)
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        v25 = 2080;
        v26 = "AVAudioBuffer.mm";
        v27 = 1024;
        v28 = 138;
        v29 = 2080;
        v30 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        v31 = 2080;
        v32 = "bufferList != nullptr";
        _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "bufferList != nullptr");
    }
    if (a5->mNumberBuffers != v14)
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 71;
        v25 = 2080;
        v26 = "AVAudioBuffer.mm";
        v27 = 1024;
        v28 = 139;
        v29 = 2080;
        v30 = "-[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:]";
        v31 = 2080;
        v32 = "bufferList->mNumberBuffers == numBuffers";
        _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "bufferList->mNumberBuffers == numBuffers");
    }
    v17 = operator new();
    *(_DWORD *)(v17 + 40) = 0;
    *(_BYTE *)(v17 + 48) = 0;
    *(_BYTE *)(v17 + 56) = 0;
    *(_BYTE *)(v17 + 64) = 0;
    *(_BYTE *)(v17 + 88) = 0;
    *(_BYTE *)(v17 + 96) = 0;
    *(_BYTE *)(v17 + 120) = 0;
    v10->_impl = (void *)v17;
    *(_QWORD *)v17 = a3;
    v18 = a3;
    *((_DWORD *)v10->_impl + 10) = a4;
    std::vector<char>::vector((std::vector<char> *)buf, (16 * a5->mNumberBuffers) | 8);
    memcpy(*(void **)buf, a5, *(_QWORD *)&buf[8] - *(_QWORD *)buf);
    std::optional<CA::BufferList>::operator=[abi:ne180100]<CA::BufferList,void>((uint64_t)v10->_impl + 96, (uint64_t)buf);
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    if (a6)
      v10->_deallocator = _Block_copy(a6);
  }
  return v10;
}

- (void)dealloc
{
  id *impl;
  _BYTE *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  unsigned int *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  std::vector<char> v14;

  impl = (id *)self->_impl;
  if (impl)
  {

    v4 = self->_impl;
    if (v4[56])
    {
      ExtendedAudioBufferList_Destroy();
      v4[56] = 0;
    }
    else if (self->_deallocator)
    {
      v8 = (unsigned int *)*((_QWORD *)v4 + 12);
      std::vector<char>::vector(&v14, (16 * *v8) | 8);
      memcpy(v14.__begin_, v8, v14.__end_ - v14.__begin_);
      (*((void (**)(void))self->_deallocator + 2))();
      _Block_release(self->_deallocator);
      v9 = self->_impl;
      if (*((_BYTE *)v9 + 120))
      {
        v10 = (void *)v9[12];
        if (v10)
        {
          v9[13] = v10;
          operator delete(v10);
        }
        *((_BYTE *)v9 + 120) = 0;
      }
      if (v14.__begin_)
      {
        v14.__end_ = v14.__begin_;
        operator delete(v14.__begin_);
      }
    }
    free(*((void **)self->_impl + 1));
    v5 = self->_impl;
    if (*((_BYTE *)v5 + 88))
    {
      v6 = (void *)v5[8];
      if (v6)
      {
        v5[9] = v6;
        operator delete(v6);
        v7 = self->_impl;
        *((_BYTE *)v5 + 88) = 0;
        v5 = v7;
        if (!v7)
          goto LABEL_25;
      }
      else
      {
        *((_BYTE *)v5 + 88) = 0;
      }
    }
    if (*((_BYTE *)v5 + 120))
    {
      v11 = (void *)v5[12];
      if (v11)
      {
        v5[13] = v11;
        operator delete(v11);
      }
    }
    if (*((_BYTE *)v5 + 88))
    {
      v12 = (void *)v5[8];
      if (v12)
      {
        v5[9] = v12;
        operator delete(v12);
      }
    }
    if (*((_BYTE *)v5 + 56))
      ExtendedAudioBufferList_Destroy();
    MEMORY[0x1A1AC5BD4](v5, 0x10B2C40CBA57F67);
  }
LABEL_25:
  v13.receiver = self;
  v13.super_class = (Class)AVAudioBuffer;
  -[AVAudioBuffer dealloc](&v13, sel_dealloc);
}

- (AVAudioFormat)format
{
  return *(AVAudioFormat **)self->_impl;
}

- (unsigned)byteCapacity
{
  return *((_DWORD *)self->_impl + 10);
}

- (unsigned)byteLength
{
  _QWORD *impl;
  uint64_t v3;

  impl = self->_impl;
  if (*((_BYTE *)impl + 56))
    v3 = impl[6] + 48;
  else
    v3 = impl[12];
  return *(_DWORD *)(v3 + 12);
}

- (void)setByteLength:(unsigned int)a3
{
  _DWORD *impl;
  NSObject *v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl[10] < a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      v12 = 1024;
      v13 = 71;
      v14 = 2080;
      v15 = "AVAudioBuffer.mm";
      v16 = 1024;
      v17 = 178;
      v18 = 2080;
      v19 = "-[AVAudioBuffer setByteLength:]";
      v20 = 2080;
      v21 = "length <= _imp->_byteCapacity";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "length <= _imp->_byteCapacity");
    impl = self->_impl;
  }
  if (*((_BYTE *)impl + 56))
    v7 = (unsigned int *)(*((_QWORD *)impl + 6) + 48);
  else
    v7 = (unsigned int *)*((_QWORD *)impl + 12);
  v8 = *v7;
  if ((_DWORD)v8)
  {
    v9 = v7 + 3;
    do
    {
      *v9 = a3;
      v9 += 4;
      --v8;
    }
    while (v8);
  }
}

- (const)audioBufferList
{
  void *impl;

  impl = self->_impl;
  if (*((_BYTE *)impl + 56))
    return (const AudioBufferList *)(*((_QWORD *)impl + 6) + 48);
  else
    return (const AudioBufferList *)*((_QWORD *)impl + 12);
}

- (AudioBufferList)mutableAudioBufferList
{
  void *impl;
  unsigned int *v4;
  unsigned int *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  size_t v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  char v16;
  char *v18;
  std::vector<char> v19;

  impl = self->_impl;
  if (*((_BYTE *)impl + 88))
  {
    if (*((_BYTE *)impl + 56))
      v4 = (unsigned int *)(*((_QWORD *)impl + 6) + 48);
    else
      v4 = (unsigned int *)*((_QWORD *)impl + 12);
    v6 = (16 * *v4) | 8;
    v8 = *((_QWORD *)impl + 8);
    v7 = (_BYTE *)*((_QWORD *)impl + 9);
    if (v6 <= (unint64_t)&v7[-v8])
    {
      if (v6 < (unint64_t)&v7[-v8])
      {
        v7 = (_BYTE *)(v8 + v6);
        *((_QWORD *)impl + 9) = v8 + v6;
      }
    }
    else
    {
      v9 = *((_QWORD *)impl + 10);
      if (v9 - (uint64_t)v7 >= v6 - (unint64_t)&v7[-v8])
      {
        v14 = (char *)(v6 + v8);
        bzero(*((void **)impl + 9), v6 - (_QWORD)&v7[-v8]);
        *((_QWORD *)impl + 9) = v6 + v8;
      }
      else
      {
        v10 = v9 - v8;
        v11 = 2 * v10;
        if (2 * v10 <= v6)
          v11 = (16 * *v4) | 8;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        v13 = operator new(v12);
        v18 = &v13[v12];
        v14 = &v13[v6];
        bzero(&v7[(_QWORD)v13 - v8], v6 - (_QWORD)&v7[-v8]);
        if (v7 == (_BYTE *)v8)
        {
          v13 = &v7[(_QWORD)v13 - v8];
        }
        else
        {
          v15 = &v7[~v8];
          do
          {
            v16 = *--v7;
            (v15--)[(_QWORD)v13] = v16;
          }
          while (v7 != (_BYTE *)v8);
          v7 = (_BYTE *)*((_QWORD *)impl + 8);
        }
        *((_QWORD *)impl + 8) = v13;
        *((_QWORD *)impl + 9) = v14;
        *((_QWORD *)impl + 10) = v18;
        if (v7)
        {
          operator delete(v7);
          v14 = (char *)*((_QWORD *)impl + 9);
        }
      }
      v8 = *((_QWORD *)impl + 8);
      v7 = v14;
    }
    memcpy((void *)v8, v4, (size_t)&v7[-v8]);
  }
  else
  {
    if (*((_BYTE *)impl + 56))
      v5 = (unsigned int *)(*((_QWORD *)impl + 6) + 48);
    else
      v5 = (unsigned int *)*((_QWORD *)impl + 12);
    std::vector<char>::vector(&v19, (16 * *v5) | 8);
    memcpy(v19.__begin_, v5, v19.__end_ - v19.__begin_);
    std::optional<CA::BufferList>::operator=[abi:ne180100]<CA::BufferList,void>((uint64_t)self->_impl + 64, (uint64_t)&v19);
    if (v19.__begin_)
    {
      v19.__end_ = v19.__begin_;
      operator delete(v19.__begin_);
    }
  }
  return (AudioBufferList *)*((_QWORD *)self->_impl + 8);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@@%p: %d/%d bytes>"), NSStringFromClass(v4), self, -[AVAudioBuffer byteLength](self, "byteLength"), -[AVAudioBuffer byteCapacity](self, "byteCapacity"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVAudioBuffer *v4;
  _QWORD *impl;
  _QWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = -[AVAudioBuffer initWithFormat:byteCapacity:](+[AVAudioBuffer allocWithZone:](AVAudioBuffer, "allocWithZone:", a3), "initWithFormat:byteCapacity:", *(_QWORD *)self->_impl, *((unsigned int *)self->_impl + 10));
  impl = v4->_impl;
  v6 = self->_impl;
  if (*((_BYTE *)v6 + 56))
    v7 = (_DWORD *)(v6[6] + 48);
  else
    v7 = (_DWORD *)v6[12];
  if (*((_BYTE *)impl + 56))
    v8 = impl[6] + 48;
  else
    v8 = impl[12];
  if (*v7)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      *(_DWORD *)(v8 + v9 * 4 + 12) = v7[v9 + 3];
      memcpy(*(void **)(v8 + v9 * 4 + 16), *(const void **)&v7[v9 + 4], v7[v9 + 3]);
      ++v10;
      v9 += 4;
    }
    while (v10 < *v7);
  }
  return v4;
}

@end
