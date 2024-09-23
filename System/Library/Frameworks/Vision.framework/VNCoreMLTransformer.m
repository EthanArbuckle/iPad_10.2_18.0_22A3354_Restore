@implementation VNCoreMLTransformer

- (VNCoreMLTransformer)initWithOptions:(id)a3 model:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  VNCoreMLTransformer *v11;
  VNCoreMLTransformer *v12;
  VNSession *v13;
  BOOL v14;
  VNCoreMLTransformer *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (v9 && (v10 = (void *)objc_opt_class(), (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)VNCoreMLTransformer;
    v11 = -[VNDetector initWithConfigurationOptions:](&v17, sel_initWithConfigurationOptions_, v8);
    v12 = v11;
    if (v11
      && (objc_storeStrong((id *)&v11->_model, a4),
          v13 = objc_alloc_init(VNSession),
          v14 = -[VNDetector completeInitializationForSession:error:](v12, "completeInitializationForSession:error:", v13, a5), v13, !v14))
    {
      v15 = 0;
      self = v12;
    }
    else
    {
      self = v12;
      v15 = self;
    }
  }
  else if (a5)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("No valid VNCoreMLModel found in passed in options"));
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

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
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __CVBuffer *v35;
  id v36;
  void *v37;
  void *v38;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNCoreMLTransformer model](self, "model");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17, "scenePrintRequestSpecifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v43 = v20;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    v47 = *MEMORY[0x1E0C9D538];
    v45 = 0x3FF0000000000000;
    v46 = 0x3FF0000000000000;
    v23 = objc_msgSend(v20, "width");
    v24 = objc_msgSend(v20, "height");
    v48.origin.x = x * (double)v23;
    v48.size.width = width * (double)v23;
    v48.origin.y = y * (double)v24;
    v48.size.height = height * (double)v24;
    v49 = CGRectIntegral(v48);
    v25 = v49.origin.x;
    v26 = v49.origin.y;
    v27 = v49.size.width;
    v28 = v49.size.height;
    if (v17 && v23 && v24 && *(_QWORD *)(v17 + 48))
    {
      objc_msgSend(*(id *)(v17 + 40), "modelDescription");
      v40 = v22;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "inputDescriptionsByName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", *(_QWORD *)(v17 + 48));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "imageConstraint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sizeConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v40;
      if (v31)
      {
        objc_msgSend(v31, "allowedImageSizeClosestToPixelsWide:pixelsHigh:preferDownScaling:preferInputAspectRatio:", v23, v24, 1, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(v17 + 80) = objc_msgSend(v32, "pixelsWide");
        *(_QWORD *)(v17 + 88) = objc_msgSend(v32, "pixelsHigh");

      }
    }
    v33 = objc_msgSend((id)v17, "inputImageWidth");
    v34 = objc_msgSend((id)v17, "inputImageHeight");
    if (v33 && v34)
    {
      v44 = 0;
      v35 = (__CVBuffer *)objc_msgSend(v43, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v33, v34, objc_msgSend((id)v17, "inputImageFormat"), v22, v16, a8, v25, v26, v27, v28, &v47, &v46, &v45, &v44);
      v36 = v44;
      *a7 = v35;
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v37, CFSTR("VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetX"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v47 + 1));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v38, CFSTR("VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetY"));

        -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v16, v36, v43);
        v19 = 1;
LABEL_20:

        v20 = v43;
        goto LABEL_21;
      }
    }
    else
    {
      if (a8)
      {
        +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("The inputImageFeatureName does not point to a MLFeatureTypeImage input."));
        v36 = 0;
        v19 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      v36 = 0;
    }
    v19 = 0;
    goto LABEL_20;
  }
  v19 = 1;
LABEL_22:

  return v19;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  _QWORD *v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  VNSceneprintMLFeatureProvider *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  VNSceneprintMLFeatureProvider *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  VNDetectionprintMLFeatureProvider *v33;
  void *v34;
  void *v35;
  VNDetectionprintMLFeatureProvider *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  id v45;
  void *v46;
  int v47;
  int v48;
  void *v49;
  uint64_t v50;
  char v51;
  id v52;
  void *v53;
  VNClassificationObservation *v54;
  double v55;
  VNClassificationObservation *v56;
  id v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  int v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  double v104;
  double v105;
  char v106;
  id v107;
  void *v108;
  VNClassificationObservation *v109;
  double v110;
  VNClassificationObservation *v111;
  id v112;
  VNRecognizedObjectObservation *v113;
  double v114;
  VNRecognizedObjectObservation *v115;
  void *v116;
  _QWORD *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  VNPixelBufferObservation *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t j;
  double v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  _QWORD *v174;
  id *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  id v180[5];
  id v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  id v187[18];

  v187[16] = *(id *)MEMORY[0x1E0C80C00];
  v173 = a5;
  v175 = a8;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    -[VNCoreMLTransformer model](self, "model");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v173;
    v174 = v12;
    if (self)
    {
      objc_msgSend(v12, "scenePrintRequestSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v187[0] = 0;
        v15 = +[VNValidationUtilities getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v187, CFSTR("VNDetectorProcessOption_ScenePrints"), v13, objc_opt_class(), 1, 1, v175);
        v16 = v187[0];
        v17 = v16;
        if (v15)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v13;
          if (v12)
          {
            v20 = [VNSceneprintMLFeatureProvider alloc];
            v22 = v174[13];
            v21 = v174[14];
            objc_msgSend(v174, "featureProvider");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[VNSceneprintMLFeatureProvider initWithSceneprint:dataType:forKey:originalFeatureProvider:](v20, "initWithSceneprint:dataType:forKey:originalFeatureProvider:", v18, v21, v22, v23);

            -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](v174, v19, v175);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend(v174, "model");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "predictionFromFeatures:options:error:", v24, v25, v175);
              v171 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v171 = 0;
            }

          }
          else
          {
            v171 = 0;
          }

        }
        else
        {
          v171 = 0;
        }

      }
      else
      {
        objc_msgSend(v12, "detectionPrintRequestSpecifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNCoreMLTransformerProcessOption_Detectionprint"), v13, v175);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            v31 = v29;
            v32 = v13;
            if (v12)
            {
              v33 = [VNDetectionprintMLFeatureProvider alloc];
              objc_msgSend(v174, "detectionPrintInputDescriptions");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "featureProvider");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[VNDetectionprintMLFeatureProvider initWithDetectionprint:featureDescriptions:originalFeatureProvider:](v33, "initWithDetectionprint:featureDescriptions:originalFeatureProvider:", v31, v34, v35);

              -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](v174, v32, v175);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                objc_msgSend(v174, "model");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "predictionFromFeatures:options:error:", v36, v37, v175);
                v171 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v171 = 0;
              }

            }
            else
            {
              v171 = 0;
            }

          }
          else
          {
            v171 = 0;
          }

        }
        else
        {
          objc_msgSend(v12, "predictWithCVPixelBuffer:options:error:", a4, v13, v175);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      v171 = 0;
    }

    if (v171)
    {
      switch(objc_msgSend(v174, "modelType"))
      {
        case 0u:
        case 4u:
          v39 = v174;
          v159 = v171;
          v165 = v172;
          v155 = v39;
          if (self)
          {
            objc_msgSend(v39, "operationPoints");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "predictedProbabilitiesKey");
            v40 = objc_claimAutoreleasedReturnValue();
            v157 = (void *)v40;
            if (v40)
            {
              objc_msgSend(v159, "featureValueForName:", v40);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "dictionaryValue");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              v162 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v151, "count"));
              v184 = 0u;
              v185 = 0u;
              v182 = 0u;
              v183 = 0u;
              v41 = v151;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
              if (v42)
              {
                v43 = *(_QWORD *)v183;
                while (2)
                {
                  for (i = 0; i != v42; ++i)
                  {
                    if (*(_QWORD *)v183 != v43)
                      objc_enumerationMutation(v41);
                    v45 = *(id *)(*((_QWORD *)&v182 + 1) + 8 * i);
                    objc_msgSend(v41, "objectForKeyedSubscript:", v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "floatValue");
                    v48 = v47;

                    v49 = (void *)objc_opt_class();
                    if ((objc_msgSend(v49, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
                    {
                      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v45);

                      v45 = (id)v50;
                    }
                    v180[0] = 0;
                    v51 = objc_msgSend(v168, "getClassificationMetrics:forClassificationIdentifier:error:", v180, v45, v175);
                    v52 = v180[0];
                    v53 = v52;
                    if ((v51 & 1) == 0)
                    {

                      v27 = 0;
                      v58 = v162;
                      goto LABEL_83;
                    }
                    v54 = [VNClassificationObservation alloc];
                    LODWORD(v55) = v48;
                    v56 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v54, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", v165, v45, v53, v55);
                    objc_msgSend(v162, "addObject:", v56);

                  }
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
                  if (v42)
                    continue;
                  break;
                }
              }

              v57 = &__block_literal_global_86_33184;
              objc_msgSend(v162, "sortWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);

              v58 = v162;
              v27 = v162;
LABEL_83:

            }
            else if (v175)
            {
              +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("predicted probabilities key is not available"));
              v27 = 0;
              *v175 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v27 = 0;
            }

          }
          else
          {
            v27 = 0;
          }

          goto LABEL_103;
        case 3u:
        case 5u:
          v59 = v174;
          v166 = v171;
          v150 = v13;
          v169 = v172;
          v160 = v59;
          if (self)
          {
            objc_msgSend(v59, "boundingBoxOutputDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "coordinatesFeatureName");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "featureValueForName:", v61);
            v158 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v160, "boundingBoxOutputDescription");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "confidenceFeatureName");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "featureValueForName:", v63);
            v156 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v158, "type") == 5 && objc_msgSend(v156, "type") == 5)
            {
              objc_msgSend(v158, "multiArrayValue");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "multiArrayValue");
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "shape");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "shape");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "strides");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v143 = objc_msgSend(v65, "unsignedIntegerValue");

              objc_msgSend(v163, "strides");
              v147 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v147, "objectAtIndexedSubscript:", 0);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = objc_msgSend(v66, "unsignedIntegerValue");

              objc_msgSend(v146, "objectAtIndexedSubscript:", 0);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v144 = objc_msgSend(v67, "unsignedIntegerValue");

              objc_msgSend(v160, "boundingBoxOutputDescription");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "labelNames");
              v148 = (void *)objc_claimAutoreleasedReturnValue();

              v69 = objc_msgSend(v148, "count");
              objc_msgSend(v145, "objectAtIndexedSubscript:", 1);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v69) = v69 == objc_msgSend(v70, "unsignedIntegerValue");

              if ((v69 & 1) != 0)
              {
                objc_msgSend(v150, "objectForKey:", CFSTR("VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetX"));
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "doubleValue");
                v139 = v72;

                objc_msgSend(v150, "objectForKey:", CFSTR("VNVNCoreMLTransformerProcessOption_NormalizedOriginOffsetY"));
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "doubleValue");
                v75 = v74;

                objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v76, "intValue");

                objc_msgSend(v160, "operationPoints");
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v144);
                if (v144)
                {
                  v142 = 0;
                  v78 = 0;
                  v137 = v77;
                  v135 = v139 * -2.0 + 1.0;
                  v79 = v75 * -2.0 + 1.0;
                  do
                  {
                    v136 = v78;
                    v80 = v78 * v143;
                    objc_msgSend(v149, "objectAtIndexedSubscript:", v78 * v143 + 2);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "doubleValue");
                    v83 = v82;

                    objc_msgSend(v149, "objectAtIndexedSubscript:", v80 + 3);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "doubleValue");
                    v86 = v85;

                    objc_msgSend(v149, "objectAtIndexedSubscript:", v80);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "doubleValue");
                    v89 = v88;

                    objc_msgSend(v149, "objectAtIndexedSubscript:", v80 + 1);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "doubleValue");
                    v92 = v91;

                    v93 = v89 + v83 * -0.5;
                    v94 = v92 + v86 * -0.5;
                    if (v137)
                    {
                      if (v137 == 1)
                      {
                        v93 = (v93 - v139) / v135;
                        v94 = (v94 - v75) / v79;
                        v83 = v83 / v135;
                        v86 = v86 / v79;
                      }
                    }
                    else
                    {
                      v83 = v135 * v83;
                      v86 = v79 * v86;
                      v93 = v139 + v135 * v93;
                      v94 = v75 + v79 * v94;
                    }
                    v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v148, "count"));
                    v184 = 0u;
                    v185 = 0u;
                    v182 = 0u;
                    v183 = 0u;
                    v95 = v148;
                    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
                    if (v96)
                    {
                      v97 = 0;
                      v98 = *(_QWORD *)v183;
                      v99 = 0.0;
                      while (2)
                      {
                        v100 = 0;
                        v138 = v97;
                        v101 = v142 + v97;
                        do
                        {
                          if (*(_QWORD *)v183 != v98)
                            objc_enumerationMutation(v95);
                          v102 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * v100);
                          objc_msgSend(v163, "objectAtIndexedSubscript:", v101 + v100);
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v103, "doubleValue");
                          v105 = v104;

                          v181 = 0;
                          v106 = objc_msgSend(v152, "getClassificationMetrics:forClassificationIdentifier:error:", &v181, v102, v175);
                          v107 = v181;
                          v108 = v107;
                          if ((v106 & 1) == 0)
                          {

                            v27 = 0;
                            v116 = v140;
                            goto LABEL_98;
                          }
                          v109 = [VNClassificationObservation alloc];
                          *(float *)&v110 = v105;
                          v111 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v109, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", v169, v102, v108, v110);
                          objc_msgSend(v154, "addObject:", v111);

                          v99 = v99 + v105;
                          ++v100;
                        }
                        while (v96 != v100);
                        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
                        v97 = v138 + v100;
                        if (v96)
                          continue;
                        break;
                      }

                      if (v99 > 0.0)
                      {
                        v180[0] = (id)MEMORY[0x1E0C809B0];
                        v180[1] = (id)3221225472;
                        v180[2] = __119__VNCoreMLTransformer__recognizedObjectObservationsFromModel_outputFeatures_options_originatingRequestSpecifier_error___block_invoke;
                        v180[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
                        v180[4] = *(id *)&v99;
                        objc_msgSend(v154, "enumerateObjectsUsingBlock:", v180);
                      }
                    }
                    else
                    {

                      v99 = 0.0;
                    }
                    v112 = &__block_literal_global_86_33184;
                    objc_msgSend(v154, "sortWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);

                    v113 = [VNRecognizedObjectObservation alloc];
                    *(float *)&v114 = v99;
                    v115 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v113, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v169, v154, 0, 0, v93, 1.0 - v94 - v86, v83, v86, v114);
                    objc_msgSend(v140, "addObject:", v115);

                    v78 = v136 + 1;
                    v142 += v141;
                  }
                  while (v136 + 1 != v144);
                }
                v116 = v140;
                v27 = v140;
LABEL_98:

              }
              else if (v175)
              {
                +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("The confidence scores don't line up with the labels"));
                v27 = 0;
                *v175 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v27 = 0;
              }

            }
            else if (v175)
            {
              +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("The outputs of the model are of unexpected types"));
              v27 = 0;
              *v175 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v27 = 0;
            }

          }
          else
          {
            v27 = 0;
          }

          goto LABEL_103;
        default:
          v117 = v174;
          v170 = v171;
          v161 = v117;
          v164 = v172;
          if (self)
          {
            v167 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v117, "model");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "modelDescription");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "outputDescriptionsByName");
            v120 = (void *)objc_claimAutoreleasedReturnValue();

            v184 = 0u;
            v185 = 0u;
            v182 = 0u;
            v183 = 0u;
            v121 = v120;
            v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
            if (v122)
            {
              v123 = *(_QWORD *)v183;
LABEL_69:
              v124 = 0;
              while (1)
              {
                if (*(_QWORD *)v183 != v123)
                  objc_enumerationMutation(v121);
                v125 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * v124);
                objc_msgSend(v121, "objectForKeyedSubscript:", v125);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "featureValueForName:", v125);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v127)
                {
                  if (v175)
                  {
                    v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("could not obtain a feature value for key \"%@\"), v125);
                    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v130);
                    *v175 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  v27 = 0;
                  goto LABEL_89;
                }
                if (objc_msgSend(v126, "type") != 4 || objc_msgSend(v127, "type") != 4)
                  break;
                v128 = objc_msgSend(v127, "imageBufferValue");
                if (v128)
                {
                  v129 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v164, v125, v128);
                  objc_msgSend(v167, "addObject:", v129);
LABEL_78:

                }
                if (v122 == ++v124)
                {
                  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v182, v187, 16);
                  if (v122)
                    goto LABEL_69;
                  goto LABEL_81;
                }
              }
              v129 = -[VNCoreMLFeatureValueObservation initWithOriginatingRequestSpecifier:featureName:featureValue:]([VNCoreMLFeatureValueObservation alloc], "initWithOriginatingRequestSpecifier:featureName:featureValue:", v164, v125, v127);
              objc_msgSend(v167, "addObject:", v129);
              goto LABEL_78;
            }
LABEL_81:

            v27 = v167;
LABEL_89:

          }
          else
          {
            v27 = 0;
          }

LABEL_103:
          if (v27)
          {
            v178 = 0u;
            v179 = 0u;
            v176 = 0u;
            v177 = 0u;
            v27 = v27;
            v131 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v176, v186, 16);
            if (v131)
            {
              v132 = *(_QWORD *)v177;
              do
              {
                for (j = 0; j != v131; ++j)
                {
                  if (*(_QWORD *)v177 != v132)
                    objc_enumerationMutation(v27);
                  -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v13, *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * j));
                }
                v131 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v176, v186, 16);
              }
              while (v131);
            }

          }
          break;
      }
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (VNCoreMLModel)model
{
  return (VNCoreMLModel *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

void __119__VNCoreMLTransformer__recognizedObjectObservationsFromModel_outputFeatures_options_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "confidence");
  v4 = v3 / *(double *)(a1 + 32);
  *(float *)&v4 = v4;
  objc_msgSend(v5, "setConfidence:", v4);

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

@end
