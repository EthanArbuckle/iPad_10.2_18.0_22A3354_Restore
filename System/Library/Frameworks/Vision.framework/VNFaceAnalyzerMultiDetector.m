@implementation VNFaceAnalyzerMultiDetector

- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  float v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "width");
  v12 = objc_msgSend(v9, "height");
  objc_msgSend(v8, "unalignedBoundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend((id)objc_opt_class(), "faceBoundingBoxScalingFactorForFaceObservation:", objc_msgSend(v8, "requestRevision"));
  v35.size.width = v18 * (double)v11;
  v35.origin.y = v16 * (double)v12;
  v35.size.height = v20 * (double)v12;
  v22 = (float)(v21 + -1.0);
  v23 = -(v35.size.width * v22) * 0.5;
  v24 = -(v35.size.height * v22) * 0.5;
  v35.origin.x = v14 * (double)v11;
  v36 = CGRectInset(v35, v23, v24);
  v37 = CGRectIntegral(v36);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  espresso_network_query_blob_dimensions();
  v29 = fmaxf((float)0, (float)0);
  if (fmax(width, height) < v29)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNDetectorInternalProcessOption_RecordImageTooSmallWarning"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", vcvtas_u32_f32(v29));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("VNDetectorInternalProcessOption_DesiredMinimumFacePrintingLongDimension"));

  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (float)faceBoundingBoxScalingFactorForFaceObservation:(unint64_t)a3
{
  float result;
  float v4;

  result = 1.765;
  v4 = 1.0;
  if (a3 - 1 < 3)
    v4 = 1.765;
  if (a3 - 3737841664u > 6 || ((1 << a3) & 0x75) == 0)
    return v4;
  return result;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  shared_ptr<vision::mod::FaceFrontalizer> v8;
  shared_ptr<vision::mod::FaceFrontalizer> *p_mFaceFrontalizerImpl;
  __shared_weak_count *cntrl;
  unint64_t *v11;
  unint64_t v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNFaceAnalyzerMultiDetector;
  if (!-[VNFaceAnalyzerMultiDetectorBase completeInitializationForSession:error:](&v15, sel_completeInitializationForSession_error_, v6, a4))goto LABEL_11;
  v7 = operator new(0x80uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = &off_1E453B4F8;
  v7[3] = 0;
  v7[12] = 4;
  v7[13] = 0x3EA8F5C341700000;
  *((_DWORD *)v7 + 28) = 1051260355;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  v8.__ptr_ = (FaceFrontalizer *)(v7 + 3);
  v8.__cntrl_ = (__shared_weak_count *)v7;
  v7[15] = 0;
  p_mFaceFrontalizerImpl = &self->_mFaceFrontalizerImpl;
  cntrl = self->_mFaceFrontalizerImpl.__cntrl_;
  *p_mFaceFrontalizerImpl = v8;
  if (cntrl)
  {
    v11 = (unint64_t *)((char *)cntrl + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  if (!p_mFaceFrontalizerImpl->__ptr_)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to initialize frontalizer."));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  *((_DWORD *)p_mFaceFrontalizerImpl->__ptr_ + 18) = 6;
  v13 = 1;
LABEL_12:

  return v13;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  return self;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  uint64_t v3;
  _QWORD *exception;
  float __C;
  float __dst[128];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)a3.var0;
  memcpy(__dst, &unk_1A15E3AC8, sizeof(__dst));
  if (*(_QWORD *)(v3 + 72) != 1 || (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 104))(v3) != 512)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 5244;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  __C = 0.0;
  vDSP_dotpr(*(const float **)(v3 + 56), 1, __dst, 1, &__C, 0x80uLL);
  return (float)(__C + 1.2744) < 0.2;
}

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  unint64_t v7;
  uint64_t v8;
  vImage_Buffer *v9;
  vImage_Buffer *v10;
  void *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  FaceFrontalizer *ptr;
  void **v16;
  uint64_t v17;
  vImage_Buffer *v18;
  void *v19;
  unint64_t v20;
  unint64_t v22;
  char *PointerToPoint;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  size_t v27;
  unint64_t v28;
  int v29;
  uint64_t v31;
  float32x2_t v32;
  unint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  uint64_t v37;
  float32x2_t v38;
  _QWORD v39[2];
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  espresso_network_query_blob_dimensions();
  v7 = (unint64_t)(float)0;
  v8 = objc_msgSend((id)objc_opt_class(), "numberOfImageChannels") * v7;
  v9 = (vImage_Buffer *)malloc_type_calloc(v8 * v7 + 32, 1uLL, 0x1AE58436uLL);
  if (!v9)
  {
    if (!a4)
      return 0;
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v18;
  }
  v10 = v9;
  v9->data = &v9[1];
  v9->height = (unint64_t)(float)0;
  v9->width = v7;
  v9->rowBytes = v8;
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  v39[0] = BaseAddress;
  Height = CVPixelBufferGetHeight(a3);
  v39[1] = Height;
  Width = CVPixelBufferGetWidth(a3);
  *(_QWORD *)&v40 = Width;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  ptr = self->_mFaceFrontalizerImpl.__ptr_;
  *((_QWORD *)&v40 + 1) = BytesPerRow;
  v16 = (void **)((char *)ptr + 40);
  v17 = ImageProcessing_reallocVImageBuffer((uint64_t)ptr + 40, (unint64_t)(float)Width, (unint64_t)(float)Height, 4);
  if ((v17 & 0x80) == 0)
    goto LABEL_3;
  if (*((_DWORD *)ptr + 18) == 6)
  {
    v17 = 4221;
    if (!BaseAddress || !Width || !Height || BytesPerRow < 2)
      goto LABEL_3;
    v19 = *v16;
    if (!*v16 || (v20 = *((_QWORD *)ptr + 7)) == 0 || !*((_QWORD *)ptr + 6) || *((_QWORD *)ptr + 8) < 2uLL)
    {
      v17 = 4221;
      goto LABEL_3;
    }
    v31 = *((_QWORD *)ptr + 8);
    v33 = *((_QWORD *)ptr + 6);
    v37 = 0;
    v38 = vrndp_f32((float32x2_t)__PAIR64__((float)Width, (float)Height));
    v32 = v38;
    v34 = 0;
    v35 = (float)Height;
    v36 = (float)Width;
    Geometry2D_intersectRect2D((float *)&v37, (float *)&v34);
    v17 = 4220;
    if (v32.f32[0] != (float)v33 || v32.f32[1] != (float)v20)
    {
LABEL_3:
      if (v17 == 128)
        goto LABEL_36;
      goto LABEL_34;
    }
    if ((unint64_t)v32.f32[0] - 1 >= Height - 1)
      v22 = Height - 1;
    else
      v22 = (unint64_t)v32.f32[0] - 1;
    PointerToPoint = (char *)ImageProcessing_getPointerToPoint(v39, 4, 0.0, 0.0);
    v24 = ImageProcessing_getPointerToPoint((_QWORD *)ptr + 5, 4, 0.0, 0.0);
    if (!PointerToPoint || (v25 = (char *)v24) == 0)
    {
      syslog(5, "Round ROI: %.2f %.2f %.2f %.2f", 0.0, 0.0, v32.f32[1], v32.f32[0]);
      v17 = 4220;
      goto LABEL_3;
    }
    if ((unint64_t)v32.f32[1] - 1 >= Width - 1)
      v26 = Width - 1;
    else
      v26 = (unint64_t)v32.f32[1] - 1;
    bzero(v19, v31 * v33);
    v27 = 4 * v26 + 4;
    v28 = v22 + 1;
    do
    {
      memcpy(v25, PointerToPoint, v27);
      PointerToPoint += BytesPerRow;
      v25 += *((_QWORD *)ptr + 8);
      --v28;
    }
    while (v28);
    if (!vImageScale_ARGB8888((const vImage_Buffer *)((char *)ptr + 40), v10, 0, 0x20u))
    {
      v29 = 6;
      v17 = 4224;
      goto LABEL_35;
    }
    v17 = 1402;
  }
  else
  {
    v17 = 1399;
  }
LABEL_34:
  v29 = 0;
LABEL_35:
  *((_DWORD *)ptr + 19) = v29;
LABEL_36:
  free(*v16);
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)((char *)ptr + 56) = 0u;
  if (v17 == 128)
  {
    v18 = v10;
    v10 = 0;
  }
  else if (a4)
  {
    VNErrorForCVMLStatus((id)v17);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  free(v10);
  return v18;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_mFaceFrontalizerImpl.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    v13 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities mostPerformantComputeDevice](VNComputeDeviceUtilities, "mostPerformantComputeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetector;
    objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

@end
