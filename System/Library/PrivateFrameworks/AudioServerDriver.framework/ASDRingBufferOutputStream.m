@implementation ASDRingBufferOutputStream

- (ASDRingBufferOutputStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnavailableMethod"), CFSTR("Method is unavailable"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (ASDRingBufferOutputStream)initWithRingBuffer:(id)a3 withPlugin:(id)a4
{
  id v7;
  ASDRingBufferOutputStream *v8;
  ASDRingBufferOutputStream *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDRingBufferOutputStream;
  v8 = -[ASDStream initWithDirection:withPlugin:](&v11, sel_initWithDirection_withPlugin_, 1869968496, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_ringBuffer, a3);

  return v9;
}

- (void)startStream
{
  void *v3;
  void *v5;
  objc_super v6;

  if (!self->_bufferList.__ptr_.__value_)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDRingBufferStream.mm"), 47, CFSTR("Format must be set before starting stream"));

  }
  v6.receiver = self;
  v6.super_class = (Class)ASDRingBufferOutputStream;
  -[ASDStream startStream](&v6, sel_startStream);
  -[ASDRingBufferOutputStream ringBuffer](self, "ringBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWriter");

}

- (void)stopStream
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDRingBufferOutputStream;
  -[ASDStream stopStream](&v4, sel_stopStream);
  -[ASDRingBufferOutputStream ringBuffer](self, "ringBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopWriter");

}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  const CAStreamBasicDescription *v7;
  ASDBufferList *value;
  AudioStreamBasicDescription v9;
  objc_super v10;
  char v11[16];
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDRingBufferOutputStream;
  -[ASDStream setPhysicalFormat:](&v10, sel_setPhysicalFormat_, v4);
  if (v4)
    objc_msgSend(v4, "audioStreamBasicDescription");
  else
    memset(&v9, 0, sizeof(v9));
  v5 = operator new();
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v11, &v9);
  v6 = v12;
  *(_OWORD *)v5 = *(_OWORD *)v11;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = v13;
  *(_QWORD *)(v5 + 40) = CABufferList::New((CABufferList *)"", v11, v7);
  value = self->_bufferList.__ptr_.__value_;
  self->_bufferList.__ptr_.__value_ = (ASDBufferList *)v5;
  if (value)
    std::default_delete<ASDBufferList>::operator()[abi:ne180100]((uint64_t)&self->_bufferList, (uint64_t)value);
  -[ASDRingBuffer setWriteFormat:](self->_ringBuffer, "setWriteFormat:", v4, *(_OWORD *)&v9.mSampleRate, *(_OWORD *)&v9.mBytesPerPacket, *(_QWORD *)&v9.mBitsPerChannel);

}

- (id)writeMixBlock
{
  void *v3;
  _QWORD v5[6];
  _QWORD v6[4];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6;
  v7[4] = __Block_byref_object_dispose__6;
  -[ASDRingBuffer writeBlock](self->_ringBuffer, "writeBlock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = &self->_bufferList;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ASDRingBufferOutputStream_writeMixBlock__block_invoke;
  v5[3] = &unk_24DBCA818;
  v5[4] = v6;
  v5[5] = v7;
  v3 = (void *)MEMORY[0x220733498](v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);

  return v3;
}

uint64_t __42__ASDRingBufferOutputStream_writeMixBlock__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v5;
  ASDBufferList *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  int v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = 2003329396;
  v6 = **(ASDBufferList ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v6)
  {
    ASDBufferList::setBufferListFromData(v6, a4, a2);
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
    if ((v7 + 2) > 6)
    {
      if (CALog_DefaultScope)
      {
        v9 = *(id *)CALog_DefaultScope;
      }
      else
      {
        v9 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315650;
        v14 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        v15 = 1024;
        v16 = 104;
        v17 = 2080;
        v18 = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
        _os_log_impl(&dword_219C60000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s: Unknown audio ring buffer error", (uint8_t *)&v13, 0x1Cu);
      }
      goto LABEL_17;
    }
    v8 = 1 << (v7 + 2);
    if ((v8 & 0x1B) == 0)
    {
      if ((v8 & 0x60) != 0)
      {
        if (CALog_DefaultScope)
        {
          v9 = *(id *)CALog_DefaultScope;
        }
        else
        {
          v9 = MEMORY[0x24BDACB70];
          v10 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v13 = 136315906;
          v14 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
          v15 = 1024;
          v16 = 100;
          v17 = 2080;
          v18 = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
          v19 = 1024;
          v20 = v7;
          _os_log_impl(&dword_219C60000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s: Audio ring buffer error %d", (uint8_t *)&v13, 0x22u);
        }
LABEL_17:

        return v5;
      }
      return 0;
    }
  }
  return v5;
}

- (ASDManagedRingBuffer)ringBuffer
{
  return self->_ringBuffer;
}

- (void).cxx_destruct
{
  ASDBufferList *value;

  objc_storeStrong((id *)&self->_ringBuffer, 0);
  value = self->_bufferList.__ptr_.__value_;
  self->_bufferList.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<ASDBufferList>::operator()[abi:ne180100]((uint64_t)&self->_bufferList, (uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = 0;
  return self;
}

@end
