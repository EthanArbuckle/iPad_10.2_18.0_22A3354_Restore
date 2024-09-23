@implementation FTCinematicHighPriorityTrackerState

- (FTCinematicHighPriorityTrackerState)initWithTracker:(shared_ptr<ft:(shared_ptr<ft::Frame>)a4 :CinematicTracker>)a3 frame:
{
  __shared_weak_count *cntrl;
  CinematicTracker *ptr;
  FTCinematicHighPriorityTrackerState *v6;
  FTCinematicHighPriorityTrackerState *v7;
  uint64_t v8;
  CinematicTracker *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  Frame *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CGSize v22;
  FTCinematicHighPriorityTrackerState *v23;
  objc_super v25;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v25.receiver = self;
  v25.super_class = (Class)FTCinematicHighPriorityTrackerState;
  v6 = -[FTCinematicHighPriorityTrackerState init](&v25, sel_init, a3.__ptr_, a3.__cntrl_, a4.__ptr_, a4.__cntrl_);
  v7 = v6;
  if (v6)
  {
    v9 = *(CinematicTracker **)ptr;
    v8 = *((_QWORD *)ptr + 1);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (std::__shared_weak_count *)v6->_tracker.__cntrl_;
    v6->_tracker.__ptr_ = v9;
    v6->_tracker.__cntrl_ = (__shared_weak_count *)v8;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v16 = *(Frame **)cntrl;
    v15 = *((_QWORD *)cntrl + 1);
    if (v15)
    {
      v17 = (unint64_t *)(v15 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = (std::__shared_weak_count *)v7->_frame.__cntrl_;
    v7->_frame.__ptr_ = v16;
    v7->_frame.__cntrl_ = (__shared_weak_count *)v15;
    if (v19)
    {
      v20 = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v7->_targetRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v7->_targetRect.size = v22;
    *(_WORD *)&v7->_isTapToTrack = 0;
    -[FTCinematicHighPriorityTrackerState _setup](v7, "_setup");
    v23 = v7;
  }

  return v7;
}

- (void)_setup
{
  std::recursive_mutex *v3;

  v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v3);
  -[FTCinematicHighPriorityTrackerState _setupOp](self, "_setupOp");
  -[FTCinematicHighPriorityTrackerState _setupSessionStorage](self, "_setupSessionStorage");
  std::recursive_mutex::unlock(v3);
}

- (void)_setupSessionStorage
{
  int64_t op;
  CinematicTracker *v4;
  void *v5;
  id v6;
  CinematicTracker *ptr;
  void *v8;

  op = self->_op;
  if (op == 2)
    goto LABEL_6;
  if (op)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    ptr = self->_tracker.__ptr_;
    v8 = (void *)*((_QWORD *)ptr + 18);
    *((_QWORD *)ptr + 18) = v6;

LABEL_6:
    -[FTCinematicHighPriorityTrackerState setSessionStorage:](self, "setSessionStorage:", *((_QWORD *)self->_tracker.__ptr_ + 18));
    return;
  }
  v4 = self->_tracker.__ptr_;
  v5 = (void *)*((_QWORD *)v4 + 18);
  if (v5)
  {
    *((_QWORD *)v4 + 18) = 0;

  }
}

- (void)_setupOp
{
  uint64_t v3;
  CinematicTracker *ptr;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _BOOL4 v9;
  CGSize v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  std::runtime_error *exception;
  std::string *v15;
  __int128 v16;
  std::string v17;
  std::string v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v3 = ft::SiameseRpnSession::CurrentStage((ft::SiameseRpnSession *)((char *)self->_tracker.__ptr_ + 200));
  ptr = self->_tracker.__ptr_;
  v5 = *((_QWORD *)ptr + 19);
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 20);
  v19 = v5;
  v20 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  if (v5)
  {
    v9 = *(_BYTE *)(v5 + 8) & 1;
    self->_isTapToTrack = v9;
    if (v3 == 2)
    {
      self->_op = 2;
      if (!v6)
        return;
    }
    else
    {
      if (v3)
      {
        v13 = v3;
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::to_string(&v17, v13);
        v15 = std::string::insert(&v17, 0, "SiameseRPN at invalid stage: ");
        v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
        v18.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v16;
        v15->__r_.__value_.__l.__size_ = 0;
        v15->__r_.__value_.__r.__words[2] = 0;
        v15->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(exception, &v18);
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      if (v9)
      {
        self->_op = 3;
        if (!v6)
          return;
      }
      else
      {
        self->_op = 1;
        v10 = *(CGSize *)(v5 + 40);
        self->_targetRect.origin = *(CGPoint *)(v5 + 24);
        self->_targetRect.size = v10;
        if (!v6)
          return;
      }
    }
  }
  else
  {
    self->_op = 0;
    if (!v6)
      return;
  }
  v11 = (unint64_t *)&v6->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

- (CGRect)targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)exemplarInputRoiForTargetRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  std::recursive_mutex *v8;
  uint64_t *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  CGFloat v22;
  CGFloat v23;
  CGRect result;

  if ((self->_op | 2) == 3)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v8 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
    std::recursive_mutex::lock(v8);
    v9 = (uint64_t *)((char *)self->_tracker.__ptr_ + 200);
    v21.f64[0] = x;
    v21.f64[1] = y;
    v22 = width;
    v23 = height;
    v10 = ft::SiameseRpnSession::ComputeExemplarInputRect(v9, &v21);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    std::recursive_mutex::unlock(v8);
  }
  else
  {
    v10 = *MEMORY[0x24BDBF070];
    v12 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)instanceInputRoi
{
  std::recursive_mutex *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (self->_op == 2)
  {
    v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
    std::recursive_mutex::lock(v3);
    v4 = ft::SiameseRpnSession::ComputeInstanceInputRect((ft::SiameseRpnSession *)((char *)self->_tracker.__ptr_ + 200));
    v6 = v5;
    v8 = v7;
    v10 = v9;
    std::recursive_mutex::unlock(v3);
  }
  else
  {
    v4 = *MEMORY[0x24BDBF070];
    v6 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_unsafeMeanFillAndScaleSourceBuffer:(__CVBuffer *)a3 destinationBuffer:(__CVBuffer *)a4 sourceRect:(CGRect)a5 meanPixel:(id)a6 scaler:
{
  void *v6;
  unsigned int v7;
  double height;
  double width;
  double y;
  double x;
  id v14;
  size_t v15;
  size_t v16;
  size_t v17;
  ft *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  size_t v31;
  size_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  NSObject *v38;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;

  v7 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = v6;
  v15 = CVPixelBufferGetWidth(a3);
  v16 = CVPixelBufferGetHeight(a3);
  v17 = CVPixelBufferGetWidth(a3);
  v18 = (ft *)CVPixelBufferGetHeight(a3);
  v19 = (float)v15;
  v20 = x * v19;
  v21 = (float)v16;
  v22 = y * v21;
  v23 = width * v19;
  v24 = height * v21;
  v25 = (double)v17;
  v26 = (double)(unint64_t)v18;
  if (v20 >= 0.0)
    v27 = v20;
  else
    v27 = 0.0;
  if (v22 >= 0.0)
    v28 = v22;
  else
    v28 = 0.0;
  if (v20 + v23 <= v25)
    v25 = v20 + v23;
  if (v22 + v24 <= v26)
    v26 = v22 + v24;
  if (v25 <= v27)
    v29 = 0.0;
  else
    v29 = v25 - v27;
  if (v26 <= v28)
    v30 = 0.0;
  else
    v30 = v26 - v28;
  if (v29 <= 0.0 || v30 <= 0.0)
  {
    ft::GetOsLog(v18);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:].cold.1();

    v37 = 0;
  }
  else
  {
    CGAffineTransformMakeTranslation(&t1, -v20, -v22);
    v31 = CVPixelBufferGetWidth(a4);
    v32 = CVPixelBufferGetHeight(a4);
    CGAffineTransformMakeScale(&v40, (double)v31 / v23, (double)v32 / v24);
    CGAffineTransformConcat(&v42, &t1, &v40);
    v43.origin.x = v27;
    v43.origin.y = v28;
    v43.size.width = v29;
    v43.size.height = v30;
    v44 = CGRectApplyAffineTransform(v43, &v42);
    v33 = v44.origin.x;
    v34 = v44.origin.y;
    v35 = v44.size.width;
    v36 = v44.size.height;
    if (FTFillPixelBufferWithColor(a4, v7))
    {
      v37 = 0;
    }
    else
    {
      objc_msgSend(v14, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:", a3, a4, round(v27), round(v28), round(v29), round(v30), round(v33), round(v34), round(v35), round(v36));
      v37 = 1;
    }
  }

  return v37;
}

- (BOOL)preProcessExemplarInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 forTargetRect:(CGRect)a5 meanPixel:(id)a6 scaler:
{
  void *v6;
  double height;
  double width;
  double y;
  double x;
  id v15;
  std::recursive_mutex *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = v6;
  v16 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v16);
  -[FTCinematicHighPriorityTrackerState exemplarInputRoiForTargetRect:](self, "exemplarInputRoiForTargetRect:", x, y, width, height);
  LOBYTE(a6) = -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:](self, "_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:", a3, a4, a6, v15);
  std::recursive_mutex::unlock(v16);

  return (char)a6;
}

- (BOOL)preProcessInstanceInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 meanPixel:(id)a5 scaler:
{
  void *v5;
  id v10;
  std::recursive_mutex *v11;

  v10 = v5;
  v11 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v11);
  -[FTCinematicHighPriorityTrackerState instanceInputRoi](self, "instanceInputRoi");
  LOBYTE(a5) = -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:](self, "_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:", a3, a4, a5, v10);
  std::recursive_mutex::unlock(v11);

  return (char)a5;
}

- (BOOL)_validatePostProcessingInvocation
{
  _BOOL4 finalized;
  NSObject *v3;

  finalized = self->_finalized;
  if (self->_finalized)
  {
    ft::GetOsLog((ft *)self);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[FTCinematicHighPriorityTrackerState _validatePostProcessingInvocation].cold.1();

    return !finalized;
  }
  else
  {
    self->_finalized = 1;
    return !finalized;
  }
}

- (BOOL)_updateHighPriorityTrackWithRect:(Rect<double>)a3 confidence:(double)a4 isTapToTrack:(BOOL)a5
{
  CinematicTracker *ptr;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  float v10;
  Frame *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  float v15;
  __int128 v16;
  unint64_t *v22;
  unint64_t v23;
  std::runtime_error *exception;
  __int128 v26;
  double var2;
  double var3;
  uint64_t v29;
  float v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;

  ptr = self->_tracker.__ptr_;
  v6 = *((_QWORD *)ptr + 19);
  v7 = (std::__shared_weak_count *)*((_QWORD *)ptr + 20);
  v42 = v6;
  v43 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  if (v6)
  {
    *(double *)&v26 = a3.var0;
    *((_QWORD *)&v26 + 1) = *(_QWORD *)&a3.var1;
    var2 = a3.var2;
    var3 = a3.var3;
    if (a5)
    {
      v29 = 912559;
      v10 = a4;
      v30 = v10;
      v11 = self->_frame.__ptr_;
      v12 = *((_QWORD *)v11 + 2);
      v31 = *(_OWORD *)v11;
      v32 = v12;
      v13 = MEMORY[0x24BDC0D40];
    }
    else
    {
      v29 = *(_QWORD *)(v6 + 88);
      v15 = a4;
      v30 = v15;
      v11 = self->_frame.__ptr_;
      v16 = *(_OWORD *)v11;
      v32 = *((_QWORD *)v11 + 2);
      v31 = v16;
      if (!*(_BYTE *)(v6 + 232))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Track not yet initialized.");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v13 = v6 + 124;
    }
    v33 = *(_OWORD *)v13;
    v34 = *(_QWORD *)(v13 + 16);
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    v41 = _D0;
    ft::Track::Update(v6, (uint64_t)v11, &v26);
  }
  else
  {
    ft::GetOsLog((ft *)self);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:].cold.1();

  }
  if (v7)
  {
    v22 = (unint64_t *)&v7->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6 != 0;
}

- (BOOL)postProcessExemplarOutputs:(id)a3 forTargetRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  std::recursive_mutex *v10;
  CinematicTracker *ptr;
  void **v12;
  void *v13;
  BOOL v14;
  void **v15;
  void *__p[2];
  void *v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v10);
  if (!-[FTCinematicHighPriorityTrackerState _validatePostProcessingInvocation](self, "_validatePostProcessingInvocation"))goto LABEL_11;
  ptr = self->_tracker.__ptr_;
  AsEspressoBufferMap((uint64_t)__p, v9);
  ft::SiameseRpnSession::PostProcessExemplarOutputs((ft::SiameseRpnSession *)((char *)ptr + 200), __p);
  v12 = (void **)v18;
  if (v18)
  {
    do
    {
      v15 = (void **)*v12;
      if (*((char *)v12 + 39) < 0)
        operator delete(v12[2]);
      operator delete(v12);
      v12 = v15;
    }
    while (v15);
  }
  v13 = __p[0];
  __p[0] = 0;
  if (v13)
    operator delete(v13);
  if (!self->_isTapToTrack
    || -[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:](self, "_updateHighPriorityTrackWithRect:confidence:isTapToTrack:", 1, x, y, width, height, 1.0))
  {
    v14 = 1;
  }
  else
  {
LABEL_11:
    v14 = 0;
  }
  std::recursive_mutex::unlock(v10);

  return v14;
}

- (BOOL)postProcessInstanceOutputs:(id)a3
{
  id v4;
  std::recursive_mutex *v5;
  CinematicTracker *ptr;
  void **v7;
  void *v8;
  BOOL v9;
  void **v10;
  void *__p[2];
  void *v13;
  double v14[4];
  float v15;
  char v16;

  v4 = a3;
  v5 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v5);
  if (!-[FTCinematicHighPriorityTrackerState _validatePostProcessingInvocation](self, "_validatePostProcessingInvocation"))goto LABEL_8;
  ptr = self->_tracker.__ptr_;
  AsEspressoBufferMap((uint64_t)__p, v4);
  ft::SiameseRpnSession::PostProcessInstanceOutputs((unsigned __int8 **)ptr + 25, __p, (uint64_t)v14);
  v7 = (void **)v13;
  if (v13)
  {
    do
    {
      v10 = (void **)*v7;
      if (*((char *)v7 + 39) < 0)
        operator delete(v7[2]);
      operator delete(v7);
      v7 = v10;
    }
    while (v10);
  }
  v8 = __p[0];
  __p[0] = 0;
  if (v8)
    operator delete(v8);
  if (!v16)
  {
    ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
    goto LABEL_13;
  }
  if (-[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:](self, "_updateHighPriorityTrackWithRect:confidence:isTapToTrack:", self->_isTapToTrack, v14[0], v14[1], v14[2], v14[3], v15))
  {
LABEL_13:
    v9 = 1;
    goto LABEL_14;
  }
  ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
LABEL_8:
  v9 = 0;
LABEL_14:
  std::recursive_mutex::unlock(v5);

  return v9;
}

- (void)abort
{
  std::recursive_mutex *v3;

  v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v3);
  ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
  self->_finalized = 1;
  std::recursive_mutex::unlock(v3);
}

- (BOOL)completed
{
  return !self->_op || self->_finalized;
}

- (id)opDescription
{
  unint64_t op;

  op = self->_op;
  if (op > 3)
    return CFSTR("Unknown");
  else
    return off_24C55ED08[op];
}

- (NSMutableDictionary)sessionStorage
{
  return self->_sessionStorage;
}

- (void)setSessionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStorage, a3);
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (int64_t)op
{
  return self->_op;
}

- (void)setOp:(int64_t)a3
{
  self->_op = a3;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  objc_storeStrong((id *)&self->_sessionStorage, 0);
  cntrl = self->_frame.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->_tracker.__cntrl_;
    if (!v6)
      return;
  }
  else
  {
LABEL_5:
    v6 = self->_tracker.__cntrl_;
    if (!v6)
      return;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Requested source rect is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validatePostProcessingInvocation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Post processing invoked multiple times.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_updateHighPriorityTrackWithRect:confidence:isTapToTrack:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Internal inconsistency: high priority track missing during tracking update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
