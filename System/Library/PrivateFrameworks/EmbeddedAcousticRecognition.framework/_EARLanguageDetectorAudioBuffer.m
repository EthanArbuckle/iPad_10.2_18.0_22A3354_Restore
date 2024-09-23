@implementation _EARLanguageDetectorAudioBuffer

- (id)_initWithAudioBuffer:(const void *)a3
{
  _EARLanguageDetectorAudioBuffer *v4;
  _EARLanguageDetectorAudioBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_EARLanguageDetectorAudioBuffer;
  v4 = -[_EARLanguageDetectorAudioBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->_buffer.__ptr_, (uint64_t *)a3);
  return v5;
}

- (void)addAudioSampleData:(id)a3
{
  id v4;

  v4 = objc_retainAutorelease(a3);
  (*(void (**)(RecogAudioBuffer *, uint64_t, unint64_t))(*(_QWORD *)self->_buffer.__ptr_ + 16))(self->_buffer.__ptr_, objc_msgSend(v4, "bytes"), (unint64_t)objc_msgSend(v4, "length") >> 1);

}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  (*(void (**)(RecogAudioBuffer *, const signed __int16 *, unint64_t))(*(_QWORD *)self->_buffer.__ptr_
                                                                                       + 16))(self->_buffer.__ptr_, a3, a4);
}

- (void)endAudio
{
  (*(void (**)(RecogAudioBuffer *))(*(_QWORD *)self->_buffer.__ptr_ + 32))(self->_buffer.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_buffer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
