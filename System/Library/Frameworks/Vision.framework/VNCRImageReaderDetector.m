@implementation VNCRImageReaderDetector

+ (id)_imageReaderInitializationOptionsForCreationOptions:(id)a3 computeDevice:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DBEBA8]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_FastRecognition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = *MEMORY[0x1E0DBEC18];
  if (v10)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0DBEC20], v11);
    v12 = (_QWORD *)MEMORY[0x1E0DBEC38];
  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0DBEC28], v11);
    v12 = (_QWORD *)MEMORY[0x1E0DBEC40];
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *v12, *MEMORY[0x1E0DBEC30]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DBEBF8]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_RecognitionLanguages"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DBEBE8]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 ^ 1u);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0DBEBD0]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DBEC08]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_CustomWords"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DBEBD8]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DBEBC8]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DBEC00]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesCoreMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DBEBB0]);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorCreationOption_SkipVerticalText"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0DBEC10]);

  return v8;
}

+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorProcessOption_MinimumTextHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DBEBF0]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorProcessOption_UsesFormFieldDetection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DBEBB8]);

  return v4;
}

+ (id)supportedLanguagesForProcessOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageReaderInitializationOptionsForCreationOptions:computeDevice:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(a1, "imageReaderRecognitionOptionsForProcessOptions:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v11);

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEC08]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0DBECA0], "supportedLanguagesForOptions:revision:error:", v10, v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  if (+[VNValidationUtilities getNSIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSIntegerValue:forKey:inOptions:error:", &v12, CFSTR("VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"), v6, a4))
  {
    objc_msgSend(a1, "_imageReaderInitializationOptionsForCreationOptions:computeDevice:error:", v6, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DBECA0], "supportedComputeDevicesForOptions:revision:error:", v7, v12, a4);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        v13 = CFSTR("VNComputeStageMain");
        v14[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VNCRImageReaderDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __64__VNCRImageReaderDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNCRImageReaderDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_FastRecognition"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_RecognitionLanguages"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_CustomWords"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_UsesCoreMode"));
  objc_msgSend(v2, "addObject:", CFSTR("VNCRImageReaderDetectorCreationOption_SkipVerticalText"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (id)cachedImageReader
{
  return self->_imageReader;
}

- (void)setCachedImageReader:(id)a3
{
  objc_storeStrong((id *)&self->_imageReader, a3);
}

- (BOOL)isCRImageReaderViableAfterError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DBEBE0]);

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)newImageReaderAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[VNDetector configurationOptions](self, "configurationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", CFSTR("VNComputeStageMain"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_imageReaderInitializationOptionsForCreationOptions:computeDevice:error:", v5, v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBECA0]), "initWithOptions:", v7);
      v11[0] = *MEMORY[0x1E0DBEC48];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOutputObjectTypes:", v9);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_observationsForImageReaderOutput:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  VNRecognizedTextObservation *v15;
  double v16;
  double v17;
  double v18;
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
  VNRecognizedTextObservation *v30;
  unsigned int v31;
  double v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  VNRecognizedText *v39;
  void *v40;
  void *v41;
  id v42;
  char *v44;
  void *v46;
  VNRecognizedTextObservation *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v7)
  {
    v50 = *(_QWORD *)v57;
    v49 = *MEMORY[0x1E0DBEC48];
    v8 = &selRef_applicableDetectorClassAndOptions_forRevision_error_;
    while (2)
    {
      v48 = v7;
      v9 = 0;
      v44 = v8[133];
      do
      {
        if (*(_QWORD *)v57 != v50)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v49);

        if (v12)
        {
          objc_msgSend(v10, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (!v14)
          {
            v15 = [VNRecognizedTextObservation alloc];
            objc_msgSend(v10, "topLeft");
            v17 = v16;
            v19 = v18;
            objc_msgSend(v10, "topRight");
            v21 = v20;
            v23 = v22;
            objc_msgSend(v10, "bottomRight");
            v25 = v24;
            v27 = v26;
            objc_msgSend(v10, "bottomLeft");
            v30 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](v15, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", a4, v17, 1.0 - v19, v21, 1.0 - v23, v25, 1.0 - v27, v29, 1.0 - v28);
            if (!v30)
            {
              if (a5)
              {
                +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_26:

              v42 = 0;
              v41 = v46;
              goto LABEL_27;
            }
            v47 = v30;
            v31 = objc_msgSend(v10, "confidence");
            LODWORD(v32) = 0;
            if (v31 <= 2)
              LODWORD(v32) = dword_1A15F8D88[v31];
            -[VNObservation setConfidence:](v30, "setConfidence:", v32);
            -[VNRecognizedTextObservation setIsTitle:](v30, "setIsTitle:", objc_msgSend(v10, "isTitle"));
            v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v10, "performSelector:", v44);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v35 = v34;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (v36)
            {
              v37 = *(_QWORD *)v53;
              while (2)
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v53 != v37)
                    objc_enumerationMutation(v35);
                  v39 = -[VNRecognizedText initWithRequestRevision:CRImageReaderOutput:]([VNRecognizedText alloc], "initWithRequestRevision:CRImageReaderOutput:", a4, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
                  if (!v39)
                  {
                    if (a5)
                    {
                      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    goto LABEL_26;
                  }
                  objc_msgSend(v33, "addObject:", v39);

                }
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                if (v36)
                  continue;
                break;
              }
            }

            -[VNRecognizedTextObservation setTextObjects:](v47, "setTextObjects:", v33);
            objc_msgSend(v10, "stringValue");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNRecognizedTextObservation setText:](v47, "setText:", v40);

            objc_msgSend(v46, "addObject:", v47);
          }
        }
        ++v9;
      }
      while (v9 != v48);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      v8 = &selRef_applicableDetectorClassAndOptions_forRevision_error_;
      if (v7)
        continue;
      break;
    }
  }

  v41 = v46;
  v42 = v46;
LABEL_27:

  return v42;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  CRImageReader *v7;
  CRImageReader *imageReader;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNCRImageReaderDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v11, sel_completeInitializationForSession_error_, v6, a4))
  {
    v7 = -[VNCRImageReaderDetector newImageReaderAndReturnError:](self, "newImageReaderAndReturnError:", a4);
    imageReader = self->_imageReader;
    self->_imageReader = v7;

    v9 = self->_imageReader != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  CRImageReader *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  void *v32;
  __CVBuffer *v33;
  id v34;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = self->_imageReader;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorProcessOption_MinimumTextHeight"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = objc_msgSend(v17, "width");
    v23 = objc_msgSend(v17, "height");
    v36.origin.x = x * (double)v22;
    v36.size.width = width * (double)v22;
    v36.origin.y = y * (double)v23;
    v36.size.height = height * (double)v23;
    v37 = CGRectIntegral(v36);
    v24 = v37.origin.x;
    v25 = v37.origin.y;
    v26 = v37.size.width;
    v27 = v37.size.height;
    -[CRImageReader smallestImageSizeForTextWithRelativeHeight:originalImageSize:](v18, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", v21, v37.size.width, v37.size.height);
    v30 = ((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if ((((unint64_t)v28 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 3 && v30 > 2)
    {
      v33 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v24, v25, v26, v27);
      v34 = 0;
      *a7 = v33;
      LOBYTE(a8) = v33 != 0;
      if (v33)
        -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v16, v34, v17);

    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The image is too small in at least one dimension %ld x %ld (each dimension has to be more than 2 pixels)"), ((unint64_t)v28 + 1) & 0xFFFFFFFFFFFFFFFELL, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidImageFailureWithLocalizedDescription:](VNError, "errorForInvalidImageFailureWithLocalizedDescription:", v32);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a8) = 0;
    }

  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  id v14;
  VNRequest *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CRImageReader *v19;
  uint64_t v20;
  id *v21;
  char v22;
  id v23;
  NSError *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  id *location;
  CRImageReader *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  CRImageReader *v43;
  uint64_t *v44;
  _QWORD v45[4];
  CRImageReader *v46;
  id *v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  const __CVBuffer *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a9;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNCRImageReaderDetectorProcessOption_OriginatingRequest"), v13, a8);
  v15 = (VNRequest *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[VNDetector requiredCancellerInOptions:error:](self, "requiredCancellerInOptions:error:", v13, a8);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (!v16)
    {
      v26 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v37 = (void *)v16;
    objc_msgSend((id)objc_opt_class(), "imageReaderRecognitionOptionsForProcessOptions:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_imageReader;
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__1835;
    v66 = __Block_byref_object_dispose__1836;
    v67 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__1835;
    v60 = __Block_byref_object_dispose__1836;
    v61 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v45[3] = &unk_1E45435F0;
    v48 = v14;
    v49 = &v62;
    v46 = v19;
    v51 = a4;
    v21 = v18;
    v47 = v21;
    v50 = &v56;
    v42[0] = v20;
    v42[1] = 3221225472;
    v42[2] = __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
    v42[3] = &unk_1E4543D38;
    v44 = &v52;
    v36 = v46;
    v43 = v36;
    v17 = v37;
    v22 = objc_msgSend(v37, "tryToPerformBlock:usingSignallingBlock:", v45, v42);
    if (*((_BYTE *)v53 + 24)
      || !-[VNCRImageReaderDetector isCRImageReaderViableAfterError:](self, "isCRImageReaderViableAfterError:", v57[5]))
    {
      v23 = -[VNCRImageReaderDetector newImageReaderAndReturnError:](self, "newImageReaderAndReturnError:", 0);
      if (v23)
        objc_storeStrong((id *)&self->_imageReader, v23);

    }
    if ((v22 & 1) != 0)
    {
      v24 = (NSError *)v57[5];
      if (!v24)
      {
        v27 = v63[5];
        if (v27)
        {
          -[VNCRImageReaderDetector _observationsForImageReaderOutput:requestRevision:error:](self, "_observationsForImageReaderOutput:requestRevision:error:", v27, -[VNRequest revision](v15, "revision"), a8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v28;
          if (v28)
          {
            location = v21;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v29 = v28;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v68, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v39 != v31)
                    objc_enumerationMutation(v29);
                  -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v13, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v68, 16);
              }
              while (v30);
            }

            v21 = location;
            v33 = v29;
          }

          goto LABEL_29;
        }
      }
      if (a8)
      {
        _vnErrorForError(v24, v15);
        v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v26 = 0;
        *a8 = v25;
LABEL_29:

        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);

        _Block_object_dispose(&v62, 8);
        goto LABEL_30;
      }
    }
    else if (a8)
    {
      +[VNError errorForCancellationOfRequest:](VNError, "errorForCancellationOfRequest:", v15);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v26 = 0;
    goto LABEL_29;
  }
  v26 = 0;
LABEL_31:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageReader, 0);
}

void __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id obj;
  void *v15;

  v2 = a1[6];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v2)
  {
    v15 = v7;
    objc_msgSend(v3, "resultsForPixelBuffer:roi:options:error:withProgressHandler:", v5, v4, &v15, 0.0, 0.0, 1.0, 1.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v15;
  }
  else
  {
    obj = v7;
    objc_msgSend(v3, "resultsForPixelBuffer:options:error:", v5, v4, &obj);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = obj;
  }
  objc_storeStrong(v8, v11);
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

}

uint64_t __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
