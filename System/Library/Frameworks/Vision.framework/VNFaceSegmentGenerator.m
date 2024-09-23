@implementation VNFaceSegmentGenerator

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _OWORD *v12;
  shared_ptr<vision::mod::FaceSegmenterDNN> v13;
  shared_ptr<vision::mod::FaceSegmenterDNN> *p_faceSegmenterDNN;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v17;
  BOOL v18;
  _QWORD *exception;
  objc_super v21;
  uint64_t v22;

  v21.receiver = self;
  v21.super_class = (Class)VNFaceSegmentGenerator;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v21, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "network");
  v9 = v8;
  v10 = objc_msgSend(v6, "plan");
  v11 = (char *)operator new(0x198uLL);
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  *(_QWORD *)v11 = &off_1E453B568;
  *((_QWORD *)v11 + 3) = v7;
  *((_QWORD *)v11 + 4) = v9;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = v10;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  *(_OWORD *)(v11 + 136) = 0u;
  *(_OWORD *)(v11 + 152) = 0u;
  *(_OWORD *)(v11 + 168) = 0u;
  *(_OWORD *)(v11 + 184) = 0u;
  *(_OWORD *)(v11 + 200) = 0u;
  *((_DWORD *)v11 + 54) = 0;
  v22 = 0;
  std::vector<unsigned long>::vector((_QWORD *)v11 + 28, 4uLL, &v22);
  v22 = 0;
  std::vector<unsigned long>::vector((_QWORD *)v11 + 31, 4uLL, &v22);
  v11[272] = 0;
  *(_QWORD *)(v11 + 284) = 0;
  *(_QWORD *)(v11 + 276) = 0;
  *((_QWORD *)v11 + 38) = 0;
  *((_QWORD *)v11 + 39) = 0;
  *((_QWORD *)v11 + 37) = 0;
  v12 = operator new(0x40uLL);
  *((_QWORD *)v11 + 38) = v12 + 4;
  *((_QWORD *)v11 + 39) = v12 + 4;
  *v12 = 0u;
  v12[1] = 0u;
  v12[2] = 0u;
  v12[3] = 0u;
  *((_QWORD *)v11 + 37) = v12;
  *((_OWORD *)v11 + 20) = 0u;
  *((_OWORD *)v11 + 21) = 0u;
  *((_OWORD *)v11 + 22) = 0u;
  *((_OWORD *)v11 + 23) = 0u;
  *((_OWORD *)v11 + 24) = 0u;
  v11[400] = 0;
  if (espresso_network_query_blob_dimensions()
    || espresso_network_bind_buffer()
    || espresso_network_query_blob_dimensions())
  {
    espresso_plan_get_error_info();
    exception = __cxa_allocate_exception(8uLL);
    *exception = 8283;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v13.__ptr_ = (FaceSegmenterDNN *)(v11 + 24);
  v13.__cntrl_ = (__shared_weak_count *)v11;
  p_faceSegmenterDNN = &self->_faceSegmenterDNN;
  cntrl = (std::__shared_weak_count *)p_faceSegmenterDNN->__cntrl_;
  *p_faceSegmenterDNN = v13;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v18 = p_faceSegmenterDNN->__ptr_ != 0;
  if (a4 && !p_faceSegmenterDNN->__ptr_)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create Face Segmenter object"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (BOOL)_getFaceSegmenterInputImageSize:(CGSize *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5
{
  BOOL result;
  const __CFString *v7;
  id v8;

  if (a3)
  {
    if (a4 == 1)
    {
      *(float64x2_t *)a3 = vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)*((_QWORD *)self->_faceSegmenterDNN.__ptr_
                                                                                   + 25))));
      return 1;
    }
    if (a5)
    {
      v7 = CFSTR("Unexpected request revision");
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    v7 = CFSTR("Invalid parameter (size)");
LABEL_8:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v8;
    return result;
  }
  return 0;
}

- (BOOL)_getNumberOfSupportedFaceSegments:(unint64_t *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5
{
  BOOL result;
  const __CFString *v7;
  id v8;

  if (a3)
  {
    if (a4 == 1)
    {
      *a3 = *(int *)(*((_QWORD *)self->_faceSegmenterDNN.__ptr_ + 28) + 16);
      return 1;
    }
    if (a5)
    {
      v7 = CFSTR("Unexpected request revision");
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    v7 = CFSTR("Invalid parameter (numberOfSupportedFaceSegments)");
LABEL_8:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v8;
    return result;
  }
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
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
  CGFloat v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  double v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  void *v41;
  BOOL v42;
  void *v44;
  uint64_t v45;
  __CVBuffer *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55[3];
  float v56;
  CGRect v57;
  CGRect v58;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "width");
    v16 = objc_msgSend(v14, "height");
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v12, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "alignedBoundingBoxAsCGRect");
      v22 = (double)v15;
      v24 = v23 * (double)v15;
      if (v24 == 0.0 || (v25 = (double)v16, v26 = v21 * (double)v16, v26 == 0.0))
      {
        if (a8)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("One of the dimensions of the input face image is zero"));
          v42 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v27 = v19;
        v28 = v20;
        v56 = 0.0;
        if (+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v56, CFSTR("VNFaceSegmentGeneratorProcessOption_FaceBoundingBoxExpansionRatio"), v12, a8))
        {
          v57.origin.x = v27 * v22;
          v57.origin.y = v28 * v25;
          v29 = (float)(v56 + -1.0);
          v30 = -(v24 * v29) * 0.5;
          v31 = -(v26 * v29) * 0.5;
          v57.size.width = v24;
          v57.size.height = v26;
          v58 = CGRectInset(v57, v30, v31);
          x = v58.origin.x;
          y = v58.origin.y;
          width = v58.size.width;
          height = v58.size.height;
          objc_msgSend(v14, "orientation");
          if ((VNSetFaceOrientationInOptionsDictionary(v18, v12, a8) & 1) != 0)
          {
            if (width >= height)
              v36 = width / height;
            else
              v36 = height / width;
            +[VNFaceSegmentGenerator _faceSegmenterMaximumInputImageAspectRatio](VNFaceSegmentGenerator, "_faceSegmenterMaximumInputImageAspectRatio");
            v37 = v36;
            if (v38 >= v37)
            {
              +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v12, objc_opt_class(), a8);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v44;
              if (v44
                && (v45 = objc_msgSend(v44, "requestRevision"),
                    *(_OWORD *)v55 = *MEMORY[0x1E0C9D820],
                    -[VNFaceSegmentGenerator _getFaceSegmenterInputImageSize:forRequestRevision:error:](self, "_getFaceSegmenterInputImageSize:forRequestRevision:error:", v55, v45, a8))&& (objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool")), v46 = (__CVBuffer *)objc_msgSend(v14, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v55[0], (unint64_t)v55[1], 1111970369, v12, a8, x,
                                          y,
                                          width,
                                          height),
                    (*a7 = v46) != 0))
              {
                v47 = 0.0;
                v48 = 0.0;
                v49 = 0.0;
                if (v15)
                {
                  v48 = x / v22;
                  v49 = width / v22;
                }
                v50 = 0.0;
                if (v16)
                {
                  v47 = y / v25;
                  v50 = height / v25;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v51, CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_X"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v52, CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Y"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v53, CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Width"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v54, CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Height"));

                v42 = 1;
              }
              else
              {
                v42 = 0;
              }
              goto LABEL_28;
            }
            if (a8)
            {
              v39 = (void *)MEMORY[0x1E0CB3940];
              +[VNFaceSegmentGenerator _faceSegmenterMaximumInputImageAspectRatio](VNFaceSegmentGenerator, "_faceSegmenterMaximumInputImageAspectRatio");
              objc_msgSend(v39, "stringWithFormat:", CFSTR("Input face aspect ratio > %f cannot be processed"), v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v41);
              v42 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

              goto LABEL_17;
            }
          }
        }
      }
    }
    v42 = 0;
    goto LABEL_17;
  }
  v42 = 0;
LABEL_18:

  return v42;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  FaceSegmenterDNN *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  uint64_t v26;
  char v27;
  float v28;
  float *v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v40;
  float v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  FaceSegmenterDNN *v52;
  float v53;
  float v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  VNFaceSegments *v72;
  VNFaceSegments *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *ptr[2];
  __int128 v80;
  _QWORD aBlock[6];
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__VNFaceSegmentGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E4544D28;
  aBlock[4] = self;
  aBlock[5] = a4;
  v13 = _Block_copy(aBlock);
  if ((VNExecuteBlock(v13, (uint64_t)a8) & 1) == 0)
    goto LABEL_37;
  *(_OWORD *)ptr = 0u;
  v80 = 0u;
  v14 = self->_faceSegmenterDNN.__ptr_;
  if (!*((_BYTE *)v14 + 248))
  {
    v35 = 8308;
    if (!a8)
      goto LABEL_37;
    goto LABEL_35;
  }
  v77 = v12;
  v15 = (uint64_t *)*((_QWORD *)v14 + 28);
  v16 = *v15;
  v17 = v15[1];
  v18 = v15[2];
  v19 = (*v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  v20 = malloc_type_realloc(*((void **)v14 + 43), v19 * v17, 0xA423628BuLL);
  *((_QWORD *)v14 + 43) = v20;
  if (!v20)
    goto LABEL_33;
  *((_QWORD *)v14 + 45) = v16;
  *((_QWORD *)v14 + 46) = v19;
  *((_QWORD *)v14 + 44) = v17;
  bzero(v20, v19 * v17);
  v12 = v77;
  if (v17)
  {
    v21 = 0;
    v22 = (float *)*((_QWORD *)v14 + 4);
    v23 = *((_QWORD *)v14 + 43);
    do
    {
      if (v16)
      {
        v24 = 0;
        v25 = v22;
        do
        {
          if (v18)
          {
            v26 = 0;
            v27 = 0;
            v28 = -3.4028e38;
            v29 = v25;
            do
            {
              if (v28 < *v29)
              {
                v28 = *v29;
                v27 = v26;
              }
              ++v26;
              v29 += v17 * v16;
            }
            while (v18 != v26);
          }
          else
          {
            v27 = 0;
          }
          *(_BYTE *)(v23 + v24++) = v27;
          ++v25;
        }
        while (v24 != v16);
      }
      v23 += *((_QWORD *)v14 + 46);
      ++v21;
      v22 += v16;
    }
    while (v21 != v17);
  }
  v30 = (char *)ptr[0];
  if (!ptr[0])
  {
    v31 = (unint64_t)*((float *)v14 + 66);
    v32 = (unint64_t)*((float *)v14 + 65);
    v30 = (char *)malloc_type_realloc(0, ((v31 + 15) & 0xFFFFFFFFFFFFFFF0) * v32, 0xA423628BuLL);
    ptr[0] = v30;
    if (v30)
    {
      *(_QWORD *)&v80 = v31;
      *((_QWORD *)&v80 + 1) = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
      ptr[1] = (void *)v32;
      v12 = v77;
      goto LABEL_20;
    }
LABEL_33:
    v35 = 4221;
    v12 = v77;
    goto LABEL_34;
  }
LABEL_20:
  if (!*((_QWORD *)v14 + 43) || (v33 = *((_QWORD *)v14 + 45)) == 0 || (v34 = (void *)*((_QWORD *)v14 + 44)) == 0)
  {
LABEL_36:
    v35 = 4220;
    if (!a8)
      goto LABEL_37;
    goto LABEL_35;
  }
  v35 = 4220;
  if (*((_QWORD *)v14 + 46) < 2uLL || !v30)
  {
LABEL_34:
    if (!a8)
    {
LABEL_37:
      v38 = 0;
      goto LABEL_38;
    }
LABEL_35:
    VNErrorForCVMLStatus((id)v35);
    v38 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (!(_QWORD)v80)
    goto LABEL_36;
  v36 = ptr[1];
  if (!ptr[1])
    goto LABEL_36;
  v37 = *((_QWORD *)&v80 + 1);
  if (*((_QWORD *)&v80 + 1) < 2uLL)
    goto LABEL_36;
  if (v34 == ptr[1] && v33 == (_QWORD)v80)
  {
    ImageProcessing_copyVImageBufferData((char **)v14 + 43, 1, (char **)ptr);
  }
  else
  {
    v40 = 0;
    v41 = (float)v33 / (float)(unint64_t)v80;
    v42 = 1;
    v43 = (float)(unint64_t)v34 / (float)(unint64_t)ptr[1];
    do
    {
      v44 = llroundf((float)((float)((float)v40 + 0.5) * v43) + -0.5);
      v45 = *((_QWORD *)v14 + 44);
      if (v45 <= v44)
        v46 = v45 - 1;
      else
        v46 = v44 & ~(v44 >> 63);
      if (v42)
      {
        v47 = 0;
        v48 = *((_QWORD *)v14 + 43) + v46 * *((_QWORD *)v14 + 46);
        do
        {
          v49 = llroundf((float)((float)((float)v47 + 0.5) * v41) + -0.5);
          v50 = *((_QWORD *)v14 + 45);
          if (v50 <= v49)
            v51 = v50 - 1;
          else
            v51 = v49 & ~(v49 >> 63);
          v30[v47++] = *(_BYTE *)(v48 + v51);
          v42 = v80;
        }
        while (v47 < (unint64_t)v80);
        v36 = ptr[1];
        v37 = *((_QWORD *)&v80 + 1);
      }
      v30 += v37;
      ++v40;
    }
    while (v40 < (unint64_t)v36);
  }
  v52 = self->_faceSegmenterDNN.__ptr_;
  v53 = *((float *)v52 + 66);
  v54 = *((float *)v52 + 65);
  v55 = objc_alloc(MEMORY[0x1E0C99D50]);
  v56 = (void *)objc_msgSend(v55, "initWithBytesNoCopy:length:", ptr[0], (((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF0) * (unint64_t)v54);
  +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v12, objc_opt_class(), a8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57
    && (v59 = objc_msgSend(v57, "requestRevision"),
        v78 = 0,
        -[VNFaceSegmentGenerator _getNumberOfSupportedFaceSegments:forRequestRevision:error:](self, "_getNumberOfSupportedFaceSegments:forRequestRevision:error:", &v78, v59, a8)))
  {
    v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[VNFaceSegmentGenerator _fillFaceSegmentLabelToProbabilityMap:error:](self, "_fillFaceSegmentLabelToProbabilityMap:error:", v60, a8))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_X"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "doubleValue");
      v62 = v61;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Y"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "doubleValue");
      v65 = v64;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Width"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "doubleValue");
      v68 = v67;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Height"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "doubleValue");
      v71 = v70;

      v72 = [VNFaceSegments alloc];
      v73 = -[VNFaceSegments initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:](v72, "initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:", v59, (_QWORD)v80, ptr[1], v56, v78, v60, v62, v65, v68, v71);
      VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (v74)
      {
        objc_msgSend(v74, "setFaceSegments:", v73);
        v82[0] = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = 0;
      }

    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

LABEL_38:
  return v38;
}

- (BOOL)_fillFaceSegmentLabelToProbabilityMap:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  FaceSegmenterDNN *ptr;
  vImagePixelCount *v8;
  vImagePixelCount v9;
  vImagePixelCount v10;
  vImagePixelCount v11;
  vImagePixelCount v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v29;
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v32[4];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  +[VNFaceSegments faceSegmentIndexToFlagMap](VNFaceSegments, "faceSegmentIndexToFlagMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  while (1)
  {
    memset(&dest, 0, sizeof(dest));
    ptr = self->_faceSegmenterDNN.__ptr_;
    if (!*((_BYTE *)ptr + 248))
    {
      v24 = 8308;
      goto LABEL_22;
    }
    v8 = (vImagePixelCount *)*((_QWORD *)ptr + 28);
    v10 = *v8;
    v9 = v8[1];
    src.data = (void *)(*((_QWORD *)ptr + 4) + 4 * v10 * v6 * v9);
    src.height = v9;
    src.width = v10;
    src.rowBytes = 4 * v10;
    v11 = (unint64_t)*((float *)ptr + 66);
    v12 = (unint64_t)*((float *)ptr + 65);
    dest.data = malloc_type_realloc(0, ((4 * v11 + 15) & 0xFFFFFFFFFFFFFFF0) * v12, 0xA423628BuLL);
    if (!dest.data)
    {
      v24 = 4221;
      goto LABEL_22;
    }
    dest.width = v11;
    dest.rowBytes = (4 * v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    dest.height = v12;
    v13 = vImageScale_PlanarF(&src, &dest, 0, 0x80u);
    v14 = (void *)*((_QWORD *)ptr + 37);
    if (v13 > *((_QWORD *)ptr + 38))
      break;
LABEL_7:
    if (vImageScale_PlanarF(&src, &dest, v14, 0))
    {
      v24 = 8314;
      goto LABEL_22;
    }
    if (dest.width != 256 || dest.height != 256)
    {
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB3940]);
        v26 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("Expected labelConfidence map of %lu x %lu and got %lu x %lu"), 256, 256, dest.width, dest.height);
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_24;
    }
    v15 = objc_alloc(MEMORY[0x1E0C99D50]);
    v16 = (void *)objc_msgSend(v15, "initWithBytesNoCopy:length:freeWhenDone:", dest.data, 0x40000, 1);
    v33[0] = v16;
    v32[0] = CFSTR("data");
    v32[1] = CFSTR("width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 256);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v17;
    v32[2] = CFSTR("height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 256);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v18;
    v32[3] = CFSTR("rowBytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1024);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("cannot map face segments"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_24;
    }
    objc_msgSend(v29, "setObject:forKey:", v20, v22);

    if (++v6 == 15)
    {
      v23 = 1;
      goto LABEL_25;
    }
  }
  v14 = malloc_type_realloc(*((void **)ptr + 37), v13, 0x25BD965BuLL);
  *((_QWORD *)ptr + 37) = v14;
  if (v14)
  {
    *((_QWORD *)ptr + 38) = v13;
    goto LABEL_7;
  }
  v24 = 8315;
LABEL_22:
  if (a4)
  {
    VNErrorForCVMLStatus((id)v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:
  v23 = 0;
LABEL_25:

  return v23;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_faceSegmenterDNN.__cntrl_;
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

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

uint64_t __124__VNFaceSegmentGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  __CVBuffer *v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  float v7;
  size_t Width;
  size_t Height;
  uint64_t v10;
  uint64_t result;
  id v12;

  v3 = *(__CVBuffer **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  *(_BYTE *)(v4 + 248) = 0;
  v5 = *(unint64_t **)(v4 + 200);
  v6 = v5[1];
  v7 = (float)*v5;
  Width = CVPixelBufferGetWidth(v3);
  Height = CVPixelBufferGetHeight(v3);
  if (Width != (unint64_t)v7 || Height != (unint64_t)(float)v6)
  {
    v10 = 8316;
    if (!a2)
      return 0;
LABEL_8:
    VNErrorForCVMLStatus((id)v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a2 = v12;
    return result;
  }
  *(_DWORD *)(v4 + 252) = 0;
  *(_DWORD *)(v4 + 256) = 0;
  *(float *)(v4 + 260) = (float)Height;
  *(float *)(v4 + 264) = (float)Width;
  if (espresso_network_bind_input_cvpixelbuffer() || espresso_plan_execute_sync())
  {
    espresso_plan_get_error_info();
    v10 = 8283;
    if (!a2)
      return 0;
    goto LABEL_8;
  }
  result = 1;
  *(_BYTE *)(v4 + 248) = 1;
  return result;
}

+ (float)_faceSegmenterMaximumInputImageAspectRatio
{
  return 3.0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::onceToken != -1)
    dispatch_once(&+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::onceToken, &__block_literal_global_10079);
  return (id)+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::espressoModelName;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken != -1)
    dispatch_once(&+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken, &__block_literal_global_37_10077);
  return (id)+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputBufferBlobName;
}

void __91__VNFaceSegmentGenerator_espressoModelInputImageDimensionsBlobNameForConfigurationOptions___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "input__0");
  v1 = (void *)+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputBufferBlobName;
  +[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputBufferBlobName = v0;

}

void __71__VNFaceSegmentGenerator_espressoModelFileNameForConfigurationOptions___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "faceSemantics_v1_15class_quant.espresso");
  v1 = (void *)+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::espressoModelName;
  +[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::espressoModelName = v0;

}

@end
