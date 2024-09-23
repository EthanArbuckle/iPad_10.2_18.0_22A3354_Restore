@implementation FTTapToTrackPreprocessor

- (FTTapToTrackPreprocessor)initWithScaler:(id)a3
{
  id v5;
  FTTapToTrackPreprocessor *v6;
  FTTapToTrackPreprocessor *v7;
  FTTapToTrackPreprocessor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTTapToTrackPreprocessor;
  v6 = -[FTTapToTrackPreprocessor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scaler, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)preprocessBuffer:(__CVBuffer *)a3
{
  __CVBuffer *ptr;
  size_t Width;
  size_t Height;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  size_t v12;
  shared_ptr<__CVBuffer> v13;
  __shared_weak_count *cntrl;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  ft *v20;
  BOOL v21;
  NSObject *v22;
  shared_ptr<__CVBuffer> v24;

  ptr = self->_intermediateBuffer.__ptr_;
  if (!ptr)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (Width <= Height)
      v8 = Height;
    else
      v8 = Width;
    v9 = (unint64_t)(double)(v8 / 0x280);
    if (v9 <= 1)
      v9 = 1;
    if (v9 >= 4)
      v10 = 4;
    else
      v10 = v9;
    v11 = CVPixelBufferGetWidth(a3) / v10;
    v12 = CVPixelBufferGetHeight(a3);
    ft::CreateIOSurfaceBackedPixelBuffer((ft *)v11, v12 / v10, 0x42475241u, &v24);
    v13 = v24;
    v24 = (shared_ptr<__CVBuffer>)0;
    cntrl = self->_intermediateBuffer.__cntrl_;
    self->_intermediateBuffer = v13;
    if (cntrl)
    {
      v15 = (unint64_t *)((char *)cntrl + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v17 = (std::__shared_weak_count *)v24.__cntrl_;
    if (v24.__cntrl_)
    {
      v18 = (unint64_t *)((char *)v24.__cntrl_ + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    ptr = self->_intermediateBuffer.__ptr_;
  }
  v20 = (ft *)-[FTScaling scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self->_scaler, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, ptr, self->_meanPixel, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), v24.__ptr_);
  v21 = (char)v20;
  if ((v20 & 1) == 0)
  {
    ft::GetOsLog(v20);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FTTapToTrackPreprocessor preprocessBuffer:].cold.1(v22);

  }
  return v21;
}

- (__CVBuffer)bgraPixelBuffer
{
  return self->_intermediateBuffer.__ptr_;
}

- (double)meanPixel
{
  double result;

  a2.i32[0] = *(_DWORD *)(a1 + 24);
  *(_QWORD *)&result = vmovl_u8(a2).u64[0];
  return result;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_scaler, 0);
  cntrl = self->_intermediateBuffer.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)preprocessBuffer:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CC71000, log, OS_LOG_TYPE_ERROR, "MSR preprocessing failed.", v1, 2u);
}

@end
