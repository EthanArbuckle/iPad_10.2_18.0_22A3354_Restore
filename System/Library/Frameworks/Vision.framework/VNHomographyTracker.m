@implementation VNHomographyTracker

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CVBuffer *v21;
  BOOL v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "width");
    v20 = objc_msgSend(v18, "height");
    v21 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)(v19 & 0xFFFFFFFFFFFFFFFELL)), (unint64_t)(height * (double)(v20 & 0xFFFFFFFFFFFFFFFELL)), 875704422, v16, a8, x * (double)(v19 & 0xFFFFFFFFFFFFFFFELL), y * (double)(v20 & 0xFFFFFFFFFFFFFFFELL));
    *a7 = v21;
    v22 = v21 != 0;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  const __CVBuffer *v25;

  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNHomographyTrackerProcessOption_State"), v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __121__VNHomographyTracker_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      v20[3] = &unk_1E4543200;
      v20[4] = self;
      v21 = v12;
      v22 = v14;
      v25 = a4;
      v23 = v13;
      v16 = v15;
      v24 = v16;
      v17 = _Block_copy(v20);
      if ((VNExecuteBlock(v17, (uint64_t)a8) & 1) != 0)
        v18 = v16;
      else
        v18 = 0;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __121__VNHomographyTracker_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_time_t v9;
  char *v11;
  char *v12;
  unint64_t v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  __int128 *v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double *v34;
  VNImageHomographicAlignmentObservation *v35;
  double v36;
  uint64_t v37;

  objc_msgSend(*(id *)(a1 + 32), "validatedImageBufferFromOptions:error:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  objc_msgSend(v4, "timingInfo");
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    if (ICAnalysisAddFrame())
    {
      v7 = *(_QWORD *)(v6 + 24);
      *(_QWORD *)(v6 + 24) = v7 - 1;
      if (v7 > 1)
        goto LABEL_5;
      v9 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 16), v9))
      {
        v37 = a1;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = (os_unfair_lock_s *)(v6 + 32);
        do
        {
          v15 = v14;
          os_unfair_lock_lock(v14);
          v16 = *(__int128 **)(v6 + 40);
          v17 = *(__int128 **)(v6 + 48);
          if (v16 != v17)
          {
            do
            {
              if ((unint64_t)v12 >= v13)
              {
                v21 = (v12 - v11) >> 6;
                v22 = v21 + 1;
                if ((unint64_t)(v21 + 1) >> 58)
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v13 - (_QWORD)v11) >> 5 > v22)
                  v22 = (uint64_t)(v13 - (_QWORD)v11) >> 5;
                if (v13 - (unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0)
                  v23 = 0x3FFFFFFFFFFFFFFLL;
                else
                  v23 = v22;
                if (v23)
                  v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<simd_float3x3,float>>>(v23);
                else
                  v24 = 0;
                v25 = (_OWORD *)(v23 + (v21 << 6));
                v26 = *v16;
                v27 = v16[1];
                v28 = v16[3];
                v25[2] = v16[2];
                v25[3] = v28;
                *v25 = v26;
                v25[1] = v27;
                if (v12 == v11)
                {
                  v30 = (char *)(v23 + (v21 << 6));
                }
                else
                {
                  v29 = v23 + (v21 << 6);
                  do
                  {
                    v30 = (char *)(v29 - 64);
                    v31 = *((_OWORD *)v12 - 4);
                    v32 = *((_OWORD *)v12 - 3);
                    v33 = *((_OWORD *)v12 - 1);
                    *(_OWORD *)(v29 - 32) = *((_OWORD *)v12 - 2);
                    *(_OWORD *)(v29 - 16) = v33;
                    *(_OWORD *)(v29 - 64) = v31;
                    *(_OWORD *)(v29 - 48) = v32;
                    v12 -= 64;
                    v29 -= 64;
                  }
                  while (v12 != v11);
                }
                v13 = v23 + (v24 << 6);
                v12 = (char *)(v25 + 4);
                if (v11)
                  operator delete(v11);
                v11 = v30;
              }
              else
              {
                v18 = *v16;
                v19 = v16[1];
                v20 = v16[3];
                *((_OWORD *)v12 + 2) = v16[2];
                *((_OWORD *)v12 + 3) = v20;
                *(_OWORD *)v12 = v18;
                *((_OWORD *)v12 + 1) = v19;
                v12 += 64;
              }
              v16 += 4;
            }
            while (v16 != v17);
            v16 = *(__int128 **)(v6 + 40);
          }
          *(_QWORD *)(v6 + 48) = v16;
          v14 = v15;
          os_unfair_lock_unlock(v15);
        }
        while (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 16), 0));
        if (v11 != v12)
        {
          v34 = (double *)v11;
          do
          {
            v35 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageHomographicAlignmentObservation alloc], "initWithOriginatingRequestSpecifier:", *(_QWORD *)(v37 + 56));
            -[VNImageHomographicAlignmentObservation setWarpTransform:](v35, "setWarpTransform:", *v34, v34[2], v34[4]);
            LODWORD(v36) = *((_DWORD *)v34 + 12);
            -[VNObservation setConfidence:](v35, "setConfidence:", v36);
            objc_msgSend(*(id *)(v37 + 64), "addObject:", v35);

            v34 += 8;
          }
          while (v34 != (double *)v12);
        }
        if (v11)
          operator delete(v11);
        goto LABEL_5;
      }
      if (a2)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("timeout exceeded"));
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v8 = 1;
LABEL_10:

  return v8;
}

@end
