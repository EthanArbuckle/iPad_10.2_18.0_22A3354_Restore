@implementation _EARSpeechRecognitionAudioBuffer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (id)_initWithAudioBuffer:(shared_ptr<quasar:(id)a4 :RecogAudioBufferBase>)a3 speechRecognizer:
{
  uint64_t *ptr;
  __shared_weak_count *v6;
  _EARSpeechRecognitionAudioBuffer *v7;
  _EARSpeechRecognitionAudioBuffer *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  ptr = (uint64_t *)a3.__ptr_;
  v6 = a3.__cntrl_;
  v12.receiver = self;
  v12.super_class = (Class)_EARSpeechRecognitionAudioBuffer;
  v7 = -[_EARSpeechRecognitionAudioBuffer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v7->_buffer.__ptr_, ptr);
    v9 = dispatch_queue_create("com.apple.siri._EARSpeechRecognitionAudioBuffer", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_speechRecognizer, v6);
  }

  return v8;
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 2 * a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionAudioBuffer addAudioSampleData:](self, "addAudioSampleData:");

}

- (void)addAudioSampleData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55___EARSpeechRecognitionAudioBuffer_addAudioSampleData___block_invoke;
  v7[3] = &unk_1E5D47110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___EARSpeechRecognitionAudioBuffer_endAudio__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)triggerServerSideEndPointer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___EARSpeechRecognitionAudioBuffer_triggerServerSideEndPointer__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelRecognition
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___EARSpeechRecognitionAudioBuffer_cancelRecognition__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)stopAudioDecoding
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___EARSpeechRecognitionAudioBuffer_stopAudioDecoding__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setUnderlyingBuffer:(shared_ptr<quasar::RecogAudioBufferBase>)a3
{
  NSObject *queue;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD block[6];
  std::__shared_weak_count *v13;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __57___EARSpeechRecognitionAudioBuffer__setUnderlyingBuffer___block_invoke;
  block[3] = &unk_1E5D46958;
  v6 = *(_QWORD *)a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  block[4] = self;
  block[5] = v6;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  dispatch_async(queue, block);
  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (void)_detachFromRecognizer
{
  objc_storeWeak((id *)&self->_speechRecognizer, 0);
}

- (double)bufferedAudioDuration
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___EARSpeechRecognitionAudioBuffer_bufferedAudioDuration__block_invoke;
  v5[3] = &unk_1E5D47138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)consumedAudioDuration
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___EARSpeechRecognitionAudioBuffer_consumedAudioDuration__block_invoke;
  v5[3] = &unk_1E5D47138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)packetArrivalTimestampFromAudioTime:(float)a3
{
  NSObject *queue;
  unint64_t v4;
  _QWORD block[6];
  float v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___EARSpeechRecognitionAudioBuffer_packetArrivalTimestampFromAudioTime___block_invoke;
  block[3] = &unk_1E5D47480;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechRecognizer);
  objc_storeStrong((id *)&self->_queue, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_buffer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
