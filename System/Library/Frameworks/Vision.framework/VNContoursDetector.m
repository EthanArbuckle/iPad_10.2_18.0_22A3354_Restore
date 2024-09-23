@implementation VNContoursDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUAndGPUComputeDevices](VNComputeDeviceUtilities, "allCPUAndGPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VNContoursDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNContoursDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNContoursDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __59__VNContoursDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNContoursDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNContoursDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  VNCIContrastWithPivotColorFilter *v7;
  VNCIContrastWithPivotColorFilter *ciContrastWithPivotFilter;
  VNCIContrastFromAverageColorFilter *v9;
  VNCIContrastFromAverageColorFilter *ciContrastFromAvgFilter;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNContoursDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, v6, a4))
    goto LABEL_7;
  v7 = objc_alloc_init(VNCIContrastWithPivotColorFilter);
  ciContrastWithPivotFilter = self->_ciContrastWithPivotFilter;
  self->_ciContrastWithPivotFilter = v7;

  v9 = objc_alloc_init(VNCIContrastFromAverageColorFilter);
  ciContrastFromAvgFilter = self->_ciContrastFromAvgFilter;
  self->_ciContrastFromAvgFilter = v9;

  if (!self->_ciContrastWithPivotFilter || !self->_ciContrastFromAvgFilter)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNContourDetector: Failed to create image filters"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = 1;
LABEL_8:

  return v11;
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
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  __CVBuffer *v25;
  id v26;
  BOOL v27;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  __CVBuffer *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  char v60;
  _QWORD v61[5];
  _QWORD aBlock[4];
  id v63;
  __CVBuffer *v64;
  float v65;
  float v66;
  unint64_t v67;
  uint64_t v68;
  _QWORD v69[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v69[1] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v27 = 0;
    goto LABEL_11;
  }
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (double)(unint64_t)objc_msgSend(v18, "width");
    v21 = width * v20;
    v22 = (double)(unint64_t)objc_msgSend(v19, "height");
    v23 = height * v22;
    v24 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __116__VNContoursDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
    v61[3] = &unk_1E4548D28;
    v61[4] = self;
    if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", (unint64_t)v21, (unint64_t)v23, v61, a8))
    {
      v60 = 0;
      if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v60, CFSTR("VNContourDetectorProcessOption_ForceUseInputCVPixelBufferDirectly"), v16, 0, a8))
      {
        if (v60)
        {
          v25 = (__CVBuffer *)objc_msgSend(v19, "originalPixelBuffer");
          if (v25)
          {
            v26 = 0;
            *a7 = CVPixelBufferRetain(v25);
LABEL_26:
            -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v16, v26, v19);
            v27 = 1;
LABEL_31:

            goto LABEL_9;
          }
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNContourDetector: Original buffer could not be found"));
            v26 = 0;
            v27 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
          v26 = 0;
LABEL_30:
          v27 = 0;
          goto LABEL_31;
        }
        v59 = 0;
        v29 = v19;
        v30 = v16;
        v57 = v29;
        if (!self)
        {
          v34 = 0;
LABEL_25:

          v26 = v59;
          *a7 = v34;
          if (v34)
            goto LABEL_26;
          goto LABEL_30;
        }
        objc_msgSend((id)objc_opt_class(), "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v30, a8);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v58
          || (v67 = 512,
              !+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v67, CFSTR("VNContourDetectorProcessOption_MaximumImageDimension"), v30, 512, a8))|| (v66 = 2.0, LODWORD(v31) = 2.0, !+[VNValidationUtilities getFloatValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:withDefaultValue:error:", &v66, CFSTR("VNContourDetectorProcessOption_ContrastAdjustment"), v30, a8, v31)))
        {
          v34 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v32 = (double)v67 / v23;
        if ((double)v67 / v21 < v32)
          v32 = (double)v67 / v21;
        v33 = fmin(v32, 1.0);
        v34 = (__CVBuffer *)objc_msgSend(v29, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", vcvtad_u64_f64(v21 * v33), vcvtad_u64_f64(v23 * v33), 1278226488, 2, v30, a8, x * v20, y * v22, v21, v23, 0, 0, 0, &v59);
        if (!v34 || v66 == 1.0)
          goto LABEL_24;
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", v34);
        CVPixelBufferRelease(v34);
        v65 = 0.5;
        LODWORD(v35) = 0.5;
        if (+[VNValidationUtilities getFloatValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:withDefaultValue:error:", &v65, CFSTR("VNContourDetectorProcessOption_ContrastPivot"), v30, a8, v35))
        {
          *(float *)&v36 = v65;
          if (v65 == 0.5)
          {
            v68 = *MEMORY[0x1E0C9E1D0];
            *(float *)&v36 = v66;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v69[0] = v55;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"));
            v51 = objc_claimAutoreleasedReturnValue();

            v54 = (id)v51;
          }
          else if (v65 == -1.0)
          {
            -[VNCIFilter setInputImage:](self->_ciContrastFromAvgFilter, "setInputImage:", v54, v36);
            *(float *)&v42 = v66;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNCIContrastFromAverageColorFilter setInputContrast:](self->_ciContrastFromAvgFilter, "setInputContrast:", v43);

            -[VNCIContrastFromAverageColorFilter outputImage](self->_ciContrastFromAvgFilter, "outputImage");
            v44 = objc_claimAutoreleasedReturnValue();

            v54 = (id)v44;
            -[VNCIFilter setInputImage:](self->_ciContrastFromAvgFilter, "setInputImage:", 0);
          }
          else
          {
            -[VNCIFilter setInputImage:](self->_ciContrastWithPivotFilter, "setInputImage:", v54, v36);
            *(float *)&v37 = v66;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNCIContrastWithPivotColorFilter setInputContrast:](self->_ciContrastWithPivotFilter, "setInputContrast:", v38);

            *(float *)&v39 = v65;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNCIContrastWithPivotColorFilter setInputPivot:](self->_ciContrastWithPivotFilter, "setInputPivot:", v40);

            -[VNCIContrastWithPivotColorFilter outputImage](self->_ciContrastWithPivotFilter, "outputImage");
            v41 = objc_claimAutoreleasedReturnValue();

            v54 = (id)v41;
            -[VNCIFilter setInputImage:](self->_ciContrastWithPivotFilter, "setInputImage:", 0);
          }
          if (!v54)
          {
            if (a8)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNContourDetector: Failed to adjust contrast"));
              v49 = (id)objc_claimAutoreleasedReturnValue();
              v50 = 0;
              v34 = 0;
              *a8 = v49;
            }
            else
            {
              v50 = 0;
              v34 = 0;
            }
            goto LABEL_47;
          }
          objc_msgSend(v54, "extent");
          v34 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v45, (unint64_t)v46, 1278226488, a8);
          if (v34)
          {
            aBlock[0] = v24;
            aBlock[1] = 3221225472;
            aBlock[2] = __114__VNContoursDetector__highContastMonoCVPixelBufferFromImageBuffer_cropRect_options_pixelBufferRepsCacheKey_error___block_invoke;
            aBlock[3] = &unk_1E45469E8;
            v54 = v54;
            v63 = v54;
            v64 = v34;
            v56 = _Block_copy(aBlock);
            +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v30, a8);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v47)
            {
              objc_msgSend(v47, "vnciContextManager");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v53, v56, v58, a8) & 1) == 0)
              {
                CVPixelBufferRelease(v34);
                v34 = 0;
              }

            }
            else
            {
              v34 = 0;
            }

          }
        }
        else
        {
          v34 = 0;
        }
        v50 = v54;
LABEL_47:

        goto LABEL_24;
      }
    }
  }
  v27 = 0;
LABEL_9:

LABEL_11:
  return v27;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  size_t Width;
  size_t Height;
  unint64_t v14;
  int v15;
  char v16;
  __CVBuffer *v17;
  size_t v18;
  size_t v19;
  size_t BytesPerRow;
  size_t v21;
  size_t v22;
  int v23;
  apple::vision::libraries::autotrace::EPolygon *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t i;
  uint64_t v34;
  int v35;
  int v36;
  double v37;
  double v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  unsigned __int8 *v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  _BOOL4 v50;
  char v51;
  int v52;
  int v53;
  int v54;
  BOOL v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  int v64;
  int v65;
  int v66;
  unsigned __int8 v67;
  int v68;
  int v69;
  int v70;
  BOOL v71;
  float v72;
  float v73;
  float v74;
  float v75;
  int v76;
  float32x2_t v77;
  float32x2_t v78;
  double v79;
  double v80;
  unsigned __int8 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  apple::vision::libraries::autotrace::BitmapToContourEnvironment *v91;
  size_t v92;
  _DWORD *v93;
  _DWORD *v94;
  void *v95;
  VNContoursObservation *v96;
  std::bad_alloc *exception;
  std::bad_alloc *v99;
  VNContoursDetector *v100;
  uint64_t v101;
  double v102;
  int8x8_t v103;
  int8x8_t v104;
  float32x2_t v105;
  id *v106;
  void *v107;
  id v108;
  float v109;
  unsigned __int8 *v110;
  unsigned __int8 *v111;
  char v112;
  unsigned __int8 v113;
  CVPixelBufferRef pixelBuffer;
  unsigned __int8 *BaseAddress;
  size_t v116;
  size_t v117;
  size_t v118;
  CVPixelBufferRef texture;
  CVPixelBufferRef v120;
  _BYTE v121[4];
  uint64_t v122;
  int v123;
  apple::vision::libraries::autotrace::BitmapToContourEnvironment *v124;
  char v125;
  int v126;
  char v127;
  _DWORD v128[23];
  char v129;
  VNContoursObservation *v130;
  _DWORD v131[256];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v108 = a5;
  v106 = a8;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v107)
    goto LABEL_122;
  v113 = 1;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v113, CFSTR("VNContourDetectorProcessOption_DetectDarkOnLight"), v108, 1, a8))goto LABEL_122;
  v112 = 1;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v112, CFSTR("VNContourDetectorProcessOption_InHierarchy"), v108, 1, a8))goto LABEL_122;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  if (self)
  {
    v14 = Height;
    v15 = v113;
    v16 = v112;
    pixelBuffer = a4;
    if (a4)
    {
      CVPixelBufferRetain(a4);
      v17 = pixelBuffer;
    }
    else
    {
      v17 = 0;
    }
    v18 = CVPixelBufferGetWidth(v17);
    v19 = CVPixelBufferGetHeight(pixelBuffer);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    BaseAddress = 0;
    v116 = v19;
    v117 = v18;
    v118 = BytesPerRow;
    texture = 0;
    apple::vision::CVPixelBufferWrapper::BaseAddressLock<1ull>::BaseAddressLock(&v120, pixelBuffer);
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (texture)
      CVPixelBufferRelease(texture);
    texture = pixelBuffer;
    pixelBuffer = 0;
    apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&pixelBuffer);
    v121[0] = 1;
    v122 = 0x3EA1E89B3FEE76C9;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    memset(v128, 0, sizeof(v128));
    *(_QWORD *)&v128[13] = operator new(0x8000uLL);
    *(_QWORD *)&v128[15] = *(_QWORD *)&v128[13];
    *(_QWORD *)&v128[17] = *(_QWORD *)&v128[13] + 0x8000;
    v129 = v16;
    v100 = self;
    if (!apple::vision::libraries::autotrace::EPolygonList::init((apple::vision::libraries::autotrace::EPolygonList *)&v123))
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v99 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v99, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
    }
    v21 = v116;
    v111 = BaseAddress;
    v22 = v117;
    v23 = v118;
    bzero(v131, 0x400uLL);
    v30 = v23;
    if (v21)
    {
      v31 = 0;
      v32 = v111;
      do
      {
        if (v22)
        {
          for (i = 0; i != v22; ++i)
            ++v131[v32[i]];
        }
        ++v31;
        v32 += v23;
      }
      while (v31 != v21);
    }
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = (double)Width;
    v38 = (double)v14;
    do
    {
      v39 = v131[v34];
      if (v39 <= v35)
        v40 = v35;
      else
        v40 = v131[v34];
      if (v39 <= v36)
        v41 = v36;
      else
        v41 = v131[v34];
      if (v39 <= v36)
        v35 = v40;
      else
        v35 = v36;
      ++v34;
      v36 = v41;
    }
    while (v34 != 256);
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = v111;
    v46 = v41 + v35;
LABEL_29:
    v47 = 0;
    v48 = 0;
    while (1)
    {
      if (!v42 || v22 == v47)
      {
        v50 = 0;
        if (v21 == v42 || v22 == v47)
          goto LABEL_43;
        v49 = 255;
        if (v15)
        {
LABEL_38:
          v51 = v45[v47];
          goto LABEL_42;
        }
      }
      else
      {
        v49 = v43[v47];
        if (v15)
        {
          if (v21 != v42)
            goto LABEL_38;
LABEL_40:
          v51 = -1;
          goto LABEL_42;
        }
        v49 ^= 0xFFu;
        if (v21 == v42)
          goto LABEL_40;
      }
      v51 = ~v45[v47];
LABEL_42:
      v50 = (v51 & 0x80) == 0;
      if (v49 < 128)
      {
        v52 = 4;
        goto LABEL_45;
      }
LABEL_43:
      v52 = 0;
LABEL_45:
      v53 = v52 | v50;
      v54 = v53 | v48;
      v55 = v54 == 9 || v54 == 6;
      if (v55)
        v56 = 2;
      else
        v56 = 1;
      v57 = v56 + v44;
      if (v54 == 15)
        v57 = v44;
      if (v54)
        v44 = v57;
      v48 = 2 * v53;
      if (v22 + 1 == ++v47)
      {
        v43 = v45;
        v45 += v23;
        v55 = v21 == v42++;
        if (!v55)
          goto LABEL_29;
        v58 = 0;
        v110 = 0;
        v121[0] = (float)((float)((int)v21 * (int)v22 - v46) / (float)v44) < 4.5;
        v101 = v23;
LABEL_59:
        v59 = 0;
        v60 = 0;
        v61 = 0;
        v62 = 0;
        v128[0] = 0;
        v109 = (float)(int)v58 + -0.5;
        v63 = 255;
        v64 = 255;
LABEL_60:
        v65 = v64;
        v66 = v63;
        if (!v58 || v22 == v59)
        {
          v64 = 255;
          v67 = -1;
          v63 = 255;
          if (v21 == v58 || v22 == v59)
            goto LABEL_72;
          if (v15)
            goto LABEL_68;
        }
        else
        {
          v64 = v110[v59];
          if (v15)
          {
            if (v21 == v58)
            {
              v63 = 255;
              goto LABEL_69;
            }
LABEL_68:
            v63 = v111[v59];
LABEL_69:
            v67 = v64;
LABEL_72:
            v68 = v64 < 128;
            v69 = (v63 >> 7) ^ 1;
            v70 = v60 | (4 * v68) | v69;
            if (v70)
              v71 = v70 == 15;
            else
              v71 = 1;
            if (!v71)
            {
              v72 = 0.0;
              v73 = 0.0;
              if (v62 != v68)
                v73 = (float)(127.5 - (float)v65) / (float)(v64 - v65);
              if (v62 != v61)
                v72 = (float)(127.5 - (float)v65) / (float)(v66 - v65);
              v74 = 0.0;
              v75 = 0.0;
              if (v64 < 128 != ((v63 & 0x80u) == 0))
                v75 = (float)(127.5 - (float)v67) / (float)(int)(v63 - v64);
              if (v61 != v69)
                v74 = (float)(127.5 - (float)v66) / (float)(int)(v63 - v66);
              v76 = v66 + v65 + v64 + v63;
              v78.f32[0] = (float)(int)v59 + -0.5;
              v77.f32[0] = v78.f32[0] + v73;
              v77.f32[1] = (float)(int)v58 + -0.5;
              *(float *)&v80 = v78.f32[0] + v74;
              v78.f32[1] = v109 + v72;
              *(float *)&v79 = (float)(int)v59 + 0.5;
              *((float *)&v79 + 1) = v109 + v75;
              *((float *)&v80 + 1) = (float)(int)v58 + 0.5;
              switch(v70)
              {
                case 1:
                  v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 0, *(int8x8_t *)&v79, *(int8x8_t *)&v80);
                  goto LABEL_103;
                case 2:
                case 13:
                  v81 = apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
                  goto LABEL_103;
                case 3:
                case 12:
                  v81 = apple::vision::libraries::autotrace::actionE((uint64_t)v121, v78, v79, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
                  goto LABEL_103;
                case 4:
                case 11:
                  v81 = apple::vision::libraries::autotrace::actionB((uint64_t)v121, v77, v79, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
                  goto LABEL_103;
                case 5:
                case 10:
                  v81 = apple::vision::libraries::autotrace::actionC((uint64_t)v121, v77, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
                  goto LABEL_103;
                case 6:
                  v103 = *(int8x8_t *)&v80;
                  v105 = v77;
                  v102 = v79;
                  if (v76 > 510)
                  {
                    if (!apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117;
                    goto LABEL_102;
                  }
                  if (!apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117;
                  v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 1, *(int8x8_t *)&v102, v103);
                  goto LABEL_103;
                case 7:
                case 8:
                  v81 = apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29);
                  goto LABEL_103;
                case 9:
                  v104 = *(int8x8_t *)&v80;
                  v105 = v77;
                  v102 = v79;
                  if (v76 <= 510)
                  {
                    if (!apple::vision::libraries::autotrace::actionD((uint64_t)v121, v78, v80, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117;
LABEL_102:
                    v81 = apple::vision::libraries::autotrace::actionB((uint64_t)v121, v105, v102, v82, v83, v84, v85, v86, v87, v88);
                  }
                  else
                  {
                    if (!apple::vision::libraries::autotrace::actionA((uint64_t)v121, v77, v78, v30, (uint64_t)v24, v25, v26, v27, v28, v29))goto LABEL_117;
                    v81 = apple::vision::libraries::autotrace::actionF((uint64_t)v121, 0, *(int8x8_t *)&v102, v104);
                  }
LABEL_103:
                  if ((v81 & 1) != 0)
                    goto LABEL_104;
LABEL_117:
                  v94 = 0;
                  break;
                case 14:
                  if (apple::vision::libraries::autotrace::actionF((uint64_t)v121, 1, *(int8x8_t *)&v79, *(int8x8_t *)&v80))goto LABEL_104;
                  goto LABEL_117;
                default:
                  goto LABEL_104;
              }
LABEL_118:
              apple::vision::libraries::autotrace::BitmapToContourEnvironment::~BitmapToContourEnvironment((apple::vision::libraries::autotrace::BitmapToContourEnvironment *)v121);
              apple::vision::CVPixelBufferWrapper::BaseAddressLock<1ull>::~BaseAddressLock(&v120);
              apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&texture);
              if (v94)
              {
                v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v94, (*v94 + 8), 1);
                v96 = -[VNContoursObservation initWithOriginatingRequestSpecifier:compressedPoints:imageSize:]([VNContoursObservation alloc], "initWithOriginatingRequestSpecifier:compressedPoints:imageSize:", v107, v95, v37, v38);
                -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](v100, "recordImageCropQuickLookInfoFromOptions:toObservation:", v108, v96);
                v130 = v96;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
                self = (VNContoursDetector *)objc_claimAutoreleasedReturnValue();

                break;
              }
              if (v106)
              {
                +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNContourDetector: Error extracting contours"));
                self = 0;
                *v106 = (id)objc_claimAutoreleasedReturnValue();
                break;
              }
LABEL_122:
              self = 0;
              break;
            }
LABEL_104:
            v60 = (2 * v70) & 0xA;
            ++v59;
            v61 = (v63 >> 7) ^ 1;
            v62 = v64 < 128;
            if (v22 + 1 == v59)
            {
              if (*(_QWORD *)&v128[1])
              {
                *(_QWORD *)&v128[3] = *(_QWORD *)&v128[1];
                operator delete(*(void **)&v128[1]);
              }
              *(_OWORD *)&v128[1] = *(_OWORD *)&v128[7];
              *(_QWORD *)&v128[5] = *(_QWORD *)&v128[11];
              v30 = v101;
              memset(&v128[7], 0, 24);
              v110 = v111;
              v111 += v101;
              v55 = v21 == v58++;
              if (v55)
              {
                v89 = v123;
                if (v123 >= 1)
                {
                  v90 = 0;
                  v91 = v124;
                  do
                  {
                    if (!*((_BYTE *)v91 + 21) && *((_DWORD *)v91 + 8) == -1)
                    {
                      apple::vision::libraries::autotrace::encodePolygonData((apple::vision::libraries::autotrace *)v121, v91, v24);
                      v89 = v123;
                    }
                    ++v90;
                    v91 = (apple::vision::libraries::autotrace::BitmapToContourEnvironment *)((char *)v91 + 40);
                  }
                  while (v90 < v89);
                }
                v92 = ((v128[19] + 7) >> 3);
                v93 = malloc_type_malloc((v92 + 8), 0x7D47F6A3uLL);
                v94 = v93;
                if (v93)
                {
                  *v93 = v92;
                  v93[1] = v128[19];
                  memcpy(v93 + 2, *(const void **)&v128[13], v92);
                }
                goto LABEL_118;
              }
              goto LABEL_59;
            }
            goto LABEL_60;
          }
          v67 = ~(_BYTE)v64;
          v63 = 255;
          v64 = ~(_BYTE)v64;
          if (v21 == v58)
            goto LABEL_72;
        }
        v63 = v111[v59] ^ 0xFF;
        goto LABEL_72;
      }
    }
  }

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ciContrastWithPivotFilter, 0);
  objc_storeStrong((id *)&self->_ciContrastFromAvgFilter, 0);
}

NSString *__116__VNContoursDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

uint64_t __114__VNContoursDetector__highContastMonoCVPixelBufferFromImageBuffer_cropRect_options_pixelBufferRepsCacheKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
    v3 = *(void **)(a2 + 8);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "render:toCVPixelBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return 1;
}

@end
