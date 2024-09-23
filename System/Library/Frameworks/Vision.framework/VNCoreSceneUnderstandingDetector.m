@implementation VNCoreSceneUnderstandingDetector

+ (BOOL)handlesRequestClass:(Class)a3 revision:(unint64_t)a4
{
  return +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]((uint64_t)a1, a3, a4) != 0;
}

- (int64_t)sceneNetConfigurationRevision
{
  void *v2;
  int64_t v3;

  -[CSUSceneNetV5 configuration](self->_sceneNet, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "revision");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingDetector;
  -[VNDetector description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUSceneNetV5 configuration](self->_sceneNet, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "revision");
  if ((unint64_t)(v5 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CSUSceneNetV5ConfigurationRevision(%ld)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E45471C0[v5 - 1];
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)needsMetalContext
{
  return 0;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CSUSceneNetV5 *v14;
  CSUSceneNetV5 *sceneNet;
  void *v16;
  unint64_t v17;
  unint64_t inputImagePixelWidth;
  VNRegionOfInterestTilingOptions *v19;
  VNRegionOfInterestTilingOptions *inputImageTilingOptions;
  CSUSceneNetV5CustomClassifier *v21;
  CSUSceneNetV5CustomClassifier *junkLeafClassifier;
  CSUSceneNetV5CustomClassifier *v23;
  CSUSceneNetV5CustomClassifier *junkHierarchicalClassifier;
  CSUSceneNetV5CustomClassifier *v25;
  CSUSceneNetV5CustomClassifier *VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier;
  CSUSceneNetV5CustomClassifier *v27;
  CSUSceneNetV5CustomClassifier *significantEventClassifier;
  CSUSceneNetV5CustomClassifier *v29;
  CSUSceneNetV5CustomClassifier *cityNatureClassifier;
  char v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)VNCoreSceneUnderstandingDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v40, sel_completeInitializationForSession_error_, v6, a4))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v37 = 0;
    v34 = 0;
    v35 = 0;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v39, &v38, &v37, &v36, &v35, &v34, v33, a4);
    v8 = v39;
    v9 = v38;
    v10 = v37;
    v11 = v36;
    v12 = v35;
    v13 = v34;
    if ((v7 & 1) != 0)
    {
      v14 = (CSUSceneNetV5 *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188D0]), "initWithConfiguration:", v8);
      sceneNet = self->_sceneNet;
      self->_sceneNet = v14;

      objc_msgSend(v8, "inputPixelBufferDescriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inputImagePixelFormat = objc_msgSend(v16, "pixelFormat");
      self->_inputImagePixelWidth = objc_msgSend(v16, "width");
      v17 = objc_msgSend(v16, "height");
      self->_inputImagePixelHeight = v17;
      inputImagePixelWidth = self->_inputImagePixelWidth;
      if (inputImagePixelWidth >= v17)
        inputImagePixelWidth = v17;
      self->_inputImageMinimumDimension = inputImagePixelWidth;
      v19 = objc_alloc_init(VNRegionOfInterestTilingOptions);
      inputImageTilingOptions = self->_inputImageTilingOptions;
      self->_inputImageTilingOptions = v19;

      v21 = (CSUSceneNetV5CustomClassifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188E0]), "initWithConfiguration:", v9);
      junkLeafClassifier = self->_junkLeafClassifier;
      self->_junkLeafClassifier = v21;

      v23 = (CSUSceneNetV5CustomClassifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188E0]), "initWithConfiguration:", v10);
      junkHierarchicalClassifier = self->_junkHierarchicalClassifier;
      self->_junkHierarchicalClassifier = v23;

      v25 = (CSUSceneNetV5CustomClassifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188E0]), "initWithConfiguration:", v11);
      VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier = self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier;
      self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier = v25;

      v27 = (CSUSceneNetV5CustomClassifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188E0]), "initWithConfiguration:", v12);
      significantEventClassifier = self->_significantEventClassifier;
      self->_significantEventClassifier = v27;

      v29 = (CSUSceneNetV5CustomClassifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188E0]), "initWithConfiguration:", v13);
      cityNatureClassifier = self->_cityNatureClassifier;
      self->_cityNatureClassifier = v29;

      v31 = -[VNCoreSceneUnderstandingDetector _warmUpTaxonomiesForOptions:inSession:error:]((uint64_t)self, v33, v6, (uint64_t)a4);
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t (**v20)(void *, const __CFString *, id *);
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  _QWORD aBlock[5];
  id v28;
  id v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VNCoreSceneUnderstandingDetector;
  if (!-[VNDetector warmUpSession:withOptions:error:](&v30, sel_warmUpSession_withOptions_error_, v8, v9, a5))
    goto LABEL_17;
  if (!-[CSUSceneNetV5 loadResources:](self->_sceneNet, "loadResources:", a5))
    goto LABEL_17;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if ((-[CSUSceneNetV5CustomClassifier loadResourcesAndReturnError:](self->_junkLeafClassifier, "loadResourcesAndReturnError:", a5) & 1) == 0|| !-[CSUSceneNetV5CustomClassifier loadResourcesAndReturnError:](self->_junkHierarchicalClassifier, "loadResourcesAndReturnError:", a5))
    {
      goto LABEL_17;
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    if ((-[CSUSceneNetV5CustomClassifier loadResourcesAndReturnError:](self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier, "loadResourcesAndReturnError:", a5) & 1) == 0)goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    if ((-[CSUSceneNetV5CustomClassifier loadResourcesAndReturnError:](self->_significantEventClassifier, "loadResourcesAndReturnError:", a5) & 1) == 0)goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17
    || (-[CSUSceneNetV5CustomClassifier loadResourcesAndReturnError:](self->_cityNatureClassifier, "loadResourcesAndReturnError:", a5) & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__VNCoreSceneUnderstandingDetector_warmUpSession_withOptions_error___block_invoke;
    aBlock[3] = &unk_1E4547258;
    aBlock[4] = self;
    v18 = v9;
    v28 = v18;
    v19 = v8;
    v29 = v19;
    v20 = (uint64_t (**)(void *, const __CFString *, id *))_Block_copy(aBlock);
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22 && (v20[2](v20, CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType"), a5) & 1) == 0
      || (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations")), v23 = (void *)objc_claimAutoreleasedReturnValue(), v24 = objc_msgSend(v23, "count"), v23, v24)&& (v20[2](v20, CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), a5) & 1) == 0)
    {
      v25 = 0;
    }
    else
    {
      v25 = -[VNCoreSceneUnderstandingDetector _warmUpTaxonomiesForOptions:inSession:error:]((uint64_t)self, v18, v19, (uint64_t)a5);
    }

  }
  else
  {
LABEL_17:
    v25 = 0;
  }

  return v25;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[5];
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = *(_QWORD *)&a3;
  v67 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v49 = a8;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    +[VNRegionOfInterestTiling tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:](VNRegionOfInterestTiling, "tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:", objc_msgSend(v19, "width"), objc_msgSend(v19, "height"), self->_inputImageTilingOptions, x, y, width, height, (double)self->_inputImagePixelWidth / (double)self->_inputImagePixelHeight);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v48, "tileCount");
    if (v21 >= 2)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v48, CFSTR("VNCoreSceneUnderstandingDetectorInternalProcessingOption_Tiling"));
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v23 = 1;
    }
    else
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v25, "count") != 0;

    }
    if (v21 > 1 || !v23)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "count"))
      {
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "count"))
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
      {
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "count"))
      {
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "count"))
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "count"))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "count"))
      {

        goto LABEL_20;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v40, "count");

      if (!v39)
      {
        v28 = 0;
LABEL_29:
        v29 = !v23;
        if (v21 < 2)
          v29 = 1;
        if ((v29 & 1) != 0)
          goto LABEL_37;
        v59 = 0;
        v60 = &v59;
        v61 = 0x3032000000;
        v62 = __Block_byref_object_copy__29_23236;
        v63 = __Block_byref_object_dispose__30_23237;
        v64 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __141__VNCoreSceneUnderstandingDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E4547178;
        v58 = &v59;
        aBlock[4] = self;
        v55 = v48;
        v56 = v17;
        v57 = v18;
        v30 = _Block_copy(aBlock);
        v31 = objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v30, self, v15, a7);
        if ((v31 & 1) != 0)
        {
          v32 = (void *)v60[5];
          if (v28)
          {
            objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v32);
            v33 = objc_claimAutoreleasedReturnValue();

            v28 = (id)v33;
          }
          else
          {
            v28 = v32;
          }
        }

        _Block_object_dispose(&v59, 8);
        if (v31)
        {
LABEL_37:
          if (v28)
          {
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v34 = v28;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v51 != v36)
                    objc_enumerationMutation(v34);
                  -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v17, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
              }
              while (v35);
            }

            v28 = v34;
            v24 = v28;
            goto LABEL_50;
          }
          if (a7)
          {
            +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", CFSTR("no CSU processing took place"));
            v28 = 0;
            v24 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

            goto LABEL_51;
          }
          v28 = 0;
        }
LABEL_49:
        v24 = 0;
        goto LABEL_50;
      }
    }
LABEL_28:
    v65.receiver = self;
    v65.super_class = (Class)VNCoreSceneUnderstandingDetector;
    -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v65, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v49, x, y, width, height);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_49;
    goto LABEL_29;
  }
  v24 = 0;
LABEL_51:

  return v24;
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
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double inputImageMinimumDimension;
  double v30;
  unint64_t inputImagePixelWidth;
  unint64_t inputImagePixelHeight;
  uint64_t inputImagePixelFormat;
  __CVBuffer *v34;
  id v35;
  BOOL v36;
  id v38;
  uint64_t v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  v19 = v17;
  if (self
    && (v39 = 0,
        +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v39, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v19, 2, a8)))
  {
    v20 = v39;

    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v19, a8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "width");
      v24 = objc_msgSend(v22, "height");
      v25 = width * (double)v23;
      v26 = (double)v24;
      v27 = height * (double)v24;
      if (v25 >= v27)
        v28 = height * (double)v24;
      else
        v28 = width * (double)v23;
      inputImageMinimumDimension = (double)self->_inputImageMinimumDimension;
      if (v28 < inputImageMinimumDimension)
      {
        if (width >= height)
          v30 = height;
        else
          v30 = width;
        if (v30 <= 0.0)
          v30 = 1.0;
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)(inputImageMinimumDimension / v30));
      }
      objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      inputImagePixelWidth = self->_inputImagePixelWidth;
      inputImagePixelHeight = self->_inputImagePixelHeight;
      inputImagePixelFormat = self->_inputImagePixelFormat;
      v38 = 0;
      v34 = (__CVBuffer *)objc_msgSend(v22, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", inputImagePixelWidth, inputImagePixelHeight, inputImagePixelFormat, v20, v19, a8, x * (double)v23, y * v26, v25, v27, 0, 0, 0, &v38);
      v35 = v38;
      *a7 = v34;
      v36 = v34 != 0;
      if (v34)
        -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v19, v35, v22);

    }
    else
    {
      v36 = 0;
    }

  }
  else
  {

    v36 = 0;
  }

  return v36;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD aBlock[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__29_23236;
  v43 = __Block_byref_object_dispose__30_23237;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__29_23236;
  v37 = __Block_byref_object_dispose__30_23237;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VNCoreSceneUnderstandingDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E45471A0;
  v26 = &v33;
  v27 = &v39;
  aBlock[4] = self;
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  v18 = v17;
  v25 = v18;
  v32 = a6;
  v19 = _Block_copy(aBlock);
  v20 = (void *)MEMORY[0x1A1B0B060]();
  -[CSUSceneNetV5 runOnInputImage:completion:](self->_sceneNet, "runOnInputImage:completion:", a4, v19);
  objc_autoreleasePoolPop(v20);
  v21 = (void *)v40[5];
  if (v21)
  {
    v22 = v21;
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease((id)v34[5]);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureClassifier, 0);
  objc_storeStrong((id *)&self->_significantEventClassifier, 0);
  objc_storeStrong((id *)&self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier, 0);
  objc_storeStrong((id *)&self->_junkHierarchicalClassifier, 0);
  objc_storeStrong((id *)&self->_junkLeafClassifier, 0);
  objc_storeStrong((id *)&self->_inputImageTilingOptions, 0);
  objc_storeStrong((id *)&self->_cachedDetectedObjectsTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_cachedEntityNetTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_cachedSceneTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_sceneNet, 0);
}

void __134__VNCoreSceneUnderstandingDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(double *)(a1 + 64);
    v8 = *(double *)(a1 + 72);
    v9 = *(double *)(a1 + 80);
    v10 = *(double *)(a1 + 88);
    v11 = *(id **)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(_DWORD *)(a1 + 96);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v14 + 40);
    -[VNCoreSceneUnderstandingDetector _processSceneNetOutput:regionOfInterest:options:qosClass:error:](v11, v5, v12, v13, &obj, v7, v8, v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v14 + 40), obj);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

- (id)_processSceneNetOutput:(void *)a3 regionOfInterest:(unsigned int)a4 options:(_QWORD *)a5 qosClass:(double)a6 error:(double)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  char **v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VNSceneObservation *v23;
  void *v24;
  VNSceneObservation *v25;
  void *v26;
  uint64_t v27;
  char **v28;
  char **v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  unsigned int v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  void *v60;
  unsigned int v61;
  unsigned int v62;
  void *v63;
  unsigned int v64;
  unsigned int v65;
  void *v66;
  unsigned int v67;
  unsigned int v68;
  void *v69;
  unsigned int v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  char **v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  char **v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  uint64_t v101;
  char **v102;
  char **v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void (**v111)(void *, void *);
  void *v112;
  float v113;
  float v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  void *v120;
  float v121;
  float v122;
  void *v123;
  double v124;
  double x;
  double y;
  double width;
  double height;
  void *v129;
  id v130;
  id v131;
  char **v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t k;
  id v140;
  const void *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  size_t v145;
  size_t v146;
  char *v147;
  _BYTE *v148;
  uint64_t v149;
  char *v150;
  VNFingerprintHash *v151;
  void *v152;
  void *v153;
  VNImageFingerprintsObservation *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  char v160;
  id v161;
  uint64_t v162;
  char **v163;
  uint64_t v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  float v170;
  float v171;
  void *v172;
  void *v173;
  id v174;
  uint64_t v175;
  id v176;
  id v177;
  void *v178;
  uint64_t v179;
  uint64_t i;
  id v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  uint64_t v186;
  float v187;
  float v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  unint64_t v194;
  id v195;
  char *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  unsigned int v206;
  void *v207;
  unsigned int v208;
  void *v209;
  void *v210;
  unsigned int v211;
  void *v212;
  void *v213;
  unsigned int v214;
  void *v215;
  unsigned int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  id v229;
  char *v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  id v236;
  char *v237;
  id v238;
  id v239;
  char *v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  id v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  char *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  void *v266;
  uint64_t v267;
  id v268;
  void *v269;
  id v270;
  char *v271;
  id v272;
  char *v273;
  id v274;
  void *v275;
  uint64_t v276;
  id v277;
  id v278;
  id *v279;
  id v280;
  id v281;
  _QWORD *v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  _BYTE v322[128];
  _QWORD aBlock[4];
  id v324;
  id v325;
  _QWORD v326[16];
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  uint64_t v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;

  v331 = *MEMORY[0x1E0C80C00];
  v281 = a2;
  v12 = a3;
  v279 = a1;
  v259 = v12;
  if (!a1)
  {
    v161 = 0;
    goto LABEL_159;
  }
  v282 = a5;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v12, a5);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v266)
  {
    v161 = 0;
    goto LABEL_158;
  }
  v280 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorInternalProcessingOption_Tiling"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_4;
  v313 = 0u;
  v314 = 0u;
  v311 = 0u;
  v312 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
  v239 = (id)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v311, v322, 16);
  if (v162)
  {
    objd = *(id *)v312;
    v163 = &selRef_initWithCVImageBuffer_;
    do
    {
      v257 = v162;
      v164 = 0;
      v271 = v163[41];
      do
      {
        if (*(id *)v312 != objd)
          objc_enumerationMutation(v239);
        v165 = *(id *)(*((_QWORD *)&v311 + 1) + 8 * v164);
        v166 = v281;
        v167 = v266;
        objc_msgSend(v166, "VNRequiredBufferFromSelector:error:", v271, v282);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        if (v168)
        {
          -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:]((uint64_t)v279, v167, (uint64_t)v282);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          if (v169)
          {
            objc_msgSend(v165, "observationsRecipient");
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v247, "originatingRequestSpecifier");
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "minimumConfidence");
            v171 = v170;
            objc_msgSend(v165, "disallowedList");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v243 = v172;
            v277 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](objc_msgSend(v165, "maximumHierarchicalClassifications"), v277, v172, v169, v252, v171);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v279[7], "enumerateHierarchicalSceneClassificationLikelihoods:usingBlock:error:", v168, v173, v282) & 1) != 0)
            {
              v174 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](objc_msgSend(v165, "maximumLeafClassifications"), v174, v172, v169, v252, v171);
              v175 = objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v279[7], "enumerateLeafSceneClassificationLikelihoods:usingBlock:error:", v168, v175, v282) & 1) != 0)
              {
                objc_msgSend(v174, "addObjectsFromArray:", v277);
                v176 = &__block_literal_global_88;
                objc_msgSend(v174, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

                objc_msgSend(v247, "receiveObservations:", v174);
                v177 = v174;
              }
              else
              {
                v177 = 0;
              }

              v173 = (void *)v175;
            }
            else
            {
              v177 = 0;
            }

          }
          else
          {
            v177 = 0;
          }

        }
        else
        {
          v177 = 0;
        }

        if (!v177)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v177);

        ++v164;
      }
      while (v257 != v164);
      v162 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v311, v322, 16);
      v163 = &selRef_initWithCVImageBuffer_;
    }
    while (v162);
  }

  v309 = 0u;
  v310 = 0u;
  v307 = 0u;
  v308 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = v178;
  v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v307, v321, 16);
  if (v179)
  {
    obje = *(id *)v308;
    do
    {
      v258 = v179;
      for (i = 0; i != v258; ++i)
      {
        if (*(id *)v308 != obje)
          objc_enumerationMutation(v178);
        v181 = *(id *)(*((_QWORD *)&v307 + 1) + 8 * i);
        v278 = v281;
        v272 = v266;
        objc_msgSend(v181, "observationsRecipient");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v278, "entityNetClassificationLikelihoods");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v184)
          goto LABEL_142;
        -[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:]((uint64_t)v279, v272, (uint64_t)v282);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        if (v185)
        {
          objc_msgSend(v182, "originatingRequestSpecifier");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = objc_msgSend(v181, "maximumClassifications");
          objc_msgSend(v181, "minimumConfidence");
          v188 = v187;
          objc_msgSend(v181, "disallowedList");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](v186, v183, v189, v185, v253, v188);
          v190 = (void *)objc_claimAutoreleasedReturnValue();

          v178 = v248;
          if ((objc_msgSend(v279[7], "enumerateEntityNetClassificationLikelihoods:usingBlock:error:", v184, v190, v282) & 1) != 0)
          {
            v191 = &__block_literal_global_88;
            objc_msgSend(v183, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

LABEL_142:
            objc_msgSend(v182, "receiveObservations:", v183);
            v192 = v183;
            goto LABEL_145;
          }

        }
        v192 = 0;
LABEL_145:

        if (!v192)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v192);

      }
      v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v307, v321, 16);
    }
    while (v179);
  }

LABEL_4:
  v305 = 0u;
  v306 = 0u;
  v303 = 0u;
  v304 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v303, v320, 16);
  if (v14)
  {
    v267 = *(_QWORD *)v304;
    v15 = &selRef_representativenessForFaces_error_;
    do
    {
      v16 = 0;
      v273 = v15[104];
      do
      {
        if (*(_QWORD *)v304 != v267)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v303 + 1) + 8 * v16);
        v18 = v281;
        objc_msgSend(v18, "VNRequiredBufferFromSelector:error:", v273, v282);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v17, "observationsRecipient");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "originatingRequestSpecifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNEspressoModelImageprint printFromCSUBuffer:originatingRequestSpecifier:error:](VNSceneprint, "printFromCSUBuffer:originatingRequestSpecifier:error:", v19, v21, v282);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = [VNSceneObservation alloc];
            v326[0] = v22;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v326, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[VNSceneObservation initWithOriginatingRequestSpecifier:sceneprints:](v23, "initWithOriginatingRequestSpecifier:sceneprints:", v21, v24);

            *(_QWORD *)&v327 = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v327, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "receiveObservations:", v26);

          }
          else
          {
            v26 = 0;
          }

        }
        else
        {
          v26 = 0;
        }

        if (!v26)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v26);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v303, v320, 16);
      v15 = &selRef_representativenessForFaces_error_;
    }
    while (v14);
  }

  v301 = 0u;
  v302 = 0u;
  v299 = 0u;
  v300 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"));
  v195 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v299, v319, 16);
  if (v27)
  {
    v28 = &selRef_initWithCVImageBuffer_;
    v29 = &selRef_initWithCVImageBuffer_;
    v236 = *(id *)v300;
    do
    {
      v234 = v27;
      v30 = 0;
      v240 = v28[42];
      v196 = v29[43];
      do
      {
        if (*(id *)v300 != v236)
          objc_enumerationMutation(v195);
        v268 = *(id *)(*((_QWORD *)&v299 + 1) + 8 * v30);
        v274 = v281;
        objc_msgSend(v274, "VNRequiredBufferFromSelector:error:", v240, v282);
        v31 = objc_claimAutoreleasedReturnValue();
        obja = (id)v31;
        if (v31)
        {
          objc_msgSend(v279[7], "allAestheticsAttributeScores:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v274, "VNRequiredBufferFromSelector:error:", v196, v282);
          v33 = objc_claimAutoreleasedReturnValue();
          v254 = (void *)v33;
          if (v33)
          {
            objc_msgSend(v279[7], "allAestheticsGlobalScores:", v33);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v268, "observationsRecipient");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v232, "originatingRequestSpecifier");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("aesthetic_score"));
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v215, "floatValue");
            v224 = v34;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("subject_framing"));
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "floatValue");
            v223 = v35;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("background"));
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "floatValue");
            v222 = v36;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("blur"));
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v210, "floatValue");
            v221 = v37;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("subject_sharpness"));
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "floatValue");
            v220 = v38;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("timing"));
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "floatValue");
            v219 = v39;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("lightning"));
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v205, "floatValue");
            v218 = v40;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("reflections"));
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "floatValue");
            v217 = v41;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("color_harmony"));
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v203, "floatValue");
            v216 = v42;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("color_brightness"));
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "floatValue");
            v214 = v43;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("symmetry"));
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "floatValue");
            v211 = v44;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("repetition"));
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v200, "floatValue");
            v208 = v45;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("immersive_feeling"));
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "floatValue");
            v206 = v46;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("perspective"));
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v198, "floatValue");
            v48 = v47;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("post_processing"));
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v197, "floatValue");
            v50 = v49;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("noise"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "floatValue");
            v53 = v52;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("failure"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "floatValue");
            v56 = v55;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("composition"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "floatValue");
            v59 = v58;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("interestingness"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "floatValue");
            v62 = v61;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("object_intrusion"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "floatValue");
            v65 = v64;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("tilt"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "floatValue");
            v68 = v67;
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("low_light"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "floatValue");
            v194 = __PAIR64__(v70, v68);
            LODWORD(v71) = v217;
            LODWORD(v72) = v224;
            LODWORD(v74) = v222;
            LODWORD(v73) = v223;
            LODWORD(v76) = v220;
            LODWORD(v75) = v221;
            LODWORD(v78) = v218;
            LODWORD(v77) = v219;
            +[VNImageAestheticsObservation observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:](VNImageAestheticsObservation, "observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:", v244, v282, v72, v73, v74, v75, v76, v77, v78, v71, __PAIR64__(v214, v216), __PAIR64__(v208, v211), __PAIR64__(v48, v206),
              __PAIR64__(v53, v50),
              __PAIR64__(v59, v56),
              __PAIR64__(v65, v62),
              v194);
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            if (v79)
            {
              v326[0] = v79;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v326, 1);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v232, "receiveObservations:", v80);
            }
            else
            {
              v80 = 0;
            }

          }
          else
          {
            v80 = 0;
          }

        }
        else
        {
          v80 = 0;
        }

        if (!v80)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v80);

        ++v30;
      }
      while (v234 != v30);
      v27 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v299, v319, 16);
      v28 = &selRef_initWithCVImageBuffer_;
      v29 = &selRef_initWithCVImageBuffer_;
    }
    while (v27);
  }

  v297 = 0u;
  v298 = 0u;
  v295 = 0u;
  v296 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v295, v318, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v296;
    v84 = &selRef_initWithCVImageBuffer_;
    do
    {
      v85 = 0;
      v86 = (uint64_t)v84[44];
      do
      {
        if (*(_QWORD *)v296 != v83)
          objc_enumerationMutation(v81);
        v87 = *(id *)(*((_QWORD *)&v295 + 1) + 8 * v85);
        v88 = v281;
        v89 = v259;
        -[VNCoreSceneUnderstandingDetector _processSaliencyConfiguration:fromSaliencyMapProvidedBySelector:ofSceneNetOutput:regionOfInterest:options:qosClass:saliencyGeneratorType:error:](v279, v87, v86, v88, v89, a4, CFSTR("VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType"), (uint64_t)v282, a6, a7, a8, a9);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v90)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v90);

        ++v85;
      }
      while (v82 != v85);
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v295, v318, 16);
      v84 = &selRef_initWithCVImageBuffer_;
    }
    while (v82);
  }

  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v291, v317, 16);
  if (v92)
  {
    v93 = *(_QWORD *)v292;
    v94 = &selRef_initWithCVImageBuffer_;
    do
    {
      v95 = 0;
      v96 = (uint64_t)v94[45];
      do
      {
        if (*(_QWORD *)v292 != v93)
          objc_enumerationMutation(v91);
        v97 = *(id *)(*((_QWORD *)&v291 + 1) + 8 * v95);
        v98 = v281;
        v99 = v259;
        -[VNCoreSceneUnderstandingDetector _processSaliencyConfiguration:fromSaliencyMapProvidedBySelector:ofSceneNetOutput:regionOfInterest:options:qosClass:saliencyGeneratorType:error:](v279, v97, v96, v98, v99, a4, CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), (uint64_t)v282, a6, a7, a8, a9);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v100)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v100);

        ++v95;
      }
      while (v92 != v95);
      v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v291, v317, 16);
      v94 = &selRef_initWithCVImageBuffer_;
    }
    while (v92);
  }

  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
  v229 = (id)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v287, v316, 16);
  if (v101)
  {
    v235 = *(_QWORD *)v288;
    v102 = &selRef_initWithCVImageBuffer_;
    v103 = &selRef_initWithCVImageBuffer_;
    do
    {
      v104 = 0;
      v237 = v102[46];
      v231 = v103[47];
      v233 = v101;
      do
      {
        if (*(_QWORD *)v288 != v235)
          objc_enumerationMutation(v229);
        v105 = *(id *)(*((_QWORD *)&v287 + 1) + 8 * v104);
        v106 = v281;
        v269 = v105;
        objb = v106;
        objc_msgSend(v106, "VNRequiredBufferFromSelector:error:", v237, v282);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        if (v275)
        {
          objc_msgSend(v106, "VNRequiredBufferFromSelector:error:", v231, v282);
          v107 = objc_claimAutoreleasedReturnValue();
          v255 = (void *)v107;
          if (v107)
          {
            objc_msgSend(v279[7], "detectionResultFromScoreHeatMap:coordinateOffsetMap:", v275, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "observationsRecipient");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v241, "originatingRequestSpecifier");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v108, "count"));
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __96__VNCoreSceneUnderstandingDetector__processRecognizedObjectsConfiguration_sceneNetOutput_error___block_invoke;
            aBlock[3] = &unk_1E4546FE0;
            v250 = v109;
            v324 = v250;
            v245 = v110;
            v325 = v245;
            v111 = (void (**)(void *, void *))_Block_copy(aBlock);
            objc_msgSend(v269, "disallowedList");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v269, "minimumDetectionConfidence");
            v114 = v113;
            objc_msgSend((id)objc_opt_class(), "_specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:", v250);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v329 = 0u;
            v330 = 0u;
            v327 = 0u;
            v328 = 0u;
            v116 = v108;
            v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v327, v326, 16);
            if (v117)
            {
              v118 = *(_QWORD *)v328;
              do
              {
                for (j = 0; j != v117; ++j)
                {
                  if (*(_QWORD *)v328 != v118)
                    objc_enumerationMutation(v116);
                  v120 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * j);
                  objc_msgSend(v120, "score");
                  v122 = v121;
                  if (v121 >= v114)
                  {
                    objc_msgSend(v120, "label");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v112, "containsIdentifier:", v123) & 1) == 0)
                    {
                      objc_msgSend(v120, "box");
                      v332.origin.y = 1.0 - v124 - v332.size.height;
                      v334.origin.x = 0.0;
                      v334.origin.y = 0.0;
                      v334.size.width = 1.0;
                      v334.size.height = 1.0;
                      v333 = CGRectIntersection(v332, v334);
                      x = v333.origin.x;
                      y = v333.origin.y;
                      width = v333.size.width;
                      height = v333.size.height;
                      v111[2](v111, v123);
                      objc_msgSend(v115, "objectForKeyedSubscript:", v123);
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v129)
                        ((void (*)(void (**)(void *, void *), void *, double, double, double, double, float))v111[2])(v111, v129, x, y, width, height, v122);

                    }
                  }
                }
                v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v327, v326, 16);
              }
              while (v117);
            }

            v130 = &__block_literal_global_91_33192;
            objc_msgSend(v245, "sortWithOptions:usingComparator:", 16, &__block_literal_global_91_33192);

            objc_msgSend(v241, "receiveObservations:", v245);
            v131 = v245;

          }
          else
          {
            v131 = 0;
          }

        }
        else
        {
          v131 = 0;
        }

        if (!v131)
        {

          goto LABEL_156;
        }
        objc_msgSend(v280, "addObjectsFromArray:", v131);

        ++v104;
      }
      while (v104 != v233);
      v101 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v287, v316, 16);
      v102 = &selRef_initWithCVImageBuffer_;
      v103 = &selRef_initWithCVImageBuffer_;
    }
    while (v101);
  }

  v285 = 0u;
  v286 = 0u;
  v283 = 0u;
  v284 = 0u;
  objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"));
  v238 = (id)objc_claimAutoreleasedReturnValue();
  v246 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v283, v315, 16);
  if (!v246)
  {
LABEL_109:

    objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = -[VNCoreSceneUnderstandingDetector _processJunkConfigurations:VN5kJNH3eYuyaLxNpZr5Z7ziConfigurations:significantEventConfigurations:cityNatureConfigurations:forSceneNetOutput:collectedObservations:error:](v279, v156, v157, v158, v159, v281, v280, v282);

    if ((v160 & 1) == 0)
      goto LABEL_156;
    v161 = v280;
    goto LABEL_157;
  }
  v242 = *(_QWORD *)v284;
  v132 = &selRef_initWithCVImageBuffer_;
LABEL_80:
  v276 = 0;
  v251 = v132[48];
  while (1)
  {
    if (*(_QWORD *)v284 != v242)
      objc_enumerationMutation(v238);
    v270 = *(id *)(*((_QWORD *)&v283 + 1) + 8 * v276);
    objc = v281;
    objc_msgSend(objc, "VNRequiredBufferFromSelector:error:", v251, v282);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      v256 = v133;
      objc_msgSend(v279[7], "hashesFromFingerprintEmbedding:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v329 = 0u;
      v330 = 0u;
      v327 = 0u;
      v328 = 0u;
      v136 = v134;
      v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v327, v326, 16);
      if (!v137)
        goto LABEL_104;
      v138 = *(_QWORD *)v328;
      while (1)
      {
        for (k = 0; k != v137; ++k)
        {
          if (*(_QWORD *)v328 != v138)
            objc_enumerationMutation(v136);
          v140 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v327 + 1) + 8 * k));
          v141 = (const void *)objc_msgSend(v140, "bytes");
          v142 = objc_msgSend(v140, "length");
          v143 = v142;
          if ((unint64_t)v142 < 4)
          {
            v144 = 0;
LABEL_97:
            v148 = 0;
            v150 = 0;
            goto LABEL_98;
          }
          if (v142 < 0)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v145 = v142 >> 2;
          v144 = std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v142 >> 2);
          v146 = v143 & 0xFFFFFFFFFFFFFFFCLL;
          memmove(v144, v141, v146);
          if (!v146)
            goto LABEL_97;
          if ((v146 & 0x8000000000000000) != 0)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v147 = (char *)operator new(v145);
          v148 = v147;
          v149 = 0;
          do
          {
            v147[v149] = (int)*((float *)v144 + v149);
            ++v149;
            v146 -= 4;
          }
          while (v146);
          v150 = &v147[v149];
LABEL_98:
          v151 = -[VNFingerprintHash initWithBooleanBytes:length:]([VNFingerprintHash alloc], "initWithBooleanBytes:length:", v148, v150 - v148);
          objc_msgSend(v135, "addObject:", v151);

          if (v148)
            operator delete(v148);
          if (v144)
            operator delete(v144);
        }
        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v327, v326, 16);
        if (!v137)
        {
LABEL_104:

          objc_msgSend(v270, "observationsRecipient");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "originatingRequestSpecifier");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = -[VNImageFingerprintsObservation initWithOriginatingRequestSpecifier:fingerprintHashes:]([VNImageFingerprintsObservation alloc], "initWithOriginatingRequestSpecifier:fingerprintHashes:", v153, v135);
          aBlock[0] = v154;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", aBlock, 1);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "receiveObservations:", v155);

          v133 = v256;
          goto LABEL_106;
        }
      }
    }
    v155 = 0;
LABEL_106:

    if (!v155)
      break;
    objc_msgSend(v280, "addObjectsFromArray:", v155);

    if (++v276 == v246)
    {
      v246 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v283, v315, 16);
      v132 = &selRef_initWithCVImageBuffer_;
      if (!v246)
        goto LABEL_109;
      goto LABEL_80;
    }
  }

LABEL_156:
  v161 = 0;
LABEL_157:

LABEL_158:
LABEL_159:

  return v161;
}

- (uint64_t)_processJunkConfigurations:(void *)a3 VN5kJNH3eYuyaLxNpZr5Z7ziConfigurations:(void *)a4 significantEventConfigurations:(void *)a5 cityNatureConfigurations:(void *)a6 forSceneNetOutput:(void *)a7 collectedObservations:(_QWORD *)a8 error:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v32 = a4;
  v31 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v17, "scenePrint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v20 = a1[17];
    v36[0] = a1[16];
    v36[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v21, v19, v15, v18, a8);

    if (!v22)
      goto LABEL_10;
  }
  if (objc_msgSend(v16, "count", v31))
  {
    v35 = a1[18];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v23, v19, v16, v18, a8);

    if (!v24)
      goto LABEL_10;
  }
  if (objc_msgSend(v32, "count"))
  {
    v34 = a1[19];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v25, v19, v32, v18, a8);

    if (!v26)
      goto LABEL_10;
  }
  if (objc_msgSend(v31, "count")
    && (v33 = a1[20],
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v27, v19, v31, v18, a8), v27, !v28))
  {
LABEL_10:
    v29 = 0;
  }
  else
  {
    v29 = 1;
  }

  return v29;
}

- (BOOL)_runSceneNetCustomClassifiers:(void *)a1 onSceneprintBuffer:(void *)a2 forConfigurations:(void *)a3 collectedObservations:(void *)a4 error:(_QWORD *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  id v37;
  void *v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v30 = a2;
  v31 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  v29 = v12;
  if (v13)
  {
    v14 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__29_23236;
        v45 = __Block_byref_object_dispose__30_23237;
        v46 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke;
        aBlock[3] = &unk_1E4547030;
        v40 = &v41;
        v37 = v31;
        v38 = v16;
        v39 = v11;
        v17 = _Block_copy(aBlock);
        objc_msgSend(v16, "runOnInputScenePrint:completion:", v30, v17);
        v18 = (void *)v42[5];
        if (v18 && a5)
          *a5 = objc_retainAutorelease(v18);
        v19 = v18 == 0;

        _Block_object_dispose(&v41, 8);
        if (!v19)
        {
          v20 = v29;
          goto LABEL_21;
        }
        v12 = v29;
      }
      v13 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v13)
        continue;
      break;
    }
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v31;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = &__block_literal_global_88;
        objc_msgSend(v25, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

        objc_msgSend(v24, "observationsRecipient");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "receiveObservations:", v25);
        objc_msgSend(v10, "addObjectsFromArray:", v25);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
    }
    while (v21);
  }
  v19 = 1;
LABEL_21:

  return v19;
}

void __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id obj;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = a3;
  v21 = v5;
  if (v20)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "classificationLikelihoods", 0, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = *(id *)(a1 + 32);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v6)
    {
      v23 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v8, "observationsRecipient");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "originatingRequestSpecifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke_2;
          aBlock[3] = &unk_1E4547008;
          v12 = v10;
          v27 = v12;
          v13 = v11;
          v28 = v13;
          v14 = _Block_copy(aBlock);
          v15 = *(void **)(a1 + 40);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v25 = *(id *)(v16 + 40);
          v17 = objc_msgSend(v15, "enumerateClassificationLikelihoods:usingBlock:error:", v24, v14, &v25);
          objc_storeStrong((id *)(v16 + 40), v25);
          if ((v17 & 1) == 0)
          {

            goto LABEL_16;
          }
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "addObjectsFromArray:", v13);
          }
          else
          {
            v19 = v13;
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v19, v8);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

void __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  VNClassificationObservation *v5;
  double v6;
  VNClassificationObservation *v7;
  id v8;

  v8 = a2;
  v5 = [VNClassificationObservation alloc];
  *(float *)&v6 = a3;
  v7 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v5, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", *(_QWORD *)(a1 + 32), v8, 0, v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __96__VNCoreSceneUnderstandingDetector__processRecognizedObjectsConfiguration_sceneNetOutput_error___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, float a7)
{
  id v13;
  VNClassificationObservation *v14;
  double v15;
  VNClassificationObservation *v16;
  VNRecognizedObjectObservation *v17;
  uint64_t v18;
  void *v19;
  double v20;
  VNRecognizedObjectObservation *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = [VNClassificationObservation alloc];
  *(float *)&v15 = a7;
  v16 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v14, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", *(_QWORD *)(a1 + 32), v13, 0, v15);
  v17 = [VNRecognizedObjectObservation alloc];
  v18 = *(_QWORD *)(a1 + 32);
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v20 = a7;
  v21 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v17, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v18, v19, 0, 0, a3, a4, a5, a6, v20);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
}

- (id)_processSaliencyConfiguration:(uint64_t)a3 fromSaliencyMapProvidedBySelector:(void *)a4 ofSceneNetOutput:(void *)a5 regionOfInterest:(uint64_t)a6 options:(void *)a7 qosClass:(uint64_t)a8 saliencyGeneratorType:(double)a9 error:(double)a10
{
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  VNSaliencyImageObservation *v34;
  void *v35;
  void *v37;
  VNImageBuffer *v38;
  void *v39;
  __CVBuffer *texture;
  void *v41;
  void *v42;
  VNSaliencyImageObservation *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v23 = a4;
  v24 = a5;
  v25 = a7;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v24, a8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v23, "VNRequiredBufferFromSelector:error:", a3, a8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v22, "observationsRecipient");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "originatingRequestSpecifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      texture = (__CVBuffer *)objc_msgSend(a1[7], "pixelBufferForSaliencyMap:error:", v27, a8);
      if (texture)
      {
        v38 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", texture, 1, v24, v26);
        v41 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v24);
        objc_msgSend(v26, "detectorOfType:configuredWithOptions:error:", v25);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v44[0] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v28, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

          objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
          if (objc_msgSend(v42, "observationProvidesBoundsNormalizedToROI"))
            v30 = 0.0;
          else
            v30 = a9;
          objc_msgSend(v37, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a6, v41, 0, a8, 0, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(a1, "validatedImageBufferFromOptions:error:", v24, a8);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              v34 = -[VNSaliencyImageObservation initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:]([VNSaliencyImageObservation alloc], "initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:", v42, texture, v31, a11 * (double)(unint64_t)objc_msgSend(v32, "width"), a12 * (double)(unint64_t)objc_msgSend(v32, "height"));
              v43 = v34;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "receiveObservations:", v35);

            }
            else
            {
              v35 = 0;
            }

          }
          else
          {
            v35 = 0;
          }

        }
        else
        {
          v35 = 0;
        }

        CVPixelBufferRelease(texture);
      }
      else
      {
        v35 = 0;
      }

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_entityNetTaxonomyForSession:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v5 = a2;
  v6 = *(void **)(a1 + 72);
  if (!v6)
  {
    v13 = 0;
    objc_msgSend(*(id *)(a1 + 56), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[VNCoreSceneUnderstandingDetector _getEntityNetTaxonomy:forCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v13, v7, v5, a3);
    v9 = v13;

    if (!v8)
    {

      v11 = 0;
      goto LABEL_5;
    }
    v10 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v9;

    v6 = *(void **)(a1 + 72);
  }
  v11 = v6;
LABEL_5:

  return v11;
}

- (id)_CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:(uint64_t)a1 observations:(void *)a2 minimumConfidence:(void *)a3 disallowedList:(void *)a4 taxonomy:(void *)a5 originatingRequestSpecifier:(float)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  float v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke;
  v22[3] = &unk_1E4546FB8;
  v28 = a6;
  v15 = v12;
  v23 = v15;
  v16 = v13;
  v24 = v16;
  v17 = v14;
  v25 = v17;
  v18 = v11;
  v26 = v18;
  v27 = a1;
  v19 = _Block_copy(v22);
  v20 = _Block_copy(v19);

  return v20;
}

void __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  VNClassificationObservation *(*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  float v15;

  v5 = a2;
  if (*(float *)(a1 + 72) <= a3 && (objc_msgSend(*(id *)(a1 + 32), "containsIdentifier:", v5) & 1) == 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke_2;
    v11 = &unk_1E4546F90;
    v12 = *(id *)(a1 + 40);
    v13 = v5;
    v14 = *(id *)(a1 + 48);
    v15 = a3;
    v6 = _Block_copy(&v8);
    *(float *)&v7 = a3;
    objc_msgSend(*(id *)(a1 + 56), "VNInsertObservationWithConfidence:limitedToN:providedByBlock:", *(_QWORD *)(a1 + 64), v6, v7, v8, v9, v10, v11);

  }
}

VNClassificationObservation *__189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  VNClassificationObservation *v3;
  double v4;
  VNClassificationObservation *v5;

  objc_msgSend(*(id *)(a1 + 32), "classificationMetricsForLabel:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [VNClassificationObservation alloc];
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  v5 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v3, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v2, v4);

  return v5;
}

+ (BOOL)_getEntityNetTaxonomy:(void *)a3 forCSUSceneNetV5Configuration:(void *)a4 session:(uint64_t)a5 error:
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  _QWORD aBlock[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_opt_self();
  objc_msgSend(v8, "entityNetVocabularyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__VNCoreSceneUnderstandingDetector__getEntityNetTaxonomy_forCSUSceneNetV5Configuration_session_error___block_invoke;
    aBlock[3] = &unk_1E4546F20;
    v12 = v8;
    v23 = v12;
    v24 = v11;
    v13 = _Block_copy(aBlock);
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "revision"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@.SceneNetV5.%@.entityNetTaxonomy"), v15, v16);

    objc_msgSend(v9, "resourceObjectForIdentifier:creationBlock:error:", v17, v13, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v18 != 0;
    if (v18)
      *a2 = objc_retainAutorelease(v18);

  }
  else
  {
    *a2 = 0;
    v20 = 1;
  }

  return v20;
}

id __102__VNCoreSceneUnderstandingDetector__getEntityNetTaxonomy_forCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneTaxonomyWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:vocabularyNames:error:](VNCoreSceneUnderstandingDetectorTaxonomy, "taxonomyForCSUTaxonomy:vocabularyNames:error:", v4, v5, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sceneNetTaxonomyForSession:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 64);
  if (v6)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 56), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, v7, v5, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v8;

  v6 = *(void **)(a1 + 64);
  if (v6)
LABEL_3:
    v10 = v6;
  else
    v10 = 0;

  return v10;
}

+ (id)_sceneNetTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;

  v6 = a2;
  v7 = a3;
  v8 = (objc_class *)objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VNCoreSceneUnderstandingDetector__sceneNetTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke;
  aBlock[3] = &unk_1E4547660;
  v9 = v6;
  v18 = v9;
  v10 = _Block_copy(aBlock);
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "revision"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.SceneNetV5.%@.sceneTaxonomy"), v12, v13);

  objc_msgSend(v7, "resourceObjectForIdentifier:creationBlock:error:", v14, v10, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __97__VNCoreSceneUnderstandingDetector__sceneNetTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneTaxonomyWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "leafSceneClassificationVocabularyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(*(id *)(a1 + 32), "hierarchicalSceneClassificationVocabularyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:vocabularyNames:error:](VNCoreSceneUnderstandingDetectorTaxonomy, "taxonomyForCSUTaxonomy:vocabularyNames:error:", v4, v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __141__VNCoreSceneUnderstandingDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  __int128 *v101;
  _QWORD aBlock[5];
  id v103;
  id v104;
  id v105;
  __int128 *v106;
  BOOL v107;
  BOOL v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v62 = a1;
  v5 = *(id *)(a1 + 40);
  v63 = v3;
  v64 = v4;
  v65 = v5;
  v78 = (uint64_t)v2;
  if (!v2)
  {
    v58 = 0;
    goto LABEL_47;
  }
  VNRecordImageTilingWarning(v64, objc_msgSend(v5, "tileColumnsCount"), objc_msgSend(v5, "tileRowsCount"));
  v6 = v5;
  v67 = v63;
  objc_msgSend(v2, "validatedImageBufferFromOptions:error:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "count");
    v10 = v9 != 0;

    if (v9)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"), v62);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    else
      v18 = 0;
    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = &v87;
    *(_QWORD *)&v88 = 0x3032000000;
    *((_QWORD *)&v88 + 1) = __Block_byref_object_copy__29_23236;
    *(_QWORD *)&v89 = __Block_byref_object_dispose__30_23237;
    *((_QWORD *)&v89 + 1) = 0;
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke;
    aBlock[3] = &unk_1E45470C0;
    v107 = v10;
    v106 = &v87;
    aBlock[4] = v78;
    v20 = v11;
    v103 = v20;
    v21 = v9;
    v104 = v21;
    v108 = v17 != 0;
    v22 = v18;
    v105 = v22;
    v23 = _Block_copy(aBlock);
    v93 = v19;
    v94 = 3221225472;
    v95 = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_6;
    v96 = &unk_1E45470E8;
    v97 = v7;
    v98 = v78;
    v99 = v67;
    v101 = &v87;
    v24 = v23;
    v100 = v24;
    objc_msgSend(v6, "enumerateTilesUsingBlock:", &v93);
    v25 = *(void **)(*((_QWORD *)&v87 + 1) + 40);
    v15 = v25 == 0;
    if (v25)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      if (a2)
        *a2 = objc_retainAutorelease(v25);
    }
    else
    {
      v12 = objc_retainAutorelease(v20);
      v13 = objc_retainAutorelease(v21);
      v14 = objc_retainAutorelease(v22);
    }

    _Block_object_dispose(&v87, 8);
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }

  v71 = v12;
  v72 = v13;
  v66 = v14;
  if (v15)
  {
    +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v67, a2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v74)
    {
      v58 = 0;
LABEL_45:

      goto LABEL_46;
    }
    v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v26;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, aBlock, 16);
    if (v27)
    {
      v69 = *(_QWORD *)v88;
LABEL_19:
      v28 = 0;
      v68 = v27;
      while (1)
      {
        if (*(_QWORD *)v88 != v69)
          objc_enumerationMutation(v26);
        v29 = *(id *)(*((_QWORD *)&v87 + 1) + 8 * v28);
        v30 = v71;
        v81 = v72;
        v31 = v74;
        v79 = v30;
        -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:](v78, v31, (uint64_t)a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v29, "observationsRecipient");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "originatingRequestSpecifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "disallowedList");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "minimumConfidence");
          v36 = v35;
          v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](objc_msgSend(v29, "maximumLeafClassifications"), v37, v34, v32, v33, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = MEMORY[0x1E0C809B0];
          v94 = 3221225472;
          v95 = __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke;
          v96 = &unk_1E4547110;
          v39 = v38;
          v97 = v39;
          objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", &v93);
          v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](objc_msgSend(v29, "maximumHierarchicalClassifications"), v40, v34, v32, v33, v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)&v83 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v83 + 1) = 3221225472;
          *(_QWORD *)&v84 = __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke_2;
          *((_QWORD *)&v84 + 1) = &unk_1E4547110;
          v42 = v41;
          *(_QWORD *)&v85 = v42;
          objc_msgSend(v81, "enumerateKeysAndObjectsUsingBlock:", &v83);
          objc_msgSend(v37, "addObjectsFromArray:", v40);
          v43 = &__block_literal_global_88;
          objc_msgSend(v37, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

          objc_msgSend(v75, "receiveObservations:", v37);
        }
        else
        {
          v37 = 0;
        }

        if (!v37)
          break;
        objc_msgSend(v73, "addObjectsFromArray:", v37);

        ++v28;
        v26 = obj;
        if (v68 == v28)
        {
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, aBlock, 16);
          if (v27)
            goto LABEL_19;
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, &v93, 16);
      if (!v44)
      {
LABEL_39:

        v58 = v73;
LABEL_44:

        goto LABEL_45;
      }
      v80 = *(_QWORD *)v84;
LABEL_30:
      v76 = v44;
      v45 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v80)
          objc_enumerationMutation(obj);
        v46 = *(id *)(*((_QWORD *)&v83 + 1) + 8 * v45);
        v82 = v66;
        v47 = v74;
        -[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:](v78, v47, (uint64_t)a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          objc_msgSend(v46, "observationsRecipient");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "originatingRequestSpecifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "disallowedList");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "minimumConfidence");
          v53 = v52;
          v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](objc_msgSend(v46, "maximumClassifications"), v54, v51, v48, v50, v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __128__VNCoreSceneUnderstandingDetector__processEntityNetClassificationConfiguration_forTiledBestEntityNetConfidences_session_error___block_invoke;
          v91[3] = &unk_1E4547110;
          v56 = v55;
          v92 = v56;
          objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", v91);
          v57 = &__block_literal_global_88;
          objc_msgSend(v54, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);

          objc_msgSend(v49, "receiveObservations:", v54);
        }
        else
        {
          v54 = 0;
        }

        if (!v54)
          break;
        objc_msgSend(v73, "addObjectsFromArray:", v54);

        if (v76 == ++v45)
        {
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, &v93, 16);
          if (v44)
            goto LABEL_30;
          goto LABEL_39;
        }
      }
    }

    v58 = 0;
    goto LABEL_44;
  }
  v58 = 0;
LABEL_46:

LABEL_47:
  v59 = *(_QWORD *)(*(_QWORD *)(v62 + 64) + 8);
  v60 = *(void **)(v59 + 40);
  *(_QWORD *)(v59 + 40) = v58;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v62 + 64) + 8) + 40) != 0;
}

void __128__VNCoreSceneUnderstandingDetector__processEntityNetClassificationConfiguration_forTiledBestEntityNetConfidences_session_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "floatValue");
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);

}

void __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "floatValue");
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);

}

void __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "floatValue");
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);

}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id obj;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v31[0] = *(id *)(v7 + 40);
      objc_msgSend(v5, "VNRequiredBufferFromSelector:error:", sel_sceneClassificationLikelihoods, v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v7 + 40), v31[0]);
      if (!v8)
        goto LABEL_11;
      v9 = *(void **)(a1 + 40);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v11 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_3;
      v28[3] = &unk_1E4547098;
      v30 = &__block_literal_global_316;
      v29 = v9;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v12 + 40);
      LOBYTE(v10) = objc_msgSend(v10, "enumerateLeafSceneClassificationLikelihoods:usingBlock:error:", v8, v28, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);

      if ((v10 & 1) == 0)
        goto LABEL_11;
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_4;
      v24[3] = &unk_1E4547098;
      v26 = &__block_literal_global_316;
      v25 = *(id *)(a1 + 48);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = *(id *)(v14 + 40);
      LOBYTE(v13) = objc_msgSend(v13, "enumerateHierarchicalSceneClassificationLikelihoods:usingBlock:error:", v8, v24, &v23);
      objc_storeStrong((id *)(v14 + 40), v23);

      if ((v13 & 1) == 0)
        goto LABEL_11;

    }
    if (!*(_BYTE *)(a1 + 73))
      goto LABEL_12;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(id *)(v15 + 40);
    objc_msgSend(v5, "VNRequiredBufferFromSelector:error:", sel_entityNetClassificationLikelihoods, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), v22);
    if (v8)
    {
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_5;
      v19[3] = &unk_1E4547098;
      v21 = &__block_literal_global_316;
      v20 = *(id *)(a1 + 56);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v18 = *(id *)(v17 + 40);
      objc_msgSend(v16, "enumerateEntityNetClassificationLikelihoods:usingBlock:error:", v8, v19, &v18);
      objc_storeStrong((id *)(v17 + 40), v18);

    }
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
LABEL_12:

}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_6(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CVBuffer *v14;
  id obj;

  v6 = a2;
  v8 = (void *)a1[4];
  v7 = a1[5];
  v9 = *(_QWORD *)(v7 + 96);
  v10 = *(_QWORD *)(v7 + 104);
  v11 = *(unsigned int *)(v7 + 88);
  objc_msgSend(v6, "pixelCropRect");
  v12 = a1[6];
  v13 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v13 + 40);
  v14 = (__CVBuffer *)objc_msgSend(v8, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v9, v10, v11, v12, &obj, 0);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (!v14
    || (objc_msgSend(*(id *)(a1[5] + 56), "runOnInputImage:completion:", v14, a1[7]),
        CVPixelBufferRelease(v14),
        *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40)))
  {
    *a4 = 1;
  }

}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_2(float a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7 || (objc_msgSend(v7, "floatValue"), *(float *)&v8 < a1))
  {
    *(float *)&v8 = a1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v11);

  }
}

uint64_t __68__VNCoreSceneUnderstandingDetector_warmUpSession_withOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "detectorOfType:configuredWithOptions:error:", v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "warmUpSession:withOptions:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a3);
  else
    v9 = 0;

  return v9;
}

- (uint64_t)_warmUpTaxonomiesForOptions:(void *)a3 inSession:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:](a1, v8, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_12;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13
      && (-[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:](a1, v8, a4),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          !v14))
    {
LABEL_12:
      a1 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (!v16)
        goto LABEL_11;
      v17 = v8;
      v18 = *(void **)(a1 + 80);
      if (v18)
        goto LABEL_9;
      objc_msgSend(*(id *)(a1 + 56), "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNCoreSceneUnderstandingDetector _detectedObjectTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, v19, v17, a4);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v20;

      v18 = *(void **)(a1 + 80);
      if (v18)
LABEL_9:
        a1 = v18;
      else
        a1 = 0;

      if (a1)
LABEL_11:
        a1 = 1;
    }
  }

  return a1;
}

+ (id)_detectedObjectTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;

  v6 = a2;
  v7 = a3;
  v8 = (objc_class *)objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VNCoreSceneUnderstandingDetector__detectedObjectTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke;
  aBlock[3] = &unk_1E4547660;
  v9 = v6;
  v18 = v9;
  v10 = _Block_copy(aBlock);
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "revision"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.SceneNetV5.%@.detectedObjectTaxonomy"), v12, v13);

  objc_msgSend(v7, "resourceObjectForIdentifier:creationBlock:error:", v14, v10, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __103__VNCoreSceneUnderstandingDetector__detectedObjectTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneTaxonomyWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "detectionVocabularyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:vocabularyNames:error:](VNCoreSceneUnderstandingDetectorTaxonomy, "taxonomyForCSUTaxonomy:vocabularyNames:error:", v4, v6, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (uint64_t)_getCSUSceneNetV5Configuration:(_QWORD *)a3 junkLeafConfiguration:(_QWORD *)a4 junkHierarchicalConfiguration:(_QWORD *)a5 VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(_QWORD *)a6 significantEventConfiguration:(_QWORD *)a7 cityNatureConfiguration:(void *)a8 forConfigurationOptions:(_QWORD *)a9 error:
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v33;
  void (**v34)(void *, void *);
  _QWORD aBlock[4];
  id v37;
  uint64_t v38;

  v14 = a8;
  v15 = (void *)objc_opt_self();
  objc_msgSend(v15, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v14, a9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v38 = 0;
    if (+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)v15, &v38, v14, a9))
    {
      v17 = v38;
      objc_msgSend(MEMORY[0x1E0D188D8], "sceneNetV5ConfigurationForRevision:error:", v38, a9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        v31 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v18, "setComputeDevice:", v16);
      if ((v17 | 2) == 3)
        objc_msgSend(v19, "setValue:forKey:", &unk_1E459E6E8, CFSTR("detectionNMSThreshold"));
      if (a2)
        *a2 = objc_retainAutorelease(v19);
      +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice](VNComputeDeviceUtilities, "mostPerformantCPUComputeDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __241__VNCoreSceneUnderstandingDetector__getCSUSceneNetV5Configuration_junkLeafConfiguration_junkHierarchicalConfiguration_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration_significantEventConfiguration_cityNatureConfiguration_forConfigurationOptions_error___block_invoke;
      aBlock[3] = &unk_1E4546EF8;
      v33 = v20;
      v37 = v33;
      v34 = (void (**)(void *, void *))_Block_copy(aBlock);
      if (a3)
      {
        v21 = (void *)objc_msgSend(v19, "newJunkLeafConfigurationAndReturnError:", a9);
        if (!v21)
          goto LABEL_25;
        v34[2](v34, v21);
        v22 = objc_retainAutorelease(v21);
        *a3 = v22;

      }
      if (a4)
      {
        v23 = (void *)objc_msgSend(v19, "newJunkHierarchicalConfigurationAndReturnError:", a9);
        if (!v23)
          goto LABEL_25;
        v34[2](v34, v23);
        v24 = objc_retainAutorelease(v23);
        *a4 = v24;

      }
      if (a5)
      {
        v25 = (void *)objc_msgSend(v19, "newClassifierBetaConfigurationAndReturnError:", a9);
        if (!v25)
          goto LABEL_25;
        v34[2](v34, v25);
        v26 = objc_retainAutorelease(v25);
        *a5 = v26;

      }
      if (a6)
      {
        v27 = (void *)objc_msgSend(v19, "newClassifierAlphaConfigurationAndReturnError:", a9);
        if (!v27)
          goto LABEL_25;
        v34[2](v34, v27);
        v28 = objc_retainAutorelease(v27);
        *a6 = v28;

      }
      if (!a7)
      {
LABEL_23:
        v31 = 1;
LABEL_26:

LABEL_28:
        goto LABEL_29;
      }
      v29 = (void *)objc_msgSend(v19, "newCityNatureConfigurationAndReturnError:", a9);
      if (v29)
      {
        v34[2](v34, v29);
        v30 = objc_retainAutorelease(v29);
        *a7 = v30;

        goto LABEL_23;
      }
LABEL_25:
      v31 = 0;
      goto LABEL_26;
    }
  }
  v31 = 0;
LABEL_29:

  return v31;
}

+ (BOOL)_getSceneNetV5ConfigurationRevision:(void *)a3 forConfigurationOptions:(_QWORD *)a4 error:
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, const __CFString *);
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = objc_opt_self();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__VNCoreSceneUnderstandingDetector__getSceneNetV5ConfigurationRevision_forConfigurationOptions_error___block_invoke;
  aBlock[3] = &unk_1E4546ED0;
  v9 = v6;
  v17 = v9;
  v19 = v7;
  v10 = v8;
  v18 = v10;
  v11 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
  v11[2](v11, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
  v12 = objc_msgSend(v10, "count");
  if (v12)
  {
    if (v12 == 1)
    {
      *a2 = objc_msgSend(v10, "firstIndex");
      v13 = 1;
    }
    else if (a4)
    {
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("The configuration options require multiple model revisions"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v9, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 != 0;
    if (v14)
      *a2 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestSpecifier:](v7, v14);

  }
  return v13;
}

uint64_t __241__VNCoreSceneUnderstandingDetector__getCSUSceneNetV5Configuration_junkLeafConfiguration_junkHierarchicalConfiguration_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration_significantEventConfiguration_cityNatureConfiguration_forConfigurationOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setComputeDevice:", *(_QWORD *)(a1 + 32));
}

void __102__VNCoreSceneUnderstandingDetector__getSceneNetV5ConfigurationRevision_forConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = objc_opt_self();
        objc_msgSend(v7, "observationsRecipient", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "originatingRequestSpecifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v11 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestSpecifier:](v8, v10);
        else
          v11 = 0;

        objc_msgSend(*(id *)(a1 + 40), "addIndex:", v11);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestSpecifier:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = (objc_class *)objc_msgSend(v2, "requestClassAndReturnError:", 0);
  if (v4)
    v5 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:](v3, v4, objc_msgSend(v2, "requestRevision"));
  else
    v5 = 0;

  return v5;
}

+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestClass:(unint64_t)a3 revision:
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  _QWORD *v14;
  void *v15;
  _BOOL4 v16;

  objc_opt_self();
  if (+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::onceToken != -1)
    dispatch_once(&+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::onceToken, &__block_literal_global_23411);
  v5 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD **)(v5 + 8);
  v8 = (_QWORD *)(v5 + 8);
  v7 = v9;
  if (!v9)
    goto LABEL_20;
  v10 = v8;
  do
  {
    v11 = (void *)v7[4];
    if (v6 == v11)
      v12 = v7[5] < a3;
    else
      v12 = v11 < v6;
    v13 = !v12;
    if (v12)
      v14 = v7 + 1;
    else
      v14 = v7;
    if (v13)
      v10 = v7;
    v7 = (_QWORD *)*v14;
  }
  while (*v14);
  if (v10 == v8 || ((v15 = (void *)v10[4], v15 != v6) ? (v16 = v6 < v15) : (v16 = v10[5] > a3), v16))
LABEL_20:
    v10 = v8;

  if ((_QWORD *)(+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap
                + 8) == v10)
    return 0;
  else
    return v10[6];
}

void __93__VNCoreSceneUnderstandingDetector__sceneNetV5ConfigurationRevisionForRequestClass_revision___block_invoke()
{
  _QWORD *v0;
  objc_class *v1;
  uint64_t **v2;
  uint64_t **v3;
  uint64_t **v4;
  objc_class *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t **v8;
  objc_class *v9;
  uint64_t **v10;
  objc_class *v11;
  uint64_t **v12;
  uint64_t **v13;
  objc_class *v14;
  uint64_t **v15;
  uint64_t **v16;
  objc_class *v17;
  uint64_t **v18;
  uint64_t **v19;
  uint64_t **v20;
  objc_class *v21;
  uint64_t **v22;
  uint64_t **v23;
  objc_class *v24;
  uint64_t **v25;
  objc_class *v26;
  uint64_t **v27;
  objc_class *v28;
  uint64_t **v29;
  uint64_t **v30;
  objc_class *v31;
  uint64_t **v32;
  objc_class *v33;
  uint64_t **v34;
  objc_class *v35;
  uint64_t **v36;
  objc_class *v37;
  uint64_t **v38;
  uint64_t *v39;
  uint64_t v40;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = v0 + 1;
  +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap = (uint64_t)v0;
  v1 = (objc_class *)objc_opt_class();
  v2 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v1);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v2, (unint64_t)v39, 3uLL, &v39)[6] = (uint64_t *)3;

  v3 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v1);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841671;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v3, (unint64_t)v39, 0xDECAF007uLL, &v39)[6] = (uint64_t *)3;

  v4 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v1);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841672;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v4, (unint64_t)v39, 0xDECAF008uLL, &v39)[6] = (uint64_t *)1;

  v5 = (objc_class *)objc_opt_class();
  v6 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v5);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v6, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v7 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v5);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841667;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v7, (unint64_t)v39, 0xDECAF003uLL, &v39)[6] = (uint64_t *)3;

  v8 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v5);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v8, (unint64_t)v39, 0xDECAF002uLL, &v39)[6] = (uint64_t *)3;

  v9 = (objc_class *)objc_opt_class();
  v10 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v9);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841665;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v10, (unint64_t)v39, 0xDECAF001uLL, &v39)[6] = (uint64_t *)3;

  v11 = (objc_class *)objc_opt_class();
  v12 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v11);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841669;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v12, (unint64_t)v39, 0xDECAF005uLL, &v39)[6] = (uint64_t *)3;

  v13 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v11);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841670;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v13, (unint64_t)v39, 0xDECAF006uLL, &v39)[6] = (uint64_t *)1;

  v14 = (objc_class *)objc_opt_class();
  v15 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v14);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841667;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v15, (unint64_t)v39, 0xDECAF003uLL, &v39)[6] = (uint64_t *)3;

  v16 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v14);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841668;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v16, (unint64_t)v39, 0xDECAF004uLL, &v39)[6] = (uint64_t *)1;

  v17 = (objc_class *)objc_opt_class();
  v18 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v17);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v18, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v19 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v17);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841668;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v19, (unint64_t)v39, 0xDECAF004uLL, &v39)[6] = (uint64_t *)1;

  v20 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v17);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841667;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v20, (unint64_t)v39, 0xDECAF003uLL, &v39)[6] = (uint64_t *)3;

  v21 = (objc_class *)objc_opt_class();
  v22 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v21);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v22, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v23 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v21);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841666;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v23, (unint64_t)v39, 0xDECAF002uLL, &v39)[6] = (uint64_t *)3;

  v24 = (objc_class *)objc_opt_class();
  v25 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v24);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v25, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v26 = (objc_class *)objc_opt_class();
  v27 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v26);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v27, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v28 = (objc_class *)objc_opt_class();
  v29 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v28);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841667;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v29, (unint64_t)v39, 0xDECAF003uLL, &v39)[6] = (uint64_t *)3;

  v30 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v28);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841668;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v30, (unint64_t)v39, 0xDECAF004uLL, &v39)[6] = (uint64_t *)1;

  v31 = (objc_class *)objc_opt_class();
  v32 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v31);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 3737841667;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v32, (unint64_t)v39, 0xDECAF003uLL, &v39)[6] = (uint64_t *)3;

  v33 = (objc_class *)objc_opt_class();
  v34 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v33);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 2;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v34, (unint64_t)v39, 2uLL, &v39)[6] = (uint64_t *)3;

  v35 = (objc_class *)objc_opt_class();
  v36 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v35);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v36, (unint64_t)v39, 1uLL, &v39)[6] = (uint64_t *)3;

  v37 = (objc_class *)objc_opt_class();
  v38 = (uint64_t **)+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  VNRequestClassFromClientSubclass(v37);
  v39 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  v40 = 1;
  std::__tree<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::__map_value_compare<std::tuple<objc_class * {__strong},unsigned long>,std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>,std::less<std::tuple<objc_class * {__strong},unsigned long>>,true>,std::allocator<std::__value_type<std::tuple<objc_class * {__strong},unsigned long>,CSUSceneNetV5ConfigurationRevision>>>::__emplace_unique_key_args<std::tuple<objc_class * {__strong},unsigned long>,std::piecewise_construct_t const&,std::tuple<std::tuple<objc_class * {__strong},unsigned long>&&>,std::tuple<>>(v38, (unint64_t)v39, 1uLL, &v39)[6] = (uint64_t *)3;

}

+ (id)_specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "specifiesRequestClass:revision:", objc_opt_class(), 3737841667))
  {
    if (+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::onceToken != -1)
      dispatch_once(&+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::onceToken, &__block_literal_global_227);
    v4 = (id)+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNComputeStagePostProcessing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, CFSTR("VNComputeStageMain"), 0);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  }

  return v4;
}

+ (id)allClassificationIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  v6 = a3;
  +[VNCoreSceneUnderstandingDetector _globalOrProvidedSessionInOptions:error:]((uint64_t)a1, v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = 0;
    v8 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, &v21, 0, 0, 0, 0, 0, v6, a4);
    v9 = v21;
    if ((v8 & 1) == 0)
    {
      v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
    {
      +[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, v9, v7, (uint64_t)a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "disallowedList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "labelsFilteredByDisallowedList:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 1)
      {
        v20 = 0;
        v15 = +[VNCoreSceneUnderstandingDetector _getEntityNetTaxonomy:forCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, &v20, v9, v7, (uint64_t)a4);
        v16 = v20;
        v13 = v16;
        if (v15)
        {
          if (v16)
          {
            objc_msgSend(v11, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "disallowedList");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "labelsFilteredByDisallowedList:", v18);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          if (a4)
          {
            +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("classification is not supported"));
            v14 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        v14 = 0;
        goto LABEL_18;
      }
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("incorrect classification configurations"));
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    v14 = 0;
    goto LABEL_19;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

+ (id)allRecognizedObjectIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[VNCoreSceneUnderstandingDetector _globalOrProvidedSessionInOptions:error:]((uint64_t)a1, v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v9 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, &v33, 0, 0, 0, 0, 0, v6, a4);
      v10 = v33;
      v27 = v10;
      if ((v9 & 1) != 0)
      {
        +[VNCoreSceneUnderstandingDetector _detectedObjectTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, v10, v7, (uint64_t)a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v11;
        if (v11)
        {
          objc_msgSend(v11, "labels");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v28, "observationsRecipient");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "originatingRequestSpecifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "_specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v17 = v15;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v30 != v19)
                    objc_enumerationMutation(v17);
                  v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                  if (objc_msgSend(v13, "containsObject:", v21))
                  {
                    objc_msgSend(v17, "objectForKeyedSubscript:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (id)objc_msgSend(v13, "arrayByAddingObject:", v22);

                  }
                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
              }
              while (v18);
            }

          }
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("incorrect recognized objects configurations"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v11;

  v6 = a3;
  v11 = 0;
  v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, &v11, 0, 0, v6, a4);
  v8 = v11;
  if ((v7 & 1) != 0)
  {
    +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)allSignificantEventIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v11;

  v6 = a3;
  v11 = 0;
  v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, 0, &v11, 0, v6, a4);
  v8 = v11;
  if ((v7 & 1) != 0)
  {
    +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)allCityNatureIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  id v11;

  v6 = a3;
  v11 = 0;
  v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, 0, 0, &v11, v6, a4);
  v8 = v11;
  if ((v7 & 1) != 0)
  {
    +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VNCoreSceneUnderstandingDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  objc_msgSendSuper2(&v10, sel_keyForDetectorWithConfigurationOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)a1, &v9, v4, 0))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@:%lu"), v5, v9);

    v5 = (void *)v7;
  }

  return v5;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString **v17;
  id v18;
  __CFString *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD aBlock[5];
  uint64_t v27;

  v6 = a3;
  v27 = 0;
  if (+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)a1, &v27, v6, a4))
  {
    if (+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::onceToken != -1)
      dispatch_once(&+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::onceToken, &__block_literal_global_336);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e9__16__0__8l;
    v7 = v27;
    aBlock[4] = v27;
    v8 = _Block_copy(aBlock);
    v9 = (void *)+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::sceneNetConfigurationCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForIdentifier:creationBlock:error:", v10, v8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "supportedComputeDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNComputeStageMain"));

    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v18 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v16 = v14;
    objc_opt_self();
    if ((objc_msgSend(v16, "specifiesRequestClass:", objc_opt_class()) & 1) != 0)
    {
      v17 = VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType;
    }
    else
    {
      if (!objc_msgSend(v16, "specifiesRequestClass:", objc_opt_class()))
      {
        v19 = 0;
        goto LABEL_19;
      }
      v17 = VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType;
    }
    v19 = *v17;

    if (!v19)
    {
LABEL_20:
      v18 = v12;
      goto LABEL_21;
    }
    v20 = (void *)objc_msgSend(a1, "_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:", v6);
    v21 = +[VNDetector detectorClassForDetectorType:configuredWithOptions:error:](VNDetector, "detectorClassForDetectorType:configuredWithOptions:error:", v19, v20, a4);
    if (!v21
      || (-[objc_class supportedComputeStageDevicesForOptions:error:](v21, "supportedComputeStageDevicesForOptions:error:", v6, a4), v22 = (void *)objc_claimAutoreleasedReturnValue(), (v23 = v22) == 0))
    {

      v18 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("VNComputeStagePostProcessing"));

    v16 = v20;
LABEL_19:

    goto LABEL_20;
  }
  v18 = 0;
LABEL_24:

  return v18;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459CE08, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  VNSupportedImageSize *v8;
  void *v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v4 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v11, 0, 0, 0, 0, 0, a3, a4);
  v5 = v11;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "inputPixelBufferDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", objc_msgSend(v7, "pixelFormat"), objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 1, 0, 0);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D188D8], "sceneNetV5ConfigurationForRevision:error:", *(_QWORD *)(a1 + 32), a2);
}

void __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC6CA0]);
  v1 = (void *)+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::sceneNetConfigurationCache;
  +[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::sceneNetConfigurationCache = (uint64_t)v0;

}

void __73__VNCoreSceneUnderstandingDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_EspressoPlanPriority"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

+ (id)_identifiersSupportedByCustomClassifierConfiguration:(uint64_t)a3 error:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "taxonomyWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "vocabularyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__VNCoreSceneUnderstandingDetector__identifiersSupportedByCustomClassifierConfiguration_error___block_invoke;
    v10[3] = &unk_1E4546F68;
    v8 = v6;
    v11 = v8;
    objc_msgSend(v5, "enumerateLabelsInVocabularyNamed:usingBlock:", v7, v10);

    objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __95__VNCoreSceneUnderstandingDetector__identifiersSupportedByCustomClassifierConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)_globalOrProvidedSessionInOptions:(uint64_t)a3 error:
{
  id v4;
  id v5;
  void *v6;
  id v8;

  v4 = a2;
  objc_opt_self();
  v8 = 0;
  LOBYTE(a3) = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v8, objc_opt_class(), CFSTR("VNDetectorProcessOption_Session"), v4, a3);
  v5 = v8;
  if ((a3 & 1) != 0)
  {
    if (!v5)
    {
      +[VNSession globalSession](VNSession, "globalSession");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v5;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __108__VNCoreSceneUnderstandingDetector__specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier___block_invoke()
{
  void *v0;

  v0 = (void *)+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1;
  +[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1 = (uint64_t)&unk_1E459E6F8;

}

@end
