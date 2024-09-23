@implementation VNE5RTSemanticSegmentationMultiGenerator

- (BOOL)needsMetalContext
{
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  double v27;
  double v28;
  BOOL v30;
  _BOOL8 v31;
  void *v32;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  v19 = a9;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = objc_msgSend(v20, "width");
    v23 = objc_msgSend(v21, "height");
    -[VNE5RTBasedDetector functionDescriptor](self, "functionDescriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "onlyInputImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "pixelWidth");
    v27 = (double)v26 / (double)(unint64_t)objc_msgSend(v25, "pixelHeight");
    v28 = width * (double)v22 / (height * (double)v23);
    if (v27 >= 1.0 || v28 < 1.0)
      v31 = v28 < 1.0 && v27 >= 1.0;
    else
      v31 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("VNSegmentationGeneratorProcessOption_ImageRotated"));

    v36.receiver = self;
    v36.super_class = (Class)VNE5RTSemanticSegmentationMultiGenerator;
    v30 = -[VNE5RTBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v36, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v17, a5, v18, a7, a8, v19, x, y, width, height);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t j;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id obj;
  VNE5RTSemanticSegmentationMultiGenerator *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  VNE5RTSemanticSegmentationMultiGenerator *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD *v72;
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD aBlock[4];
  id v79;
  _QWORD *v80;
  _QWORD v81[6];
  void *__p;
  uint64_t v83;
  uint64_t v84;
  char v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v58 = a4;
  v57 = a5;
  v12 = a6;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v12, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_ObjectClassIDs"), v12, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v14;
    if (v14)
    {
      v15 = objc_msgSend(v14, "unsignedIntegerValue");
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"), v12, a7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16
        && (v85 = 0,
            +[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", &v85, CFSTR("VNSegmentationGeneratorProcessOption_ImageRotated"), v12, a7)))
      {
        v17 = v58;
        v53 = v16;
        v43 = v17;
        objc_msgSend(v17, "objectMaskDescriptorsForObjectClassIDs:error:", v15, a7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          objc_msgSend(v17, "objectMaskDescriptorsForObjectClassIDs:error:", 4096, a7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = self;
          objc_msgSend(v18, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v42;
          if (v42)
          {
            v81[0] = 0;
            v81[1] = v81;
            v81[2] = 0x4812000000;
            v81[3] = __Block_byref_object_copy__42;
            v81[4] = __Block_byref_object_dispose__43;
            v81[5] = "";
            __p = 0;
            v84 = 0;
            v83 = 0;
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke;
            aBlock[3] = &unk_1E4546970;
            v55 = v42;
            v79 = v55;
            v80 = v81;
            v41 = _Block_copy(aBlock);
            objc_msgSend(v55, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v59, "accessReadOnlyDataForName:usingBlock:error:", v20, v41, a7);

            if ((v21 & 1) != 0)
            {
              +[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v46, "count");
              v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_opt_self();
              if (+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToRequestKey]::onceToken != -1)
                dispatch_once(&+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToRequestKey]::onceToken, &__block_literal_global_21_21008);
              v47 = (id)+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
              objc_opt_self();
              if (+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToFeatureName]::onceToken != -1)
                dispatch_once(&+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToFeatureName]::onceToken, &__block_literal_global_21007);
              v48 = (id)+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
              +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSegmentationGeneratorProcessOption_OriginalRequestSpecifiers"), v12, a7);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v22 = v44;
              obj = v22;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
              if (v23)
              {
                v54 = *(_QWORD *)v75;
                while (2)
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v75 != v54)
                      objc_enumerationMutation(obj);
                    v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                    objc_msgSend(v25, "name");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "name");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v26, "isEqualToString:", v27);

                    if (v28)
                    {

                    }
                    else
                    {
                      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v45);
                      for (j = v45; j; --j)
                      {
                        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                        objc_msgSend(v29, "addObject:", v31);

                      }
                      v62[0] = MEMORY[0x1E0C809B0];
                      v62[1] = 3221225472;
                      v62[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_2;
                      v62[3] = &unk_1E4546998;
                      v62[4] = v25;
                      v72 = v81;
                      v32 = v26;
                      v63 = v32;
                      v33 = v53;
                      v73 = v85;
                      v64 = v33;
                      v65 = v52;
                      v66 = v13;
                      v67 = v47;
                      v68 = v46;
                      v69 = v48;
                      v70 = v49;
                      v34 = v29;
                      v71 = v34;
                      v35 = _Block_copy(v62);
                      objc_msgSend(v25, "name");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = objc_msgSend(v59, "accessReadOnlyDataForName:usingBlock:error:", v36, v35, a7);

                      if ((v37 & 1) != 0)
                      {
                        if (objc_msgSend(v50, "count"))
                        {
                          v60[0] = MEMORY[0x1E0C809B0];
                          v60[1] = 3221225472;
                          v60[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_3;
                          v60[3] = &unk_1E45469C0;
                          v61 = v34;
                          objc_msgSend(v50, "enumerateObjectsUsingBlock:", v60);

                        }
                        else
                        {
                          objc_msgSend(v50, "addObjectsFromArray:", v34);
                        }
                      }

                      if (!v37)
                      {
                        v38 = 0;
                        v39 = obj;
                        goto LABEL_38;
                      }
                    }
                  }
                  v22 = obj;
                  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
                  if (v23)
                    continue;
                  break;
                }
              }

              if (objc_msgSend(v50, "count"))
              {
                if (objc_msgSend(v57, "specifiesRequestClass:", objc_opt_class()))
                {
                  v38 = (void *)objc_msgSend(v50, "copy");
                }
                else
                {
                  objc_msgSend(v50, "firstObject");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = (void *)objc_msgSend(v39, "copy");
LABEL_38:

                }
              }
              else
              {
                v38 = (void *)MEMORY[0x1E0C9AA60];
              }

            }
            else
            {
              v38 = 0;
            }

            _Block_object_dispose(v81, 8);
            if (__p)
              operator delete(__p);
            v19 = v42;
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

        v16 = v53;
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

  return v38;
}

- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5
{
  id v7;
  BOOL v8;
  unint64_t v9;
  char v11;

  v7 = a4;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("cropAndScaleOptionPointer cannot be NULL"));
  v11 = 0;
  v8 = +[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", &v11, CFSTR("VNSegmentationGeneratorProcessOption_ImageRotated"), v7, a5);
  if (v8)
  {
    v9 = 258;
    if (!v11)
      v9 = 2;
    *a3 = v9;
  }

  return v8;
}

_QWORD *__145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 *v18;
  uint64_t *v19;
  BOOL v26;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "dataType") == 65552)
  {
    objc_msgSend(*(id *)(a1 + 32), "shape");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = *(_QWORD *)(objc_msgSend(v6, "sizes") + 8);

    objc_msgSend(*(id *)(a1 + 32), "shape");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = *(_QWORD *)objc_msgSend(v8, "sizes");

    v10 = objc_msgSend(*(id *)(a1 + 32), "storageByteCount");
    v12 = objc_msgSend(v5, "length") != v10 || v9 != 1 || v7 == 0;
    v13 = v12;
    if (v12)
    {
      if (a3)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 32), "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ size is %lu bytes instead of the expected %lu bytes, or maskBufferHeight (%lu) is not 1, or number of object classes (%lu) is zero \n"), v15, objc_msgSend(v5, "length"), v10, v9, v7);

        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v18 = (__int16 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
      do
      {
        v19 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
        _H0 = *v18;
        __asm { FCVT            S0, H0 }
        v26 = _S0 > 0.0010004;
        std::vector<BOOL>::push_back(v19, &v26);
        ++v18;
        --v7;
      }
      while (v7);
    }
    a3 = (_QWORD *)(v13 ^ 1u);
  }
  else if (a3)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected data type: %lu"), objc_msgSend(*(id *)(a1 + 32), "dataType"));
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v17);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

+ (id)requestKeyToRequestInfo
{
  objc_opt_self();
  if (+[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]::onceToken != -1)
    dispatch_once(&+[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]::onceToken, &__block_literal_global_29_21015);
  return (id)+[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
}

uint64_t __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  size_t v14;
  id v15;
  size_t v16;
  uint64_t v17;
  __CVBuffer *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  VNPixelBufferObservation *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  VNRectangleObservation *v39;
  double v40;
  void *v41;
  size_t v43;
  void *context;
  void *contexta;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  _QWORD aBlock[4];
  id v52;
  __CVBuffer *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "dataType") == 65552)
  {
    v6 = (void *)MEMORY[0x1E0DC6CD0];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectClassNamesToObjectClassesDetectionStatusIndexes:error:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if (((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48) + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "shape");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = *(_QWORD *)(objc_msgSend(v13, "sizes") + 24);

      objc_msgSend(*(id *)(a1 + 32), "shape");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = *(_QWORD *)(objc_msgSend(v15, "sizes") + 16);

      objc_msgSend(*(id *)(a1 + 32), "dataType");
      v17 = VisionCoreTensorDataTypeGetElementSize() * v14 * v16;
      if (objc_msgSend(v5, "length") == v17)
      {
        v18 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v14, v16, 1278226534, a3);
        if (v18)
        {
          if ((+[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, v14, v16, 1278226536, (int *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v18, a3) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v19, "unsignedIntegerValue");

            if (!*(_BYTE *)(a1 + 120) && (_DWORD)v48 == 1278226534)
              goto LABEL_29;
            context = (void *)MEMORY[0x1A1B0B060]();
            objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            CVPixelBufferRelease(v18);
            if (*(_BYTE *)(a1 + 120))
            {
              objc_msgSend(v20, "imageByApplyingCGOrientation:", 6);
              v21 = objc_claimAutoreleasedReturnValue();

              v43 = v16;
              v20 = (void *)v21;
            }
            else
            {
              v43 = v14;
              v14 = v16;
            }
            v18 = *(__CVBuffer **)(a1 + 56);
            objc_msgSend(*(id *)(a1 + 64), "vnciContextManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0;
            v26 = v20;
            v46 = v25;
            if (v18)
            {
              -[__CVBuffer boundComputeDeviceForComputeStage:error:](v18, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), &v50);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v18 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v43, v14, v48, &v50);
                v28 = v46;
                if (v18)
                {
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __104__VNE5RTSemanticSegmentationMultiGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke;
                  aBlock[3] = &unk_1E45469E8;
                  v52 = v26;
                  v53 = v18;
                  v29 = _Block_copy(aBlock);
                  if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v46, v29, v27, &v50) & 1) == 0)
                  {
                    CVPixelBufferRelease(v18);
                    v18 = 0;
                  }

                }
              }
              else
              {
                v18 = 0;
                v28 = v46;
              }

            }
            else
            {
              v28 = v46;
            }

            v30 = v50;
            objc_autoreleasePoolPop(context);
            if (v18)
            {

LABEL_29:
              objc_msgSend(*(id *)(a1 + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
              contexta = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 80), "objectForKey:", contexta);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 88), "objectForKey:", *(_QWORD *)(a1 + 40));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = *(void **)(a1 + 96);
              objc_msgSend(v47, "originatingRequestSpecifierKey");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v33, v49, v18);
              LODWORD(v35) = 1.0;
              -[VNObservation setConfidence:](v34, "setConfidence:", v35);
              v36 = (void *)objc_opt_class();
              objc_msgSend(v36, "objectClassOutputNameForObjectClassID:error:", 128, 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectClassOutputNameForObjectClassID:error:", 256, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v37) & 1) != 0
                || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v38))
              {
                v39 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNRectangleObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v33, 0.0, 0.0, 1.0, 1.0);
                LODWORD(v40) = 1.0;
                -[VNObservation setConfidence:](v39, "setConfidence:", v40);
                -[VNDetectedObjectObservation setInstanceSegmentationMask:]((uint64_t)v39, v34);
                objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", objc_msgSend(v47, "originalRequestResultsIndex"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addObject:", v39);

              }
              else
              {
                objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", objc_msgSend(v47, "originalRequestResultsIndex"));
                v39 = (VNRectangleObservation *)objc_claimAutoreleasedReturnValue();
                -[VNRectangleObservation addObject:](v39, "addObject:", v34);
              }

              v23 = 1;
              goto LABEL_34;
            }
            if (a3)
              *a3 = objc_retainAutorelease(v30);

            v18 = 0;
          }
          v23 = 0;
LABEL_34:
          CVPixelBufferRelease(v18);
          goto LABEL_35;
        }
      }
      else if (a3)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ size is %lu bytes instead of the expected %lu bytes \n"), *(_QWORD *)(a1 + 40), objc_msgSend(v5, "length"), v17);
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v24);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = 0;
    }
    else
    {
      v23 = 1;
    }
LABEL_35:

    goto LABEL_36;
  }
  if (a3)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected data type: %lu"), objc_msgSend(*(id *)(a1 + 32), "dataType"));
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
LABEL_36:

  return v23;
}

void __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v5);

}

uint64_t __104__VNE5RTSemanticSegmentationMultiGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2)
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

void __75__VNE5RTSemanticSegmentationMultiGenerator_outputMaskBlobNameToFeatureName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_class();
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  v10[0] = CFSTR("human_attribute_skin");
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  v10[1] = CFSTR("human_attribute_hair");
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 16, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  v10[2] = CFSTR("human_attribute_facial_hair");
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 32, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  v10[3] = CFSTR("human_attribute_teeth");
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 128, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  v10[4] = CFSTR("cat");
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 256, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v6;
  v10[5] = CFSTR("dog");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
  +[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName = v7;

}

void __74__VNE5RTSemanticSegmentationMultiGenerator_outputMaskBlobNameToRequestKey__block_invoke()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[12];
  _QWORD v37[14];

  v37[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_class();
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 1, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v35;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 2, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v34;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v31;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 4, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v29;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 8, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v30;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v27;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 16, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v28;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v25;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 32, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v26;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v23;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 64, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v24;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v22;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 128, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v8;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v10;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 256, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v11;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v13;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 512, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v14;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v15;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 1024, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v17;
  objc_msgSend(v0, "objectClassOutputNameForObjectClassID:error:", 2048, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v18;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 12);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)+[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNE5RTSemanticSegmentationMultiGenerator outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v20;

}

void __67__VNE5RTSemanticSegmentationMultiGenerator_requestKeyToRequestInfo__block_invoke()
{
  objc_class *v0;
  void *v1;
  VNMultiDetectorOriginalRequestInfo *v2;
  objc_class *v3;
  void *v4;
  VNMultiDetectorOriginalRequestInfo *v5;
  objc_class *v6;
  void *v7;
  VNMultiDetectorOriginalRequestInfo *v8;
  objc_class *v9;
  void *v10;
  VNMultiDetectorOriginalRequestInfo *v11;
  objc_class *v12;
  void *v13;
  VNMultiDetectorOriginalRequestInfo *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v1;
  v2 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier"), 0);
  v18[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v5 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier"), 1);
  v18[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v8 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier"), 2);
  v18[2] = v8;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  v11 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier"), 3);
  v18[3] = v11;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v13;
  v14 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier"), 4);
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)+[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
  +[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo = v15;

}

+ (id)requestInfoForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[VNE5RTSemanticSegmentationMultiGenerator requestKeyToRequestInfo]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMultiDetectorOriginalRequestInfo requestKeyFromRequest:](VNMultiDetectorOriginalRequestInfo, "requestKeyFromRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0DC6C58], "URLForResourceFileNamed:error:", CFSTR("camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__21028;
  v21[4] = __Block_byref_object_dispose__21029;
  v22 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__VNE5RTSemanticSegmentationMultiGenerator_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  aBlock[3] = &unk_1E4546948;
  v20 = a1;
  v7 = v6;
  v18 = v7;
  v19 = v21;
  v8 = _Block_copy(aBlock);
  objc_msgSend(a1, "modelURLForConfigurationOptions:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@:%@"), v11, CFSTR("camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"));

    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detectorDescriptorsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForIdentifier:creationBlock:error:", v12, v8, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(v21, 8);
  return v15;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allComputeDevices](VNComputeDeviceUtilities, "allComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__VNE5RTSemanticSegmentationMultiGenerator_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[15];

  v37[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "E5RTProgramLibraryForConfigurationOptions:error:", *(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC6CD0], "semanticSegmentationV6AndReturnError:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "function");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v8;
      objc_msgSend(v4, "functionNamed:error:", v8, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v9;
      if (v9)
      {
        objc_msgSend(v6, "setFunction:", v9);
        objc_msgSend(v9, "inputDescriptors");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v13 = (void *)objc_opt_class();
        v14 = (void *)MEMORY[0x1E0DC6CD0];
        objc_msgSend(v36, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 1, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v31;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 128, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v30;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 256, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v29;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 8, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37[3] = v28;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 16, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37[4] = v27;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 4, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37[5] = v26;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 32, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[6] = v25;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 64, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37[7] = v24;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 2, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37[8] = v15;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 512, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[9] = v16;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 1024, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v37[10] = v17;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 2048, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        v37[11] = v18;
        objc_msgSend(v13, "objectClassOutputNameForObjectClassID:error:", 4096, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[12] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:", v4, v34, v33, v21, 0, 0, a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
