@implementation VNImageBasedRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)validateConfigurationAndReturnError:(id *)a3
{
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)VNImageBasedRequest;
  v5 = -[VNRequest validateConfigurationAndReturnError:](&v16, sel_validateConfigurationAndReturnError_);
  if (v5)
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = 1.0;
    v17.size.height = 1.0;
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    LOBYTE(v5) = CGRectContainsRect(v17, v18);
    if (a3)
    {
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The region of interest [%g, %g, %g, %g] is not within the normalized bounds of [0 0 1 1]"), *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v14);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (void)setInputFaceObservations:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_msgSend(v4, "copy");

  -[VNRequest configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputFaceObservations:", v6);

}

- (BOOL)getOptionalValidatedInputFaceObservations:(id *)a3 clippedToRegionOfInterest:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  BOOL v11;

  v6 = a4;
  -[VNImageBasedRequest inputFaceObservations](self, "inputFaceObservations");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (!+[VNValidationUtilities validateOptionalFaceObservations:forRequest:error:](VNValidationUtilities, "validateOptionalFaceObservations:forRequest:error:", v9, self, a5))
    {
      v11 = 0;
      goto LABEL_11;
    }
    if (v6)
    {
      -[VNImageBasedRequest _faceObservationsForRegionOfInterestContainingFaceObservations:](self, "_faceObservationsForRegionOfInterestContainingFaceObservations:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v10;
    }
    if (a3)
    {
      v9 = objc_retainAutorelease(v9);
LABEL_8:
      *a3 = v9;
    }
  }
  else if (a3)
  {
    goto LABEL_8;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)isFullCoverageRegionOfInterest
{
  CGRect v3;
  CGRect v4;

  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  return CGRectEqualToRect(v3, v4);
}

- (CGRect)regionOfInterest
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionOfInterest");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSArray)inputFaceObservations
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputFaceObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_faceObservationsForRegionOfInterestContainingFaceObservations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[8];

  v4 = a3;
  if (-[VNImageBasedRequest isFullCoverageRegionOfInterest](self, "isFullCoverageRegionOfInterest"))
  {
    v5 = v4;
  }
  else
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__VNImageBasedRequest__faceObservationsForRegionOfInterestContainingFaceObservations___block_invoke;
    v12[3] = &__block_descriptor_64_e34_B32__0__VNFaceObservation_8Q16_B24l;
    v12[4] = v6;
    v12[5] = v7;
    v12[6] = v8;
    v12[7] = v9;
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  char IsSubsetOfFaceObservationsCollection;
  void *v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "regionOfInterest");
  v55.origin.x = v13;
  v55.origin.y = v14;
  v55.size.width = v15;
  v55.size.height = v16;
  v54.origin.x = v6;
  v54.origin.y = v8;
  v54.size.width = v10;
  v54.size.height = v12;
  if (!CGRectEqualToRect(v54, v55))
    goto LABEL_12;
  -[VNImageBasedRequest inputFaceObservations](self, "inputFaceObservations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputFaceObservations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IsSubsetOfFaceObservationsCollection = VNFaceObservationsCollectionIsSubsetOfFaceObservationsCollection(v17, v18);

  if ((IsSubsetOfFaceObservationsCollection & 1) == 0)
    goto LABEL_12;
  -[VNImageBasedRequest inputDetectedObjectObservations](self, "inputDetectedObjectObservations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDetectedObjectObservations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  v40 = v22;
  v41 = v23;
  if (v22 == v23)
  {

  }
  else
  {
    if (!v22 || !v23 || (v24 = objc_msgSend(v22, "count"), v24 > objc_msgSend(v41, "count")))
    {

LABEL_8:
      goto LABEL_12;
    }
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v29 = v41;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v48 != v31)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v33);

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v30);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = v40;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "uuid");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v28, "containsObject:", v38);

          if ((v39 & 1) == 0)
          {

            goto LABEL_8;
          }
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v35)
          continue;
        break;
      }
    }

  }
  v25 = -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide");
  if (v25 != objc_msgSend(v4, "maximumProcessingDimensionOnTheLongSide"))
  {
LABEL_12:
    v26 = 0;
    goto LABEL_13;
  }
  v42.receiver = self;
  v42.super_class = (Class)VNImageBasedRequest;
  v26 = -[VNRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v42, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
LABEL_13:

  return v26;
}

- (NSArray)inputDetectedObjectObservations
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDetectedObjectObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRegionOfInterest:(CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  CGRect v9;

  v9 = CGRectStandardize(regionOfInterest);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  -[VNRequest configuration](self, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRegionOfInterest:", x, y, width, height);

}

- (CGRect)regionOfInterestNonIntegralPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  v7 = v6 * (double)a3;
  v9 = v8 * (double)a3;
  v11 = v10 * (double)a4;
  v13 = v12 * (double)a4;
  result.size.height = v13;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v7;
  return result;
}

- (CGRect)regionOfInterestPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;

  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  v10.origin.x = v6 * (double)a3;
  v10.size.width = v7 * (double)a3;
  v10.origin.y = v8 * (double)a4;
  v10.size.height = v9 * (double)a4;
  return CGRectIntegral(v10);
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNImageBasedRequest *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = (VNImageBasedRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNImageBasedRequest;
    -[VNRequest applyConfigurationOfRequest:](&v7, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNImageBasedRequest regionOfInterest](v4, "regionOfInterest");
      -[VNImageBasedRequest setRegionOfInterest:](self, "setRegionOfInterest:");
      -[VNImageBasedRequest inputFaceObservations](v4, "inputFaceObservations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageBasedRequest setInputFaceObservations:](self, "setInputFaceObservations:", v5);

      -[VNImageBasedRequest inputDetectedObjectObservations](v4, "inputDetectedObjectObservations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageBasedRequest setInputDetectedObjectObservations:](self, "setInputDetectedObjectObservations:", v6);

    }
  }

}

- (NSString)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v19.receiver = self;
  v19.super_class = (Class)VNImageBasedRequest;
  -[VNRequest description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g, %g, %g, %g]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ ROI=%@"), v4, v9);

  -[VNImageBasedRequest inputFaceObservations](self, "inputFaceObservations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" inputFaceObservations=[%@]"), v13);

  }
  -[VNImageBasedRequest inputDetectedObjectObservations](self, "inputDetectedObjectObservations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "valueForKey:", CFSTR("uuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" inputDetectedObjectObservations=[%@]"), v17);

  }
  return (NSString *)v3;
}

- (NSArray)supportedImageSizeSet
{
  objc_class *v2;
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v6, -[VNRequest resolvedRevision](self, "resolvedRevision"), 0);
  v3 = v6;
  if (!v2
    || (-[objc_class supportedImageSizeSetForOptions:error:](v2, "supportedImageSizeSetForOptions:error:", v3, 0),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (void)setInputDetectedObjectObservations:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_msgSend(v4, "copy");

  -[VNRequest configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputDetectedObjectObservations:", v6);

}

- (id)_detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:(id)a3 relationWithRegionOfInterest:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[9];

  v6 = a3;
  if (-[VNImageBasedRequest isFullCoverageRegionOfInterest](self, "isFullCoverageRegionOfInterest"))
  {
    v7 = v6;
  }
  else
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __135__VNImageBasedRequest__detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations_relationWithRegionOfInterest___block_invoke;
    v14[3] = &__block_descriptor_72_e44_B32__0__VNDetectedObjectObservation_8Q16_B24l;
    v14[4] = a4;
    v14[5] = v8;
    v14[6] = v9;
    v14[7] = v10;
    v14[8] = v11;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)getOptionalValidatedInputDetectedObjectObservations:(id *)a3 forObservationClass:(Class)a4 relationWithRegionOfInterest:(unint64_t)a5 error:(id *)a6
{
  id v11;
  void *v12;
  BOOL v13;

  -[VNImageBasedRequest inputDetectedObjectObservations](self, "inputDetectedObjectObservations");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!+[VNValidationUtilities validateOptionalDetectedObjectObservations:forObservationClass:forRequest:error:](VNValidationUtilities, "validateOptionalDetectedObjectObservations:forObservationClass:forRequest:error:", v11, a4, self, a6))
    {
      v13 = 0;
      goto LABEL_10;
    }
    -[VNImageBasedRequest _detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:relationWithRegionOfInterest:](self, "_detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:relationWithRegionOfInterest:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      v13 = 1;
      v11 = v12;
      goto LABEL_10;
    }
    v11 = objc_retainAutorelease(v12);
    goto LABEL_6;
  }
  if (a3)
LABEL_6:
    *a3 = v11;
  v13 = 1;
LABEL_10:

  return v13;
}

BOOL __135__VNImageBasedRequest__detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations_relationWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;

  v3 = a2;
  objc_msgSend(v3, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 32);
  if (v12 == 1)
  {
    v13 = CGRectIntersectsRect(*(CGRect *)(a1 + 40), *(CGRect *)&v5);
  }
  else
  {
    if (v12)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v13 = CGRectContainsRect(*(CGRect *)(a1 + 40), *(CGRect *)&v5);
  }
  v14 = v13;
LABEL_7:

  return v14;
}

BOOL __86__VNImageBasedRequest__faceObservationsForRegionOfInterestContainingFaceObservations___block_invoke(CGRect *a1, void *a2)
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  _BOOL8 v8;
  CGRect v10;

  v3 = a2;
  objc_msgSend(v3, "boundingBox");
  v10.origin.x = v4;
  v10.origin.y = v5;
  v10.size.width = v6;
  v10.size.height = v7;
  v8 = CGRectContainsRect(a1[1], v10);

  return v8;
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[VNRequest results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "VNCoreMLTransformerSceneprintsAndReturnError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[VNRequest specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ did not produce any results"), v9);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v6);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v7;
}

- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[VNRequest results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "VNCoreMLTransformerDetectionprintAndReturnError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[VNRequest specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ did not produce any results"), v9);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v6);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v7;
}

@end
