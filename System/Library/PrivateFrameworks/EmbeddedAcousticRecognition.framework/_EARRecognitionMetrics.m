@implementation _EARRecognitionMetrics

- (_EARRecognitionMetrics)initWithRecognizer:(shared_ptr<quasar::SpeechRecognizer>)a3
{
  SpeechRecognizer *ptr;
  _EARRecognitionMetrics *v4;
  _EARRecognitionMetrics *v5;
  uint64_t v6;
  SpeechRecognizer *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  NSMutableArray *v11;
  NSMutableArray *allItnRunIntervals;
  objc_super v14;

  ptr = a3.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)_EARRecognitionMetrics;
  v4 = -[_EARRecognitionMetrics init](&v14, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v7 = *(SpeechRecognizer **)ptr;
    v6 = *((_QWORD *)ptr + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 16);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_recognizer.__cntrl_;
    v5->_recognizer.__ptr_ = v7;
    v5->_recognizer.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allItnRunIntervals = v5->_allItnRunIntervals;
    v5->_allItnRunIntervals = v11;

  }
  return v5;
}

- (void)addPauseDurationMetric
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v4;
  SpeechRecognizer *ptr;
  NSArray *v6;
  NSArray *v7;
  NSArray *pauseDurations;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *__p[3];
  SpeechRecognizer *v12;
  std::__shared_weak_count *v13;

  v12 = 0;
  v13 = 0;
  cntrl = self->_recognizer.__cntrl_;
  if (!cntrl)
  {
    v4 = 0;
    goto LABEL_7;
  }
  v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  v13 = v4;
  if (!v4 || (ptr = self->_recognizer.__ptr_, (v12 = ptr) == 0))
  {
LABEL_7:
    pauseDurations = self->_pauseDurations;
    self->_pauseDurations = (NSArray *)MEMORY[0x1E0C9AA60];

    if (!v4)
      return;
    goto LABEL_8;
  }
  quasar::SpeechRecognizer::getPauseDurations((quasar::SpeechRecognizer *)ptr, __p);
  EARHelpers::VectorToArray<float>((uint64_t)__p);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_pauseDurations;
  self->_pauseDurations = v6;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_8:
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

- (void)addEmojiRecognitionMetrics:(id)a3 recognizedEmojis:(id)a4
{
  NSArray *v6;
  NSNumber *v7;
  NSNumber *itnDurationInNs;
  void *v9;
  void *v10;
  void *v11;
  NSArray *recognizedEmojis;
  id v13;

  v13 = a3;
  v6 = (NSArray *)a4;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("itnDurationInNs"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  itnDurationInNs = self->_itnDurationInNs;
  self->_itnDurationInNs = v7;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isEmojiPersonalizationUsed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isEmojiPersonalizationUsed = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isEmojiDisambiguationUsed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isEmojiDisambiguationUsed = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isEmojiExpectedButNotRecognized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isEmojiExpectedButNotRecognized = objc_msgSend(v11, "BOOLValue");

  recognizedEmojis = self->_recognizedEmojis;
  self->_recognizedEmojis = v6;

}

- (void)addItnRunIntervals:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_allItnRunIntervals, "addObjectsFromArray:", a3);
}

- (NSMutableArray)allItnRunIntervals
{
  return self->_allItnRunIntervals;
}

- (void)setAllItnRunIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)pauseDurations
{
  return self->_pauseDurations;
}

- (NSNumber)itnDurationInNs
{
  return self->_itnDurationInNs;
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_itnDurationInNs, 0);
  objc_storeStrong((id *)&self->_pauseDurations, 0);
  objc_storeStrong((id *)&self->_allItnRunIntervals, 0);
  cntrl = self->_recognizer.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
