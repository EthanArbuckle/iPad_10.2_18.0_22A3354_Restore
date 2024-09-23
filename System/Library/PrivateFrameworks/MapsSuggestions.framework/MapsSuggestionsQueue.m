@implementation MapsSuggestionsQueue

- (id)initSerialQueueWithName:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  dispatch_queue_t *v7;
  dispatch_queue_t *v8;
  id *v9;
  MapsSuggestionsQueue *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)MapsSuggestionsQueue;
    -[MapsSuggestionsQueue self](&v13, sel_self);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (dispatch_queue_t *)operator new();
      v8 = MSg::Queue::Queue(v7, v4, v6);
      v9 = (id *)v5[1];
      v5[1] = v8;
      if (v9)
        std::default_delete<MSg::Queue>::operator()[abi:ne180100](v9);

    }
    self = v5;
    v10 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.mm";
      v16 = 1024;
      v17 = 28;
      v18 = 2082;
      v19 = "-[MapsSuggestionsQueue initSerialQueueWithName:]";
      v20 = 2082;
      v21 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)serialQueueWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initSerialQueueWithName:", v4);

  return v5;
}

- (NSString)uniqueName
{
  return self->_cppQueue.__ptr_.__value_->_name;
}

- (OS_dispatch_queue)innerQueue
{
  return self->_cppQueue.__ptr_.__value_->_innerQueue;
}

- (void)syncBlock:(id)a3
{
  MSg::Queue::syncIfDifferent((NSObject **)self->_cppQueue.__ptr_.__value_, a3);
}

- (id)syncReturningBlock:(id)a3
{
  Queue *value;
  id v4;
  NSObject *innerQueue;
  void (**v6)(_QWORD);
  const char *label;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  value = self->_cppQueue.__ptr_.__value_;
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__14;
  v25 = __Block_byref_object_dispose__14;
  v26 = 0;
  innerQueue = value->_innerQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___ZNK3MSg5Queue15syncIfDifferentIU8__strongP11objc_objectEET_U13block_pointerFS5_vE_block_invoke;
  v18[3] = &unk_1E4BCDE48;
  v20 = &v21;
  v6 = (void (**)(_QWORD))v4;
  v19 = v6;
  label = dispatch_queue_get_label(innerQueue);
  v8 = dispatch_queue_get_label(0);
  if (label == v8)
  {
    v13 = (void *)MEMORY[0x1A859CDD8](v8, v9, v10, v11);
    v6[2](v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v22[5];
    v22[5] = v14;

    objc_autoreleasePoolPop(v13);
    v12 = v6;
  }
  else
  {
    dispatch_sync(innerQueue, v18);
    v12 = v19;
  }
  v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v16;
}

- (BOOL)syncBOOLReturningBlock:(id)a3
{
  Queue *value;
  id v4;
  NSObject *innerQueue;
  uint64_t (**v6)(_QWORD);
  const char *label;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  _QWORD v17[4];
  uint64_t (**v18)(_QWORD);
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  value = self->_cppQueue.__ptr_.__value_;
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  innerQueue = value->_innerQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___ZNK3MSg5Queue15syncIfDifferentIbEET_U13block_pointerFS2_vE_block_invoke;
  v17[3] = &unk_1E4BCDE48;
  v19 = &v20;
  v6 = (uint64_t (**)(_QWORD))v4;
  v18 = v6;
  label = dispatch_queue_get_label(innerQueue);
  v8 = dispatch_queue_get_label(0);
  if (label == v8)
  {
    v13 = (void *)MEMORY[0x1A859CDD8](v8, v9, v10, v11);
    v14 = v6[2](v6);
    *((_BYTE *)v21 + 24) = v14;
    objc_autoreleasePoolPop(v13);
    v12 = v6;
  }
  else
  {
    dispatch_sync(innerQueue, v17);
    v12 = v18;
  }
  v15 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (void)asyncBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_cppQueue.__ptr_.__value_->_innerQueue, a3);
}

- (void).cxx_destruct
{
  Queue *value;

  value = self->_cppQueue.__ptr_.__value_;
  self->_cppQueue.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<MSg::Queue>::operator()[abi:ne180100]((id *)&value->_innerQueue);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
