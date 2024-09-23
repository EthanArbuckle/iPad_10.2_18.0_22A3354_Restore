@implementation VNDetectTextRectanglesRequest

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VNDetectTextRectanglesRequest algorithm](self, "algorithm");
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      v11 = CFSTR("VNComputeStageMain");
      +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
    else
    {
      if (a3)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid algorithm value of %lu"), v4);
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        a3 = 0;
      }
      return a3;
    }
  }
  else
  {
    v13 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v5 = -[VNDetectTextRectanglesRequest minimumCharacterPixelHeight](self, "minimumCharacterPixelHeight");
  if (v5 < objc_msgSend(v4, "minimumCharacterPixelHeight")
    || -[VNDetectTextRectanglesRequest reportCharacterBoxes](self, "reportCharacterBoxes")
    && !objc_msgSend(v4, "reportCharacterBoxes"))
  {
    goto LABEL_8;
  }
  v6 = -[VNDetectTextRectanglesRequest detectDiacritics](self, "detectDiacritics");
  if (v6 != objc_msgSend(v4, "detectDiacritics"))
    goto LABEL_8;
  v7 = -[VNDetectTextRectanglesRequest minimizeFalseDetections](self, "minimizeFalseDetections");
  if (v7 != objc_msgSend(v4, "minimizeFalseDetections"))
    goto LABEL_8;
  -[VNDetectTextRectanglesRequest additionalCharacters](self, "additionalCharacters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalCharacters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = VisionCoreEqualOrNilObjects();

  if ((v10 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)VNDetectTextRectanglesRequest;
    v11 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v13, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_8:
    v11 = 0;
  }

  return v11;
}

- (unint64_t)algorithm
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "algorithm");

  return v3;
}

- (void)setAlgorithm:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlgorithm:", a3);

}

- (NSString)textRecognition
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textRecognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTextRecognition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4
    && (objc_msgSend((id)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v7 = v4;
  }
  else
  {
    v7 = (id)objc_msgSend(v4, "copy");

    -[VNRequest configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextRecognition:", v7);

  }
}

- (NSString)additionalCharacters
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAdditionalCharacters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalCharacters:", v5);

}

- (unint64_t)minimumCharacterPixelHeight
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumCharacterPixelHeight");

  return v3;
}

- (void)setMinimumCharacterPixelHeight:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumCharacterPixelHeight:", a3);

}

- (BOOL)reportCharacterBoxes
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reportCharacterBoxes");

  return v3;
}

- (void)setReportCharacterBoxes:(BOOL)reportCharacterBoxes
{
  _BOOL8 v3;
  id v4;

  v3 = reportCharacterBoxes;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReportCharacterBoxes:", v3);

}

- (BOOL)detectDiacritics
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "detectDiacritics");

  return v3;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetectDiacritics:", v3);

}

- (BOOL)minimizeFalseDetections
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimizeFalseDetections");

  return v3;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimizeFalseDetections:", v3);

}

- (BOOL)_detectCreditCardTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  VNCCTextDetector *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v7 = a3;
  objc_msgSend(v7, "imageBufferAndReturnError:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VNRequest newDefaultDetectorOptionsForSession:](self, "newDefaultDetectorOptionsForSession:", v9);
    v11 = -[VNCCTextDetector initWithOptions:]([VNCCTextDetector alloc], "initWithOptions:", v10);
    if (v11)
    {
      -[VNRequest specifier](self, "specifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCCTextDetector textBoxesForImage:originatingRequestSpecifier:error:](v11, "textBoxesForImage:originatingRequestSpecifier:error:", v8, v12, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v13 != 0;
      if (v13)
        -[VNRequest setResults:](self, "setResults:", v13);

    }
    else if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Text detector object was not created"));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_futharkRecognitionLanguage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[VNDetectTextRectanglesRequest textRecognition](self, "textRecognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("VNTextRecognitionOptionNone")) & 1) == 0)
  {
    objc_msgSend((id)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap, "objectForKeyedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VNDetectTextRectanglesRequest additionalCharacters](self, "additionalCharacters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(";%@"), v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v7;
      }
      v5 = v5;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_detectTextWithRequestPerformingContext:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __CVBuffer *v11;
  char v12;
  size_t Width;
  size_t Height;
  double v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  unint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFDictionary *v28;
  _BOOL4 v29;
  VNTextObservation *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  const __CFDictionary *v53;
  const __CFDictionary *v54;
  void *v55;
  const __CFDictionary *v56;
  _VNTextObservationCharacterBox *v57;
  uint64_t v58;
  _VNTextObservationCharacterBox *v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  _BOOL4 v66;
  _BOOL4 v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  VNTextObservation *v72;
  _BOOL4 v73;
  uint64_t v74;
  id v75;
  id *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CGPoint v89;
  CGPoint v90;
  CGPoint v91;
  CGPoint point;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v76 = a5;
  objc_msgSend(v63, "imageBufferAndReturnError:", a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v6;
  if (v6)
  {
    v75 = v6;
    v7 = objc_msgSend(v75, "width");
    v8 = objc_msgSend(v75, "height");
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = (__CVBuffer *)objc_msgSend(v75, "bufferWithWidth:height:format:options:error:", v7, v8, *((unsigned int *)&_createFutharkCompatiblePixelBufferFromImageBuffer(VNImageBuffer *,NSError * {__autoreleasing}*)::kPreferredPixelFormats+ v9), 0, v76);
      v12 = v10 & (v11 == 0);
      v9 = 1;
      v10 = 0;
    }
    while ((v12 & 1) != 0);

    if (v11)
    {
      v67 = -[VNDetectTextRectanglesRequest reportCharacterBoxes](self, "reportCharacterBoxes");
      Width = CVPixelBufferGetWidth(v11);
      Height = CVPixelBufferGetHeight(v11);
      v15 = (double)Height;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23358]), "initWithDimensions:", (double)Width, (double)Height);
      if (v16)
      {
        v17 = -[VNDetectTextRectanglesRequest minimumCharacterPixelHeight](self, "minimumCharacterPixelHeight");
        if (v17)
        {
          if (v17 >= 0x7FFFFFFF)
            v18 = 0x7FFFFFFFLL;
          else
            v18 = v17;
          objc_msgSend(v16, "setMinimumCharacterHeight:", v18);
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v16, "setDetectDiacritics:", -[VNDetectTextRectanglesRequest detectDiacritics](self, "detectDiacritics"));
        objc_msgSend(v16, "setMinimizeFalseDetections:", -[VNDetectTextRectanglesRequest minimizeFalseDetections](self, "minimizeFalseDetections"));
        if (Width >= Height)
          v21 = Height;
        else
          v21 = Width;
        if (v21 < 2 * v18)
          VNRecordImageTooSmallWarningWithImageMinimumShortDimension(self, 2 * v18);
        -[VNDetectTextRectanglesRequest _futharkRecognitionLanguage](self, "_futharkRecognitionLanguage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v16, "setRecognitionLanguage:", v22);
          v20 = 1;
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v16, "setReturnSubFeatures:", v67);
        -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", (unint64_t)(double)Width, (unint64_t)v15);
        objc_msgSend(v16, "detectFeaturesInBuffer:withRegionOfInterest:error:", v11, v76);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v61 == 0;

      }
      else
      {
        if (v76)
        {
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Text detector object was not created"));
          v61 = 0;
          v20 = 0;
          *v76 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = 0;
          v20 = 0;
        }
        v23 = 1;
      }

      v66 = v20 != 0;
      CVPixelBufferRelease(v11);
      if (v23)
      {
        v19 = 0;
LABEL_84:

        goto LABEL_85;
      }
      -[VNRequest specifier](self, "specifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v61, "count"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = v61;
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      if (!v70)
      {
LABEL_79:

        -[VNRequest setResults:](self, "setResults:", v64);
        v19 = 1;
LABEL_83:

        goto LABEL_84;
      }
      v69 = *(_QWORD *)v86;
LABEL_30:
      v74 = 0;
      while (1)
      {
        if (*(_QWORD *)v86 != v69)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v74);
        if (!objc_msgSend(v24, "type", v61, v62))
          break;
LABEL_77:
        if (++v74 == v70)
        {
          v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
          if (!v70)
            goto LABEL_79;
          goto LABEL_30;
        }
      }
      objc_msgSend(v24, "corners");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v71 || objc_msgSend(v71, "count") != 4)
        goto LABEL_45;
      objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v25, &point))
      {
        objc_msgSend(v71, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v26, &v91))
        {
          objc_msgSend(v71, "objectAtIndexedSubscript:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v27, &v90))
          {
            objc_msgSend(v71, "objectAtIndexedSubscript:", 3);
            v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            v29 = CGPointMakeWithDictionaryRepresentation(v28, &v89);

            if (v29)
            {
              v30 = [VNTextObservation alloc];
              v72 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](v30, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v80, point.x, 1.0 - point.y, v89.x, 1.0 - v89.y, v90.x, 1.0 - v90.y, v91.x, 1.0 - v91.y);
              if (v72)
              {
LABEL_46:
                if (v66)
                {
                  objc_msgSend(v24, "text");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VNTextObservation setText:](v72, "setText:", v35);

                }
                objc_msgSend(v64, "addObject:", v72);
                if (v67)
                {
                  objc_msgSend(v24, "subFeatures");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    v77 = v36;
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v36, "count"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = 0u;
                    v84 = 0u;
                    v81 = 0u;
                    v82 = 0u;
                    v78 = v77;
                    v37 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
                    if (!v37)
                      goto LABEL_75;
                    v38 = *(_QWORD *)v82;
                    while (1)
                    {
                      for (i = 0; i != v37; ++i)
                      {
                        if (*(_QWORD *)v82 != v38)
                          objc_enumerationMutation(v78);
                        v40 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * i);
                        v41 = v80;
                        if (!v40 || objc_msgSend(v40, "type") != 1)
                        {
                          v59 = 0;
                          goto LABEL_71;
                        }
                        objc_msgSend(v40, "boundingBox");
                        v43 = v42;
                        v45 = v44;
                        v47 = v46;
                        v49 = v48;
                        objc_msgSend(v40, "corners");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = v50;
                        v52 = 1.0 - v45 - v49;
                        if (!v50 || objc_msgSend(v50, "count") != 4)
                          goto LABEL_69;
                        v91 = (CGPoint)*MEMORY[0x1E0C9D538];
                        point = v91;
                        v89 = v91;
                        v90 = v91;
                        objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
                        v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                        if (!CGPointMakeWithDictionaryRepresentation(v53, &point))
                          goto LABEL_68;
                        objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
                        v54 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                        if (!CGPointMakeWithDictionaryRepresentation(v54, &v91))
                          goto LABEL_67;
                        objc_msgSend(v51, "objectAtIndexedSubscript:", 2);
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v55, &v90))
                        {

LABEL_67:
LABEL_68:

                          goto LABEL_69;
                        }
                        objc_msgSend(v51, "objectAtIndexedSubscript:", 3);
                        v56 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                        v73 = CGPointMakeWithDictionaryRepresentation(v56, &v89);

                        if (v73)
                        {
                          v57 = [_VNTextObservationCharacterBox alloc];
                          v58 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](v57, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v41, point.x, 1.0 - point.y, v89.x, 1.0 - v89.y, v90.x, 1.0 - v90.y, v91.x, 1.0 - v91.y);
                          v59 = (_VNTextObservationCharacterBox *)v58;
                          if (v58)
                          {
                            *(double *)(v58 + 96) = v43;
                            *(double *)(v58 + 104) = v52;
                            *(double *)(v58 + 112) = v47;
                            *(double *)(v58 + 120) = v49;
                          }
                          goto LABEL_70;
                        }
LABEL_69:
                        v59 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([_VNTextObservationCharacterBox alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v41, v43, v52, v47, v49);
LABEL_70:

LABEL_71:
                        if (v59)
                          objc_msgSend(v79, "addObject:", v59);

                      }
                      v37 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
                      if (!v37)
                      {
LABEL_75:

                        -[VNTextObservation setCharacterBoxes:](v72, "setCharacterBoxes:", v79);
                        break;
                      }
                    }
                  }
                }

                goto LABEL_77;
              }
            }
LABEL_45:
            objc_msgSend(v24, "boundingBox");
            v72 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNTextObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v80, v33, 1.0 - v31 - v32, v34, v32);
            if (!v72)
            {
              if (v76)
              {
                +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
                *v76 = (id)objc_claimAutoreleasedReturnValue();
              }

              v19 = 0;
              goto LABEL_83;
            }
            goto LABEL_46;
          }

        }
      }

      goto LABEL_45;
    }
  }
  v19 = 0;
LABEL_85:

  return v19;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectTextRectanglesRequest *v4;
  void *v5;
  objc_super v6;

  v4 = (VNDetectTextRectanglesRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectTextRectanglesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNDetectTextRectanglesRequest setAlgorithm:](self, "setAlgorithm:", -[VNDetectTextRectanglesRequest algorithm](v4, "algorithm"));
      -[VNDetectTextRectanglesRequest textRecognition](v4, "textRecognition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectTextRectanglesRequest setTextRecognition:](self, "setTextRecognition:", v5);

      -[VNDetectTextRectanglesRequest setMinimumCharacterPixelHeight:](self, "setMinimumCharacterPixelHeight:", -[VNDetectTextRectanglesRequest minimumCharacterPixelHeight](v4, "minimumCharacterPixelHeight"));
      -[VNDetectTextRectanglesRequest setReportCharacterBoxes:](self, "setReportCharacterBoxes:", -[VNDetectTextRectanglesRequest reportCharacterBoxes](v4, "reportCharacterBoxes"));
      -[VNDetectTextRectanglesRequest setDetectDiacritics:](self, "setDetectDiacritics:", -[VNDetectTextRectanglesRequest detectDiacritics](v4, "detectDiacritics"));
      -[VNDetectTextRectanglesRequest setMinimizeFalseDetections:](self, "setMinimizeFalseDetections:", -[VNDetectTextRectanglesRequest minimizeFalseDetections](v4, "minimizeFalseDetections"));
    }
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  void *v18;
  uint64_t v19;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing detectTextRectangles request\n"), v9, v10, v11, v12, v13, v14, v19);
  v15 = -[VNDetectTextRectanglesRequest algorithm](self, "algorithm");
  if (v15 < 2)
  {
    v16 = -[VNDetectTextRectanglesRequest _detectTextWithRequestPerformingContext:requestRevision:error:](self, "_detectTextWithRequestPerformingContext:requestRevision:error:", v8, a3, a5);
LABEL_5:
    LOBYTE(a5) = v16;
    goto LABEL_6;
  }
  if (v15 == 2)
  {
    v16 = -[VNDetectTextRectanglesRequest _detectCreditCardTextWithRequestPerformingContext:requestRevision:error:](self, "_detectCreditCardTextWithRequestPerformingContext:requestRevision:error:", v8, a3, a5);
    goto LABEL_5;
  }
  if (a5)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid algorithm value of %lu"), v15);
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
LABEL_6:

  return (char)a5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[12];
  _QWORD v5[13];

  v5[12] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = CFSTR("VNTextRecognitionOptionASCIICharacterSet");
    v4[1] = CFSTR("VNTextRecognitionOptionEnglishCharacterSet");
    v5[0] = CFSTR("ASCII");
    v5[1] = CFSTR("en");
    v4[2] = CFSTR("VNTextRecognitionOptionDanishCharacterSet");
    v4[3] = CFSTR("VNTextRecognitionOptionDutchCharacterSet");
    v5[2] = CFSTR("da");
    v5[3] = CFSTR("nl");
    v4[4] = CFSTR("VNTextRecognitionOptionFrenchCharacterSet");
    v4[5] = CFSTR("VNTextRecognitionOptionGermanCharacterSet");
    v5[4] = CFSTR("fr");
    v5[5] = CFSTR("de");
    v4[6] = CFSTR("VNTextRecognitionOptionIcelandicCharacterSet");
    v4[7] = CFSTR("VNTextRecognitionOptionItalianCharacterSet");
    v5[6] = CFSTR("is");
    v5[7] = CFSTR("it");
    v4[8] = CFSTR("VNTextRecognitionOptionNorwegianCharacterSet");
    v4[9] = CFSTR("VNTextRecognitionOptionPortugueseCharacterSet");
    v5[8] = CFSTR("no");
    v5[9] = CFSTR("pt");
    v4[10] = CFSTR("VNTextRecognitionOptionSpanishCharacterSet");
    v4[11] = CFSTR("VNTextRecognitionOptionSwedishCharacterSet");
    v5[10] = CFSTR("es");
    v5[11] = CFSTR("se");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 12);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap;
    ourTextRecognitionLanguageOptionToFutharkRecognitionLanguageMap = v2;

  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
