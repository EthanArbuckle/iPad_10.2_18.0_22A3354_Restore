@implementation FTMSRScaler

- (FTMSRScaler)init
{
  FTMSRScaler *v2;
  MemoryScalerRotator *v3;
  uint64_t v4;
  MemoryScalerRotator *value;
  uint64_t v6;
  const void *v7;
  FTMSRScaler *v8;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTMSRScaler;
  v2 = -[FTMSRScaler init](&v11, sel_init);
  if (v2)
  {
    LOBYTE(v10) = 1;
    *((_QWORD *)&v10 + 1) = 4;
    v3 = (MemoryScalerRotator *)operator new();
    v4 = operator new();
    ik::core::msr::MSR::MSR(v4, &v10);
    *(_QWORD *)v3 = v4;
    value = v2->_resampler.__ptr_.__value_;
    v2->_resampler.__ptr_.__value_ = v3;
    if (value)
    {
      v6 = *(_QWORD *)value;
      *(_QWORD *)value = 0;
      if (v6)
      {
        v7 = *(const void **)(v6 + 16);
        if (v7)
          CFRelease(v7);
        std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(v6 + 24, *(_QWORD **)(v6 + 32));
        MEMORY[0x212B93F04](v6, 0x1020C40F15AEE48);
      }
      MEMORY[0x212B93F04](value, 0x20C4093837F09);
    }
    v8 = v2;
  }

  return v2;
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6
{
  return -[FTMSRScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:
{
  _DWORD *v6;
  _DWORD *v7;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  unint64_t **value;
  _BYTE *v20;
  ft *v21;
  NSObject *v22;
  BOOL v23;
  std::runtime_error *exception;
  std::runtime_error *v26;
  _QWORD v27[4];
  char v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  char v33;
  char v34;
  char v35;
  char v36;
  uint64_t v37;
  _BYTE *v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  BOOL v43;
  _BYTE v44[1568];
  void *v45;
  __CVBuffer *v46;
  uint64_t v47;
  void *v48;
  CVPixelBufferRef v49;
  CVPixelBufferLockFlags v50;
  CGRect v51;
  CGRect v52;

  v7 = v6;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5.size.height;
  v13 = a5.size.width;
  v14 = a5.origin.y;
  v15 = a5.origin.x;
  v49 = a3;
  v50 = 0;
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_24;
  }
  v47 = 0;
  v48 = &unk_24C55E940;
  v46 = a4;
  if (CVPixelBufferLockBaseAddress(a4, 0))
  {
    v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "Failed to lock pixel buffer.");
    goto LABEL_22;
  }
  v45 = &unk_24C55E940;
  v51.origin.x = v15;
  v51.origin.y = v14;
  v51.size.width = v13;
  v51.size.height = v12;
  if (CGRectIsEmpty(v51))
  {
    v13 = (double)CVPixelBufferGetWidth(a3);
    v12 = (double)CVPixelBufferGetHeight(a3);
    v15 = 0.0;
    v14 = 0.0;
  }
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  if (CGRectIsEmpty(v52))
  {
    width = (double)CVPixelBufferGetWidth(a4);
    height = (double)CVPixelBufferGetHeight(a4);
    y = 0.0;
    x = 0.0;
  }
  bzero(v44, 0x620uLL);
  value = (unint64_t **)self->_resampler.__ptr_.__value_;
  if (v7)
    v20 = v44;
  else
    v20 = 0;
  *(CGFloat *)v27 = v15;
  *(CGFloat *)&v27[1] = v14;
  *(double *)&v27[2] = v13;
  *(double *)&v27[3] = v12;
  v28 = 1;
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  v33 = 1;
  v34 = 0;
  v35 = 0;
  v36 = 1;
  v37 = 0;
  v38 = v20;
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  v43 = v7 != 0;
  ik::core::msr::MSR::Resample(*value, a3, a4, (uint64_t)v27);
  if (v7 && (v21 = (ft *)FTComputeMeanColor((ft *)v44, (unint64_t)(width * height), v7), (_DWORD)v21))
  {
    ft::GetOsLog(v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FTMSRScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:].cold.1();

    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  if (CVPixelBufferUnlockBaseAddress(a4, 0))
  {
    v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "Failed to unlock pixel buffer.");
LABEL_22:
    __cxa_throw(v26, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (CVPixelBufferUnlockBaseAddress(v49, v50))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_24:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return v23;
}

- (void).cxx_destruct
{
  MemoryScalerRotator *value;
  uint64_t v3;
  const void *v4;

  value = self->_resampler.__ptr_.__value_;
  self->_resampler.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = *(_QWORD *)value;
    *(_QWORD *)value = 0;
    if (v3)
    {
      v4 = *(const void **)(v3 + 16);
      if (v4)
        CFRelease(v4);
      std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(v3 + 24, *(_QWORD **)(v3 + 32));
      MEMORY[0x212B93F04](v3, 0x1020C40F15AEE48);
    }
    JUMPOUT(0x212B93F04);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Failed to compute image mean.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scaleSourceBuffer:(uint64_t)a1 toDestinationBuffer:(NSObject *)a2 sourceROI:destinationROI:mean:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_20CC71000, a2, OS_LOG_TYPE_ERROR, "Scaler encountered an error: %s", (uint8_t *)&v4, 0xCu);
}

@end
