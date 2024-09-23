@implementation VNGenerateInstanceMaskDetector

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VNGenerateInstanceMaskDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  objc_msgSendSuper2(&v7, sel_fullyPopulateConfigurationOptions_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459DF88, CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));

}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459DFA0, CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459DFB8, CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));

}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allGPUAndNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allGPUAndNeuralEngineComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("subject_lifting_gen1_rev5_gv8dsz6vxu_multihead_int8.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("input_image");
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

void __71__VNGenerateInstanceMaskDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNGenerateInstanceMaskDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNGenerateInstanceMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNGenerateInstanceMaskDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v10, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNGenerateInstanceMaskDetectorCreationOptionGatingOnly"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_gatingOnly = objc_msgSend(v7, "BOOLValue");

  v8 = (self->_gatingOnly
     || -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &self->_outputMaskEspressoBuffer, CFSTR("saliency"), a4))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &self->_outputConfidenceEspressoBuffer, CFSTR("gating_confidence"), a4);

  return v8;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  objc_super v23;

  v13 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v20 = a6;
  v21 = a9;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
  v23.receiver = self;
  v23.super_class = (Class)VNGenerateInstanceMaskDetector;
  LOBYTE(a8) = -[VNEspressoModelFileBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v23, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v19, v13, v20, a7, a8, v21, x, y, width, height);

  return (char)a8;
}

- (BOOL)_filterUsingConnectedComponentsFromSegmentation:(id *)a3 outInstanceMask:(__CVBuffer *)a4 numComponents:(unint64_t *)a5
{
  BOOL v5;
  unint64_t *v6;
  __CVBuffer **v7;
  int v9;
  unsigned __int8 *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  size_t v14;
  char *var0;
  char *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  char *v23;
  unsigned __int8 *v24;
  unsigned int v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  size_t v39;
  unint64_t v40;
  void *v41;
  unsigned __int8 *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  size_t v52;
  _QWORD *v53;
  unsigned __int8 *v54;
  int v55;
  unint64_t *v56;
  unint64_t *v57;
  unint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  BOOL v63;
  unint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t i;
  char *v69;
  size_t v70;
  uint64_t v71;
  _BYTE *v72;
  unsigned __int8 v73;
  void *exception;
  __CVBuffer **v76;
  unint64_t *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  unsigned int v83;
  unint64_t v84;
  void *__p[3];
  CVPixelBufferRef pixelBuffer;
  void *v87[2];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;

  v5 = 0;
  if (!a4)
    return v5;
  v6 = a5;
  if (!a5)
    return v5;
  v7 = a4;
  pixelBuffer = 0;
  v9 = VNCVPixelBufferCreateUsingIOSurface(a3->var4, a3->var5, 0x4C303038u, 0, &pixelBuffer);
  v5 = v9 == 0;
  if (v9)
    return v5;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  Width = CVPixelBufferGetWidth(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (Width != a3->var4 || Height != a3->var5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1B0A5BC](exception, "Image and label dimensions must match.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v14 = BytesPerRow;
  var0 = (char *)a3->var0;
  v84 = 4 * a3->var10;
  bzero(BaseAddress, BytesPerRow * Height);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  *(_OWORD *)v87 = 0u;
  v88 = 0u;
  v82 = var0;
  if (!Height)
  {
    v51 = 1;
    goto LABEL_76;
  }
  v76 = v7;
  v77 = v6;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v80 = 0;
  if (Width <= 1)
    v20 = 1;
  else
    v20 = Width;
  v83 = 1;
  v21 = Width;
  v78 = v20;
  while (!v21)
  {
LABEL_68:
    if (++v80 == Height)
    {
      v51 = v83;
      if (v19)
        operator delete(v19);
      goto LABEL_74;
    }
  }
  v22 = 0;
  v23 = &var0[v80 * v84];
  v24 = &BaseAddress[v80 * v14];
  v79 = v23;
  while (1)
  {
    if (v24[v22] || *(float *)&v23[4 * v22] < 0.4)
      goto LABEL_66;
    v25 = v83;
    v24[v22] = v83;
    v81 = v22;
    if ((unint64_t)v17 >= v18)
    {
      v27 = (v17 - v16) >> 4;
      v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 60)
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v18 - (_QWORD)v16) >> 3 > v28)
        v28 = (uint64_t)(v18 - (_QWORD)v16) >> 3;
      if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
        v29 = 0xFFFFFFFFFFFFFFFLL;
      else
        v29 = v28;
      if (v29)
        v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v29);
      else
        v30 = 0;
      v31 = (_QWORD *)(v29 + 16 * v27);
      *v31 = v80;
      v31[1] = v22;
      if (v17 == v16)
      {
        v33 = (char *)(v29 + 16 * v27);
      }
      else
      {
        v32 = v29 + 16 * v27;
        do
        {
          v33 = (char *)(v32 - 16);
          *(_OWORD *)(v32 - 16) = *((_OWORD *)v17 - 1);
          v17 -= 16;
          v32 -= 16;
        }
        while (v17 != v16);
      }
      v18 = v29 + 16 * v30;
      v26 = (char *)(v31 + 2);
      if (v16)
      {
        v34 = v29 + 16 * v30;
        operator delete(v16);
        v18 = v34;
      }
      v16 = v33;
      var0 = v82;
      v25 = v83;
    }
    else
    {
      *(_QWORD *)v17 = v80;
      *((_QWORD *)v17 + 1) = v22;
      v26 = v17 + 16;
    }
    v17 = v16;
    while (v16 != v26)
    {
      v35 = 0;
      v36 = *((_QWORD *)v26 - 2);
      v37 = *((_QWORD *)v26 - 1);
      v26 -= 16;
      v87[0] = (void *)(v36 - 1);
      v87[1] = (void *)(v37 - 1);
      *(_QWORD *)&v88 = v36 - 1;
      *((_QWORD *)&v88 + 1) = v37;
      *(_QWORD *)&v90 = v36;
      *((_QWORD *)&v90 + 1) = v37 - 1;
      *(_QWORD *)&v91 = v36;
      *((_QWORD *)&v91 + 1) = v37 - 1;
      *(_QWORD *)&v92 = v36 + 1;
      *((_QWORD *)&v92 + 1) = v37 - 1;
      *(_QWORD *)&v89 = v36 - 1;
      *((_QWORD *)&v89 + 1) = v37 + 1;
      *(_QWORD *)&v93 = v36 + 1;
      *((_QWORD *)&v93 + 1) = v37;
      v38 = v87;
      *(_QWORD *)&v94 = v36 + 1;
      *((_QWORD *)&v94 + 1) = v37 + 1;
      do
      {
        v39 = (size_t)*v38;
        if (((unint64_t)*v38 & 0x8000000000000000) == 0 && v39 < Height)
        {
          v40 = (unint64_t)v87[2 * v35 + 1];
          if ((v40 & 0x8000000000000000) == 0 && v40 < Width)
          {
            v41 = v38[1];
            v42 = &BaseAddress[v39 * v14];
            if (!*((_BYTE *)v41 + (_QWORD)v42) && *(float *)&var0[4 * (_QWORD)v41 + v39 * v84] > 0.4)
            {
              *((_BYTE *)v41 + (_QWORD)v42) = v25;
              if ((unint64_t)v26 >= v18)
              {
                v43 = (v26 - v16) >> 4;
                v44 = v43 + 1;
                if ((unint64_t)(v43 + 1) >> 60)
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v18 - (_QWORD)v16) >> 3 > v44)
                  v44 = (uint64_t)(v18 - (_QWORD)v16) >> 3;
                if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
                  v45 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v45 = v44;
                if (v45)
                  v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v45);
                else
                  v46 = 0;
                v47 = (_OWORD *)(v45 + 16 * v43);
                *v47 = *(_OWORD *)v38;
                if (v26 == v16)
                {
                  v49 = (char *)(v45 + 16 * v43);
                }
                else
                {
                  v48 = v45 + 16 * v43;
                  do
                  {
                    v49 = (char *)(v48 - 16);
                    *(_OWORD *)(v48 - 16) = *((_OWORD *)v26 - 1);
                    v26 -= 16;
                    v48 -= 16;
                  }
                  while (v26 != v16);
                }
                v18 = v45 + 16 * v46;
                v26 = (char *)(v47 + 1);
                if (v16)
                {
                  v50 = v45 + 16 * v46;
                  operator delete(v16);
                  v18 = v50;
                }
                v16 = v49;
                var0 = v82;
                v25 = v83;
              }
              else
              {
                *(_OWORD *)v26 = *(_OWORD *)v38;
                v26 += 16;
              }
            }
          }
        }
        ++v35;
        v38 = &v87[2 * v35];
      }
      while (v35 != 8);
      v17 = v26;
    }
    if (v25 == 255)
      break;
    v83 = v25 + 1;
    v19 = v16;
    v20 = v78;
    v23 = v79;
    v22 = v81;
    v24 = &BaseAddress[v80 * v14];
LABEL_66:
    if (++v22 == v20)
    {
      v21 = Width;
      goto LABEL_68;
    }
  }
  if (v16)
    operator delete(v16);
  v51 = 256;
LABEL_74:
  v7 = v76;
  v6 = v77;
LABEL_76:
  std::vector<unsigned long>::vector(v87, v51);
  v52 = Width * Height;
  if (Width * Height)
  {
    v53 = v87[0];
    v54 = BaseAddress;
    do
    {
      v55 = *v54++;
      ++v53[v55];
      --v52;
    }
    while (v52);
  }
  std::vector<unsigned char>::vector(__p, v51, kBackgroundLabel);
  v56 = (unint64_t *)((char *)v87[0] + 8);
  v57 = (unint64_t *)((char *)v87[0] + 16);
  if ((char *)v87[0] + 8 != v87[1] && v57 != v87[1])
  {
    v59 = *v56;
    v60 = (unint64_t *)((char *)v87[0] + 16);
    do
    {
      v62 = *v60++;
      v61 = v62;
      v63 = v59 >= v62;
      if (v59 <= v62)
        v59 = v61;
      if (!v63)
        v56 = v57;
      v57 = v60;
    }
    while (v60 != v87[1]);
  }
  if (v51 < 2)
  {
    v67 = 1;
    if (!Height)
      goto LABEL_104;
    goto LABEL_97;
  }
  v64 = (unint64_t)(float)((float)*v56 * 0.3);
  v65 = 1;
  v66 = 1;
  v67 = 1;
  do
  {
    if (*((_QWORD *)v87[0] + v65) >= v64)
    {
      *((_BYTE *)__p[0] + v65) = v66++;
      ++v67;
    }
    ++v65;
  }
  while (v51 != v65);
  if (Height)
  {
LABEL_97:
    for (i = 0; i != Height; ++i)
    {
      if (Width)
      {
        v69 = &v82[i * v84];
        v70 = Width;
        do
        {
          v71 = *BaseAddress;
          v72 = __p[0];
          v73 = *((_BYTE *)__p[0] + v71);
          if (!v73)
          {
            *(_DWORD *)v69 = 0;
            v73 = v72[v71];
          }
          *BaseAddress++ = v73;
          v69 += 4;
          --v70;
        }
        while (v70);
      }
    }
  }
LABEL_104:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  *v7 = pixelBuffer;
  *v6 = v67;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v87[0])
  {
    v87[1] = v87[0];
    operator delete(v87[0]);
  }
  return v5;
}

- (BOOL)_createLowResMaskFromLowResImage:(__CVBuffer *)a3 outMaskPixelBuffer:(__CVBuffer *)a4 outInstanceMaskPixelBuffer:(__CVBuffer *)a5 outNumComponents:(unint64_t *)a6 outConfidenceScore:(float *)a7 error:(id *)a8
{
  __CVBuffer *v14;
  float v15;

  LODWORD(v14) = -[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:error:", a3, CFSTR("input_image"), a8);
  if ((_DWORD)v14)
  {
    LODWORD(v14) = -[VNEspressoModelFileBasedDetector executePlanAndReturnError:](self, "executePlanAndReturnError:", a8);
    if ((_DWORD)v14)
    {
      v15 = *(float *)self->_outputConfidenceEspressoBuffer.data;
      *a7 = v15;
      if (v15 < 0.16
        || self->_gatingOnly
        || (LODWORD(v14) = -[VNGenerateInstanceMaskDetector _filterUsingConnectedComponentsFromSegmentation:outInstanceMask:numComponents:](self, "_filterUsingConnectedComponentsFromSegmentation:outInstanceMask:numComponents:", &self->_outputMaskEspressoBuffer, a5, a6), (_DWORD)v14)&& (*a6 < 2|| (v14 = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:](VNEspressoHelpers, "createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:", 1278226534, &self->_outputMaskEspressoBuffer, a8), (*a4 = v14) != 0)))
      {
        LOBYTE(v14) = 1;
      }
    }
  }
  return (char)v14;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  VNClassificationObservation *v23;
  VNClassificationObservation *v24;
  double v25;
  VNClassificationObservation *v26;
  VNClassificationObservation *v27;
  VNClassificationObservation *v28;
  void *v29;
  int v30;
  VNInstanceMaskObservation *v31;
  double v32;
  _QWORD aBlock[10];
  uint64_t v35;
  float *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51[1] = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v19 = a7;
  v20 = a9;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = (float *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__VNGenerateInstanceMaskDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E4543770;
  aBlock[4] = self;
  aBlock[5] = &v47;
  aBlock[6] = &v43;
  aBlock[7] = &v39;
  aBlock[8] = &v35;
  aBlock[9] = a4;
  v21 = _Block_copy(aBlock);
  if ((VNExecuteBlock(v21, (uint64_t)a8) & 1) == 0)
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    v29 = 0;
LABEL_10:
    v30 = 2;
    goto LABEL_15;
  }
  if (!self->_gatingOnly && (v36[6] < 0.16 || (unint64_t)v40[3] < 2))
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    v29 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_10;
  }
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v18, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (self->_gatingOnly)
    {
      v23 = [VNClassificationObservation alloc];
      v24 = 0;
      *(float *)&v25 = v36[6];
      v26 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v23, "initWithOriginatingRequestSpecifier:identifier:confidence:", v22, CFSTR("VNGenerateInstanceMaskGate"), v25);
      v27 = v26;
    }
    else
    {
      v31 = [VNInstanceMaskObservation alloc];
      v26 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:lowResMask:instanceMask:numComponents:regionOfInterest:](v31, "initWithOriginatingRequestSpecifier:lowResMask:instanceMask:numComponents:regionOfInterest:", v22, v48[3], v44[3], v40[3], x, y, width, height);
      *(float *)&v32 = v36[6];
      -[VNObservation setConfidence:](v26, "setConfidence:", v32);
      v27 = 0;
      v24 = v26;
    }
    v28 = v26;
    v30 = 0;
  }
  else
  {
    v28 = 0;
    v27 = 0;
    v24 = 0;
    v30 = 1;
  }

  v29 = 0;
LABEL_15:
  CVPixelBufferRelease((CVPixelBufferRef)v48[3]);
  v48[3] = 0;
  CVPixelBufferRelease((CVPixelBufferRef)v44[3]);
  v44[3] = 0;
  if (!v30)
  {
    v51[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

uint64_t __132__VNGenerateInstanceMaskDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createLowResMaskFromLowResImage:outMaskPixelBuffer:outInstanceMaskPixelBuffer:outNumComponents:outConfidenceScore:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2);
}

@end
