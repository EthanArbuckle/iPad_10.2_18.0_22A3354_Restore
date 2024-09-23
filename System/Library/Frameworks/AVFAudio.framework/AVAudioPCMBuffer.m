@implementation AVAudioPCMBuffer

- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format frameCapacity:(AVAudioFrameCount)frameCapacity
{
  const AudioStreamBasicDescription *v7;
  __int128 v8;
  NSObject *v9;
  int v10;
  __objc2_prot_list *v11;
  const char *v12;
  AVAudioPCMBuffer *v13;
  AVAudioPCMBuffer *v14;
  int v15;
  _BYTE *impl;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = -[AVAudioFormat streamDescription](format, "streamDescription");
  v8 = *(_OWORD *)&v7->mBytesPerPacket;
  v19 = *(_OWORD *)&v7->mSampleRate;
  v20 = v8;
  v21 = *(_QWORD *)&v7->mBitsPerChannel;
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioBuffer.mm";
      v28 = 1024;
      v29 = 287;
      v30 = 2080;
      v31 = "-[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]";
      v32 = 2080;
      v33 = "isPCMFormat(fmt)";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "isPCMFormat(fmt)");
  }
  v10 = DWORD2(v20);
  if (!DWORD2(v20))
  {
    v11 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "AVAudioBuffer.mm";
      v24 = 1024;
      v25 = 290;
      v12 = "%25s:%-5d format has zero bytes per frame";
      goto LABEL_13;
    }
LABEL_14:

    return 0;
  }
  if (((DWORD2(v20) * (unint64_t)frameCapacity) & 0xFFFFFFFF00000000) != 0)
  {
    v11 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "AVAudioBuffer.mm";
      v24 = 1024;
      v25 = 297;
      v12 = "%25s:%-5d buffer byte capacity cannot be represented by an uint32_t";
LABEL_13:
      _os_log_impl(&dword_19B733000, (os_log_t)v11, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)AVAudioPCMBuffer;
  v14 = -[AVAudioBuffer initWithFormat:byteCapacity:](&v18, sel_initWithFormat_byteCapacity_, format, DWORD2(v20) * frameCapacity);
  v13 = v14;
  if (v14)
  {
    *((_QWORD *)v14->super._impl + 1) = 0;
    *((_DWORD *)v14->super._impl + 6) = v10;
    *((_DWORD *)v14->super._impl + 5) = frameCapacity;
    *((_DWORD *)v14->super._impl + 4) = 0;
    if ((BYTE12(v19) & 0x20) != 0)
      v15 = 1;
    else
      v15 = HIDWORD(v20);
    *((_DWORD *)v14->super._impl + 7) = v15;
    impl = v13->super._impl;
    if (!impl[56] || impl[120])
      __assert_rtn("-[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]", "AVAudioBuffer.mm", 312, "_imp->OwnsMemory() && !_imp->_externalABL.has_value()");
  }
  return v13;
}

- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format bufferListNoCopy:(const AudioBufferList *)bufferList deallocator:(void *)deallocator
{
  const AudioStreamBasicDescription *v9;
  __int128 v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  unint64_t mNumberBuffers;
  int v15;
  UInt32 mDataByteSize;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  char *v21;
  char *v22;
  __objc2_prot_list *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  __objc2_prot_list *v27;
  UInt32 v28;
  __objc2_prot_list *v29;
  AVAudioPCMBuffer *v30;
  __objc2_prot_list *v32;
  int v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  __objc2_prot_list *v37;
  int v38;
  uint64_t v39;
  AVAudioPCMBuffer *v40;
  _BYTE *impl;
  NSObject *log;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[10];
  _BYTE v53[6];
  const char *v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = -[AVAudioFormat streamDescription](format, "streamDescription");
  v10 = *(_OWORD *)&v9->mBytesPerPacket;
  v44 = *(_OWORD *)&v9->mSampleRate;
  v45 = v10;
  v46 = *(_QWORD *)&v9->mBitsPerChannel;
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v48 = "AVAEInternal.h";
      v49 = 1024;
      v50 = 71;
      v51 = 2080;
      *(_QWORD *)v52 = "AVAudioBuffer.mm";
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = 320;
      *(_WORD *)&v53[4] = 2080;
      v54 = "-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]";
      v55 = 2080;
      v56 = "isPCMFormat(fmt)";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "isPCMFormat(fmt)");
  }
  if (!bufferList)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v48 = "AVAEInternal.h";
      v49 = 1024;
      v50 = 71;
      v51 = 2080;
      *(_QWORD *)v52 = "AVAudioBuffer.mm";
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = 321;
      *(_WORD *)&v53[4] = 2080;
      v54 = "-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]";
      v55 = 2080;
      v56 = "bufferList != nullptr";
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "bufferList != nullptr");
  }
  v13 = DWORD2(v45);
  if (!DWORD2(v45))
  {
    v23 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136315394;
    v48 = "AVAudioBuffer.mm";
    v49 = 1024;
    v50 = 324;
    v24 = "%25s:%-5d format has zero bytes per frame";
    goto LABEL_33;
  }
  mNumberBuffers = bufferList->mNumberBuffers;
  if (!(_DWORD)mNumberBuffers)
  {
    v23 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136315394;
    v48 = "AVAudioBuffer.mm";
    v49 = 1024;
    v50 = 242;
    v24 = "%25s:%-5d the number of buffers is 0";
LABEL_33:
    v25 = v23;
    v26 = 18;
    goto LABEL_38;
  }
  if ((BYTE12(v44) & 0x20) != 0)
    v15 = HIDWORD(v45);
  else
    v15 = 1;
  if ((_DWORD)mNumberBuffers != v15)
  {
    v27 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v28 = bufferList->mNumberBuffers;
    *(_DWORD *)buf = 136315906;
    v48 = "AVAudioBuffer.mm";
    v49 = 1024;
    v50 = 249;
    v51 = 1024;
    *(_DWORD *)v52 = v28;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v15;
    v24 = "%25s:%-5d the number of buffers (%u) does not match the format's number of channel streams (%u)";
    v25 = v27;
    v26 = 30;
LABEL_38:
    _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
    goto LABEL_39;
  }
  mDataByteSize = bufferList->mBuffers[0].mDataByteSize;
  if (!mDataByteSize)
  {
    v29 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "AVAudioBuffer.mm";
      v49 = 1024;
      v50 = 256;
      v51 = 1024;
      *(_DWORD *)v52 = 0;
      v24 = "%25s:%-5d mBuffers[0].mDataByteSize (%u) should be non-zero";
      v25 = v29;
      v26 = 24;
      goto LABEL_38;
    }
LABEL_39:

    return 0;
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  if ((BYTE12(v44) & 0x20) != 0)
    v20 = 1;
  else
    v20 = HIDWORD(v45);
  while (1)
  {
    if (v17 * 16)
    {
      v21 = (char *)bufferList + v17 * 16;
      if (bufferList->mBuffers[v17].mDataByteSize != mDataByteSize)
        break;
    }
    v22 = (char *)bufferList + v17 * 16;
    if (bufferList->mBuffers[v17].mNumberChannels != v20)
    {
      v32 = gAVAudioBufferLog();
      if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v33 = *((_DWORD *)v22 + 2);
      *(_DWORD *)buf = 136316162;
      v48 = "AVAudioBuffer.mm";
      v49 = 1024;
      v50 = 271;
      v51 = 1024;
      *(_DWORD *)v52 = v18;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v33;
      *(_WORD *)v53 = 1024;
      *(_DWORD *)&v53[2] = v20;
      v34 = "%25s:%-5d mBuffers[%d].mNumberChannels (%u) does not match the format's number of interleaved channels (%u)";
      v35 = v32;
      v36 = 36;
      goto LABEL_47;
    }
    if (!*((_QWORD *)v22 + 2))
    {
      v37 = gAVAudioBufferLog();
      if (!os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_DWORD *)buf = 136315650;
      v48 = "AVAudioBuffer.mm";
      v49 = 1024;
      v50 = 274;
      v51 = 1024;
      *(_DWORD *)v52 = v18;
      v34 = "%25s:%-5d mBuffers[%u].mData is null";
      v35 = v37;
      v36 = 24;
      goto LABEL_47;
    }
    v19 = ++v18 >= mNumberBuffers;
    if (mNumberBuffers == ++v17)
      goto LABEL_49;
  }
  log = gAVAudioBufferLog();
  if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    goto LABEL_48;
  v38 = *((_DWORD *)v21 + 3);
  *(_DWORD *)buf = 136316418;
  v48 = "AVAudioBuffer.mm";
  v49 = 1024;
  v50 = 266;
  v51 = 1024;
  *(_DWORD *)v52 = v18;
  *(_WORD *)&v52[4] = 1024;
  *(_DWORD *)&v52[6] = v38;
  *(_WORD *)v53 = 1024;
  *(_DWORD *)&v53[2] = v18 - 1;
  LOWORD(v54) = 1024;
  *(_DWORD *)((char *)&v54 + 2) = mDataByteSize;
  v34 = "%25s:%-5d mBuffers[%u].mDataByteSize (%u) does not match the previous mBuffers[%u].mDataByteSize (%u)";
  v35 = log;
  v36 = 42;
LABEL_47:
  _os_log_impl(&dword_19B733000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
LABEL_48:
  if (!v19)
    goto LABEL_39;
LABEL_49:
  v39 = bufferList->mBuffers[0].mDataByteSize;
  v43.receiver = self;
  v43.super_class = (Class)AVAudioPCMBuffer;
  v40 = -[AVAudioBuffer initWithPCMFormat:byteCapacity:bufferListNoCopy:deallocator:](&v43, sel_initWithPCMFormat_byteCapacity_bufferListNoCopy_deallocator_, format, v39, bufferList, deallocator);
  v30 = v40;
  if (v40)
  {
    *((_QWORD *)v40->super._impl + 1) = 0;
    *((_DWORD *)v40->super._impl + 6) = v13;
    *((_DWORD *)v40->super._impl + 5) = v39 / v13;
    *((_DWORD *)v40->super._impl + 4) = v39 / v13;
    *((_DWORD *)v40->super._impl + 7) = v20;
    impl = v30->super._impl;
    if (impl[56] || !impl[120])
      __assert_rtn("-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]", "AVAudioBuffer.mm", 347, "!_imp->OwnsMemory() && _imp->_externalABL.has_value()");
  }
  return v30;
}

- (AVAudioFrameCount)frameCapacity
{
  return *((_DWORD *)self->super._impl + 5);
}

- (AVAudioFrameCount)frameLength
{
  return *((_DWORD *)self->super._impl + 4);
}

- (void)setByteLength:(unsigned int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioPCMBuffer;
  -[AVAudioBuffer setByteLength:](&v5, sel_setByteLength_);
  *((_DWORD *)self->super._impl + 4) = a3 / *((_DWORD *)self->super._impl + 6);
}

- (void)setFrameLength:(AVAudioFrameCount)frameLength
{
  _DWORD *impl;
  NSObject *v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  impl = self->super._impl;
  if (impl[5] < frameLength)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "AVAEInternal.h";
      v11 = 1024;
      v12 = 71;
      v13 = 2080;
      v14 = "AVAudioBuffer.mm";
      v15 = 1024;
      v16 = 364;
      v17 = 2080;
      v18 = "-[AVAudioPCMBuffer setFrameLength:]";
      v19 = 2080;
      v20 = "length <= _imp->_frameCapacity";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "length <= _imp->_frameCapacity");
    impl = self->super._impl;
  }
  v7 = impl[6] * frameLength;
  v8.receiver = self;
  v8.super_class = (Class)AVAudioPCMBuffer;
  -[AVAudioBuffer setByteLength:](&v8, sel_setByteLength_, v7);
  *((_DWORD *)self->super._impl + 4) = frameLength;
}

- (NSUInteger)stride
{
  return *((int *)self->super._impl + 7);
}

- (void)_initChannelPtrs
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *impl;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v3 = objc_msgSend(*(id *)self->super._impl, "streamDescription");
  v4 = *(unsigned int *)(v3 + 28);
  if ((_DWORD)v4)
  {
    v5 = *(_DWORD *)(v3 + 12);
    *((_QWORD *)self->super._impl + 1) = malloc_type_calloc(*(unsigned int *)(v3 + 28), 8uLL, 0x80040B8603338uLL);
    if ((v5 & 0x20) != 0)
    {
      v8 = 0;
      v9 = 16;
      do
      {
        impl = self->super._impl;
        if (*((_BYTE *)impl + 56))
          v11 = impl[6] + 48;
        else
          v11 = impl[12];
        *(_QWORD *)(impl[1] + v8) = *(_QWORD *)(v11 + v9);
        v8 += 8;
        v9 += 16;
      }
      while (8 * v4 != v8);
    }
    else
    {
      v6 = self->super._impl;
      if (*((_BYTE *)v6 + 56))
        v7 = v6[6] + 48;
      else
        v7 = v6[12];
      v12 = *((_DWORD *)v6 + 6);
      *(_QWORD *)v6[1] = *(_QWORD *)(v7 + 16);
      if (v4 >= 2)
      {
        v13 = 0;
        v14 = v12 / v4;
        do
        {
          v15 = (_QWORD *)(*((_QWORD *)self->super._impl + 1) + v13);
          v15[1] = *v15 + v14;
          v13 += 8;
        }
        while (8 * v4 - 8 != v13);
      }
    }
  }
}

- (float)floatChannelData
{
  void *impl;
  float *const *result;

  impl = self->super._impl;
  if (*((_DWORD *)impl + 8))
    return 0;
  result = (float *const *)*((_QWORD *)impl + 1);
  if (!result)
  {
    -[AVAudioPCMBuffer _initChannelPtrs](self, "_initChannelPtrs");
    return (float *const *)*((_QWORD *)self->super._impl + 1);
  }
  return result;
}

- (int32_t)int32ChannelData
{
  void *impl;
  int32_t *const *result;

  impl = self->super._impl;
  if (*((_DWORD *)impl + 8) != 2)
    return 0;
  result = (int32_t *const *)*((_QWORD *)impl + 1);
  if (!result)
  {
    -[AVAudioPCMBuffer _initChannelPtrs](self, "_initChannelPtrs");
    return (int32_t *const *)*((_QWORD *)self->super._impl + 1);
  }
  return result;
}

- (int16_t)int16ChannelData
{
  void *impl;
  int16_t *const *result;

  impl = self->super._impl;
  if (*((_DWORD *)impl + 8) != 1)
    return 0;
  result = (int16_t *const *)*((_QWORD *)impl + 1);
  if (!result)
  {
    -[AVAudioPCMBuffer _initChannelPtrs](self, "_initChannelPtrs");
    return (int16_t *const *)*((_QWORD *)self->super._impl + 1);
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVAudioPCMBuffer *v4;
  _QWORD *impl;
  _QWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:](+[AVAudioPCMBuffer allocWithZone:](AVAudioPCMBuffer, "allocWithZone:", a3), "initWithPCMFormat:frameCapacity:", *(_QWORD *)self->super._impl, *((unsigned int *)self->super._impl + 10));
  impl = v4->super._impl;
  v6 = self->super._impl;
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
    v6 = self->super._impl;
  }
  *((_DWORD *)impl + 4) = *((_DWORD *)v6 + 4);
  return v4;
}

- (BOOL)appendDataFromBuffer:(id)a3
{
  return -[AVAudioPCMBuffer appendDataFromBuffer:channel:](self, "appendDataFromBuffer:channel:", a3, -1);
}

- (BOOL)appendDataFromBuffer:(id)a3 channel:(int64_t)a4
{
  _QWORD *impl;
  uint64_t v8;
  _DWORD *v9;
  AVAudioFrameCount v10;
  int v11;
  AVAudioFrameCount v12;
  AVAudioFrameCount v13;
  AVAudioFrameCount v14;
  unsigned int v15;
  AVAudioFrameCount v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  AVAudioFrameCount v21;
  unsigned int v22;
  unsigned int v23;
  AVAudioChannelCount v24;
  double v25;
  double v26;
  double v27;
  int v28;
  AVAudioChannelCount v29;
  AVAudioFrameCount v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  BOOL v34;

  impl = self->super._impl;
  if (*((_BYTE *)impl + 56))
    v8 = impl[6] + 48;
  else
    v8 = impl[12];
  v9 = (_DWORD *)objc_msgSend(a3, "audioBufferList");
  v10 = -[AVAudioPCMBuffer frameLength](self, "frameLength");
  v11 = *((_DWORD *)self->super._impl + 6);
  v12 = -[AVAudioPCMBuffer frameCapacity](self, "frameCapacity");
  v13 = v12 - -[AVAudioPCMBuffer frameLength](self, "frameLength");
  v14 = -[AVAudioPCMBuffer frameLength](self, "frameLength");
  v15 = objc_msgSend(a3, "frameLength") + v14;
  v16 = v13;
  if (v15 <= -[AVAudioPCMBuffer frameCapacity](self, "frameCapacity"))
    v16 = objc_msgSend(a3, "frameLength");
  v17 = v11 * v10;
  if (-[AVAudioFormat isEqual:](-[AVAudioBuffer format](self, "format"), "isEqual:", objc_msgSend(a3, "format"))
    || (v24 = -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"),
        v24 == objc_msgSend((id)objc_msgSend(a3, "format"), "channelCount"))
    && (-[AVAudioFormat sampleRate](-[AVAudioBuffer format](self, "format"), "sampleRate"),
        v26 = v25,
        objc_msgSend((id)objc_msgSend(a3, "format"), "sampleRate"),
        v26 == v27)
    && (v28 = (int)-[AVAudioFormat streamDescription](-[AVAudioBuffer format](self, "format"), "streamDescription")[8],
        v28 == *(_DWORD *)(objc_msgSend((id)objc_msgSend(a3, "format"), "streamDescription") + 8)))
  {
    if (*v9)
    {
      v18 = 0;
      v19 = 0;
      v20 = v8 + 16;
      do
      {
        v21 = -[AVAudioPCMBuffer frameLength](self, "frameLength");
        v22 = objc_msgSend(a3, "frameLength") + v21;
        if (v22 <= -[AVAudioPCMBuffer frameCapacity](self, "frameCapacity"))
          v23 = v9[v18 + 3];
        else
          v23 = *((_DWORD *)self->super._impl + 6) * v13;
        memcpy((void *)(*(_QWORD *)(v20 + v18 * 4) + v17), *(const void **)&v9[v18 + 4], v23);
        ++v19;
        v18 += 4;
      }
      while (v19 < *v9);
    }
    goto LABEL_25;
  }
  v29 = -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount");
  if ((a4 & 0x8000000000000000) == 0
    && v29 == 1
    && objc_msgSend((id)objc_msgSend(a3, "format"), "channelCount") > (unint64_t)a4)
  {
    v30 = -[AVAudioPCMBuffer frameLength](self, "frameLength");
    v31 = objc_msgSend(a3, "frameLength") + v30;
    if (v31 <= -[AVAudioPCMBuffer frameCapacity](self, "frameCapacity"))
      v32 = v9[4 * a4 + 3];
    else
      v32 = *((_DWORD *)self->super._impl + 6) * v13;
    memcpy((void *)(*(_QWORD *)(v8 + 16) + v17), *(const void **)&v9[4 * a4 + 4], v32);
LABEL_25:
    v33 = -[AVAudioPCMBuffer frameLength](self, "frameLength") + v16;
    v34 = 1;
    goto LABEL_26;
  }
  v33 = -[AVAudioPCMBuffer frameLength](self, "frameLength");
  v34 = 0;
LABEL_26:
  -[AVAudioPCMBuffer setFrameLength:](self, "setFrameLength:", v33);
  return v34;
}

- (id)splitIntoSingleChannelBuffers
{
  id v3;
  unint64_t v5;
  AVAudioFormat *v6;
  AVAudioFormat *v7;
  AVAudioPCMBuffer *v8;

  if (-[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount") < 2
    || -[AVAudioFormat isInterleaved](-[AVAudioBuffer format](self, "format"), "isInterleaved"))
  {
    return 0;
  }
  v3 = (id)objc_opt_new();
  if (-[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"))
  {
    v5 = 0;
    do
    {
      v6 = [AVAudioFormat alloc];
      -[AVAudioFormat sampleRate](-[AVAudioBuffer format](self, "format"), "sampleRate");
      v7 = -[AVAudioFormat initStandardFormatWithSampleRate:channels:](v6, "initStandardFormatWithSampleRate:channels:", 1);
      v8 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]([AVAudioPCMBuffer alloc], "initWithPCMFormat:frameCapacity:", v7, -[AVAudioPCMBuffer frameLength](self, "frameLength"));

      -[AVAudioPCMBuffer appendDataFromBuffer:channel:](v8, "appendDataFromBuffer:channel:", self, v5);
      objc_msgSend(v3, "addObject:", v8);

      ++v5;
    }
    while (v5 < -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"));
  }
  return v3;
}

- (NSArray)averagePowerPerChannel
{
  return (NSArray *)-[AVAudioPCMBuffer calculatePower:](self, "calculatePower:", 1);
}

- (NSArray)peakPowerPerChannel
{
  return (NSArray *)-[AVAudioPCMBuffer calculatePower:](self, "calculatePower:", 0);
}

- (id)calculatePower:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  float *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  float v14;
  float __B;

  v5 = (id)objc_opt_new();
  if (!-[AVAudioPCMBuffer floatChannelData](self, "floatChannelData"))
  {
    if (-[AVAudioPCMBuffer int16ChannelData](self, "int16ChannelData"))
    {
      v8 = (float *)malloc_type_malloc(4 * -[AVAudioPCMBuffer frameLength](self, "frameLength"), 0x100004052888210uLL);
      if (-[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"))
      {
        v9 = 0;
        do
        {
          vDSP_vflt16(-[AVAudioPCMBuffer int16ChannelData](self, "int16ChannelData")[8 * v9], -[AVAudioPCMBuffer stride](self, "stride"), v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          __B = 32767.0;
          vDSP_vsdiv(v8, -[AVAudioPCMBuffer stride](self, "stride"), &__B, v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          v10 = (void *)MEMORY[0x1E0CB37E8];
          -[AVAudioPCMBuffer calculatePower:forFloatData:stride:frameLength:](self, "calculatePower:forFloatData:stride:frameLength:", a3, v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "numberWithFloat:"));
          ++v9;
        }
        while (v9 < -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"));
      }
    }
    else
    {
      if (!-[AVAudioPCMBuffer int32ChannelData](self, "int32ChannelData"))
        return v5;
      v8 = (float *)malloc_type_malloc(4 * -[AVAudioPCMBuffer frameLength](self, "frameLength"), 0x100004052888210uLL);
      if (-[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"))
      {
        v11 = 0;
        do
        {
          vDSP_vflt32(-[AVAudioPCMBuffer int32ChannelData](self, "int32ChannelData")[8 * v11], -[AVAudioPCMBuffer stride](self, "stride"), v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          v14 = 2147500000.0;
          vDSP_vsdiv(v8, -[AVAudioPCMBuffer stride](self, "stride"), &v14, v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          v12 = (void *)MEMORY[0x1E0CB37E8];
          -[AVAudioPCMBuffer calculatePower:forFloatData:stride:frameLength:](self, "calculatePower:forFloatData:stride:frameLength:", a3, v8, -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
          objc_msgSend(v5, "addObject:", objc_msgSend(v12, "numberWithFloat:"));
          ++v11;
        }
        while (v11 < -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"));
      }
    }
    free(v8);
    return v5;
  }
  if (-[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[AVAudioPCMBuffer calculatePower:forFloatData:stride:frameLength:](self, "calculatePower:forFloatData:stride:frameLength:", a3, -[AVAudioPCMBuffer floatChannelData](self, "floatChannelData")[8 * v6], -[AVAudioPCMBuffer stride](self, "stride"), -[AVAudioPCMBuffer frameLength](self, "frameLength"));
      objc_msgSend(v5, "addObject:", objc_msgSend(v7, "numberWithFloat:"));
      ++v6;
    }
    while (v6 < -[AVAudioFormat channelCount](-[AVAudioBuffer format](self, "format"), "channelCount"));
  }
  return v5;
}

- (float)calculatePower:(unint64_t)a3 forFloatData:(float *)a4 stride:(int64_t)a5 frameLength:(unsigned int)a6
{
  float result;
  float v7;
  float v8;
  float __C;

  if (a3 == 1)
  {
    v8 = 0.0;
    vDSP_rmsqv(a4, a5, &v8, a6);
    v7 = v8;
  }
  else
  {
    if (a3)
      return result;
    __C = 0.0;
    vDSP_maxv(a4, a5, &__C, a6);
    v7 = __C;
  }
  if (v7 < 0.00000001)
    v7 = 0.00000001;
  return log10f(v7) * 20.0;
}

@end
