@implementation VNFaceLandmarkDetectorRevision3

+ (unsigned)landmarkDetectorDNNVersion
{
  return 2;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorRevision3;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459CAC0, CFSTR("VNFaceLandmarkDetectorDNNProcessOption_Constellation"));

}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("landmarksflow-gwkf986dmy_63053_plus_8dtz95rnyx_quantized.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("image");
}

- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  v4 = a3;
  if (objc_msgSend(v4, "requestRevision") == 2 || objc_msgSend(v4, "requestRevision") == 3737841664)
  {
    objc_msgSend(v4, "unalignedBoundingBox");
    v15 = CGRectInset(v14, v14.size.width * -0.399999976 * 0.5, v14.size.height * -0.399999976 * 0.5);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNFaceLandmarkDetectorRevision3;
    -[VNFaceLandmarkDetector normalizedFaceBBoxForLandmarks:](&v13, sel_normalizedFaceBBoxForLandmarks_, v4);
  }
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;

  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  float *v32;
  float *v33;
  float v34;
  float *v35;
  float v36;
  float v37;
  float v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  id v42;
  double v43;
  _DWORD *v44;
  _DWORD *v45;
  void *v46;
  id v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  _BYTE *v53;
  void *v54;
  id v55;
  void *v56;
  _BYTE *v57;
  uint64_t v58;
  void *__p;
  _BYTE *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  objc_super v64;
  _QWORD v65[3];

  v12 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v65[1] = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v20 = a7;
  v21 = a9;
  v64.receiver = self;
  v64.super_class = (Class)VNFaceLandmarkDetectorRevision3;
  -[VNFaceLandmarkDetectorDNN processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v64, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, v20, a8, v21, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v47 = v23;
LABEL_43:

      goto LABEL_44;
    }
    if (objc_msgSend(v23, "count") != 1)
    {
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error while processing Face Landmarks"));
        v47 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = 0;
      }
      goto LABEL_43;
    }
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25
      || (v63 = 0,
          v62 = 0,
          !-[VNFaceLandmarkDetectorDNN requestConstellation:cvmlConstellation:fromOptions:error:](self, "requestConstellation:cvmlConstellation:fromOptions:error:", &v63, &v62, v19, a8)))
    {
      v47 = 0;
LABEL_42:

      goto LABEL_43;
    }
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v19, a8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v47 = 0;
LABEL_41:

      goto LABEL_42;
    }
    __p = 0;
    v60 = 0;
    v61 = 0;
    if (!-[VNFaceLandmarkDetectorDNN getLandmarkPoints:forRequestConstellation:error:](self, "getLandmarkPoints:forRequestConstellation:error:", &__p, 2, a8)|| (v27 = -[VNFaceLandmarkDetectorDNN landmarkPoints65](self, "landmarkPoints65"), !-[VNFaceLandmarkDetector postprocessLandmarkResultsForLandmarks:imageBuffer:outputFace:options:warningRecorder:error:](self, "postprocessLandmarkResultsForLandmarks:imageBuffer:outputFace:options:warningRecorder:error:", v27, v26, v24, v19, v20, a8))|| (v56 = (void *)*((_QWORD *)__p + 6), std::vector<_Geometry2D_point2D_>::push_back[abi:ne180100]((void **)v27, &v56), v56 = (void *)*((_QWORD *)__p + 13), std::vector<_Geometry2D_point2D_>::push_back[abi:ne180100]((void **)v27, &v56),
          !-[VNFaceLandmarkDetectorDNN translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:](self, "translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:", v27, v26, v24, a8)))
    {
      v47 = 0;
      goto LABEL_38;
    }
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *v27, v27[1] - *v27);
    if (v28)
    {
      v55 = v28;
      objc_msgSend(v24, "setLandmarkPoints65Data:originatingRequestSpecifier:");
      if (-[VNFaceLandmarkDetectorDNN translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:](self, "translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:", &__p, v26, v24, a8))
      {
        v56 = 0;
        v57 = 0;
        v58 = 0;
        if (-[VNFaceLandmarkDetectorDNN getLandmarkErrorEstimates:forRequestConstellation:error:](self, "getLandmarkErrorEstimates:forRequestConstellation:error:", &v56, 2, a8))
        {
          v32 = (float *)v56;
          if (v56 != v57)
          {
            v33 = (float *)((char *)v56 + 4);
            if ((char *)v56 + 4 != v57)
            {
              v34 = *(float *)v56;
              v35 = (float *)((char *)v56 + 4);
              do
              {
                v36 = *v35++;
                v37 = v36;
                if (v34 < v36)
                {
                  v34 = v37;
                  v32 = v33;
                }
                v33 = v35;
              }
              while (v35 != (float *)v57);
            }
          }
          v38 = *v32 / 0.2;
          LODWORD(v30) = 1.0;
          *(float *)&v31 = 1.0 - v38;
          v39 = v38 <= 1.0;
          LODWORD(v29) = 0;
          if (!v39)
            *(float *)&v31 = 0.0;
          if (*(float *)&v31 >= 0.0)
            *(float *)&v29 = *(float *)&v31;
          if (*(float *)&v29 > 1.0)
            *(float *)&v29 = 1.0;
          objc_msgSend(v24, "setLandmarkScore:", v29, v30, v31);
          if (v62 == 1)
            goto LABEL_53;
          if (v62 == 2)
          {
            v40 = objc_alloc(MEMORY[0x1E0C99D50]);
            v41 = objc_msgSend(v40, "initWithBytes:length:", __p, v60 - (_BYTE *)__p);
            v52 = (void *)v41;
            if (v41)
            {
              objc_msgSend(v24, "setLandmarkPointsData:originatingRequestSpecifier:", v41, v25);
              v42 = objc_alloc(MEMORY[0x1E0C99DE8]);
              v54 = (void *)objc_msgSend(v42, "initWithCapacity:", (v57 - (_BYTE *)v56) >> 2);
              v45 = v56;
              v44 = v57;
              v53 = v57;
              while (v45 != v44)
              {
                LODWORD(v43) = *v45;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "addObject:", v46);

                ++v45;
                v44 = v53;
              }
              v51 = (void *)objc_msgSend(v54, "copy");
              objc_msgSend(v24, "setLandmarkPrecisionEstimatesPerPoint:", v51);

LABEL_53:
              v65[0] = v24;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
              v47 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_54;
            }
            if (a8)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error while processing Face Landmarks"));
              v47 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:
              if (v56)
              {
                v57 = v56;
                operator delete(v56);
              }
              goto LABEL_56;
            }
          }
          else if (a8)
          {
            v49 = objc_alloc(MEMORY[0x1E0CB3940]);
            v50 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("Unexpected landmarks constellation (%d) while processing Face Landmarks"), v62);
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v50);
            *a8 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v47 = 0;
        goto LABEL_54;
      }
      v47 = 0;
    }
    else
    {
      if (!a8)
      {
        v47 = 0;
LABEL_57:

LABEL_38:
        if (__p)
        {
          v60 = __p;
          operator delete(__p);
        }
        goto LABEL_41;
      }
      v55 = 0;
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error while processing Face Landmarks"));
      v47 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_56:
    v28 = v55;
    goto LABEL_57;
  }
  v47 = 0;
LABEL_44:

  -[VNFaceLandmarkDetectorDNN releaseResources](self, "releaseResources");
  return v47;
}

@end
