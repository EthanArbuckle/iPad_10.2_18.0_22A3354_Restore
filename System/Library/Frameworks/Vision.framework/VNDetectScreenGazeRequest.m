@implementation VNDetectScreenGazeRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  if (a4 == 2 && (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return 3737841670;
  else
    return 0;
}

+ (id)publicRevisionsSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VNDetectScreenGazeRequest_publicRevisionsSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNDetectScreenGazeRequest publicRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectScreenGazeRequest publicRevisionsSet]::onceToken, block);
  return (id)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;
}

void __47__VNDetectScreenGazeRequest_publicRevisionsSet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___VNDetectScreenGazeRequest;
  objc_msgSendSuper2(&v6, sel_publicRevisionsSet);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;
  +[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions = v1;

  if (!+[VNScreenGazeDetectorRevision2 supportsExecution](VNScreenGazeDetectorRevision2, "supportsExecution"))
  {
    v3 = (void *)objc_msgSend((id)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions, "mutableCopy");
    objc_msgSend(v3, "removeIndex:", 2);
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;
    +[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions = v4;

  }
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNDetectScreenGazeRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectScreenGazeRequest screenSize](self, "screenSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNScreenGazeDetectorInitOption_ScreenSize"));

  }
  return v6;
}

- (VNDetectScreenGazeRequest)init
{
  return -[VNDetectScreenGazeRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNDetectScreenGazeRequest)initWithCompletionHandler:(id)a3
{
  id v4;
  VNDetectScreenGazeRequest *v5;
  objc_super v7;
  CMTime v8;

  v4 = a3;
  CMTimeMake(&v8, 0, 1);
  v7.receiver = self;
  v7.super_class = (Class)VNDetectScreenGazeRequest;
  v5 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v7, sel_initWithFrameAnalysisSpacing_completionHandler_, &v8, v4);

  return v5;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectScreenGazeRequest *v4;
  VNDetectScreenGazeRequest *v5;
  objc_super v6;

  v4 = (VNDetectScreenGazeRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectScreenGazeRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNDetectScreenGazeRequest setTemporalSmoothingFrameCount:](self, "setTemporalSmoothingFrameCount:", -[VNDetectScreenGazeRequest temporalSmoothingFrameCount](v5, "temporalSmoothingFrameCount"));

    }
  }

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;

  if (a3 != 2)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = 0;
      *a4 = v7;
      return v5;
    }
LABEL_9:
    v5 = 0;
    return v5;
  }
  if (!+[VNScreenGazeDetectorRevision2 supportsExecution](VNScreenGazeDetectorRevision2, "supportsExecution"))
  {
    if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 22, CFSTR("Requires newer ANE device"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v5 = CFSTR("VNE5RTScreenGazeDetectorType");
  v6 = CFSTR("VNE5RTScreenGazeDetectorType");
  return v5;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id *v9;
  VNScreenGazeState *v10;
  int v11;
  int v12;
  VNDetectScreenGazeRequest *v13;
  NSMutableArray *v14;
  NSMutableArray *faceObjectStates;
  VNScreenGazeState *state;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  VNDetectFaceRectanglesRequest *v31;
  void *v32;
  char v33;
  uint64_t v34;
  id v35;
  VNScreenGazeState *v36;
  void *v37;
  uint64_t v38;
  char **v39;
  uint64_t v40;
  VNScreenGazeState *v41;
  id v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  uint64_t v60;
  VNScreenGazeFaceObjectState *v61;
  int temporalSmoothingFrameCount;
  int currentFrame;
  id v64;
  uint64_t v65;
  NSUUID *uuid;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  VNScreenGazeState *v72;
  id v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  void *v82;
  void *v83;
  const char *v84;
  void *v85;
  id obj;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  id v94;
  id *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  objc_super v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  _BYTE v111[128];
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  objc_super v117;
  uint64_t v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v87 = v8;
  if (!self->_state)
  {
    v9 = a5;
    v10 = [VNScreenGazeState alloc];
    v11 = -[VNDetectScreenGazeRequest temporalSmoothingFrameCount](self, "temporalSmoothingFrameCount");
    if (v10)
    {
      v12 = v11;
      v117.receiver = v10;
      v117.super_class = (Class)VNScreenGazeState;
      v13 = -[VNRequest init](&v117, sel_init);
      v10 = (VNScreenGazeState *)v13;
      if (v13)
      {
        LODWORD(v13->super.super.super._completionHandler) = v12;
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        faceObjectStates = v10->_faceObjectStates;
        v10->_faceObjectStates = v14;

      }
    }
    state = self->_state;
    self->_state = v10;

    v8 = v87;
    a5 = v9;
  }
  v95 = a5;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v85 = v17;
  if (!v17)
  {
    v23 = 0;
    goto LABEL_91;
  }
  v89 = objc_msgSend(v17, "width");
  v88 = objc_msgSend(v18, "height");
  v94 = v87;
  *(_QWORD *)&v106 = 0;
  v19 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v106, 1, v95);
  v20 = (id)v106;
  v21 = v20;
  if (v19)
  {
    v22 = v20;
    if (v22)
    {
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v113, &v117, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v114;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v114 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
            objc_msgSend(v28, "landmarks");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v29 || (unint64_t)objc_msgSend(v28, "requestRevision") < 2)
            {

              goto LABEL_22;
            }

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v113, &v117, 16);
          if (v25)
            continue;
          break;
        }
      }

      v21 = v24;
      v83 = v21;
      goto LABEL_33;
    }
  }
LABEL_22:
  objc_msgSend(v94, "requestPerformerAndReturnError:", v95);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_31;
  if (!v21)
  {
    v31 = objc_alloc_init(VNDetectFaceRectanglesRequest);
    -[VNDetectFaceRectanglesRequest applyConfigurationOfRequest:](v31, "applyConfigurationOfRequest:", self);
    v117.receiver = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "performDependentRequests:onBehalfOfRequest:inContext:error:", v32, self, v94, v95);

    if ((v33 & 1) == 0)
    {

      v21 = 0;
      goto LABEL_31;
    }
    -[VNRequest results](v31, "results");
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a3 != 2)
  {
    if (v95)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
      v83 = 0;
      *v95 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_31:
    v83 = 0;
    goto LABEL_32;
  }
  v21 = v21;
  v83 = v21;
LABEL_32:

LABEL_33:
  if (v83)
  {
    objc_msgSend(v94, "session");
    v100 = 0;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v100, a3);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v100;
    v93 = (void *)v34;
    if (v34)
    {
      v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v36 = self->_state;
      if (v36)
        ++v36->_currentFrame;
      v112 = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      obj = v83;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
      if (v38)
      {
        v91 = *(_QWORD *)v97;
        v39 = &selRef_emptyTorsoprintDataForRevision_;
        do
        {
          v90 = v38;
          v40 = 0;
          v84 = v39[451];
          do
          {
            if (*(_QWORD *)v97 != v91)
              objc_enumerationMutation(obj);
            v41 = self->_state;
            v42 = *(id *)(*((_QWORD *)&v96 + 1) + 8 * v40);
            if (v41)
            {
              v103 = 0u;
              v104 = 0u;
              v101 = 0u;
              v102 = 0u;
              v43 = v41->_faceObjectStates;
              v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v101, &v113, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v102;
                do
                {
                  v46 = 0;
                  do
                  {
                    if (*(_QWORD *)v102 != v45)
                      objc_enumerationMutation(v43);
                    v47 = *(id **)(*((_QWORD *)&v101 + 1) + 8 * v46);
                    if (v47)
                    {
                      objc_msgSend(v47[1], "boundingBox");
                      v49 = v48;
                      v51 = v50;
                      v53 = v52;
                      v55 = v54;
                    }
                    else
                    {
                      v51 = 0.0;
                      v53 = 0.0;
                      v55 = 0.0;
                      v49 = 0.0;
                    }
                    objc_msgSend(v42, "boundingBox");
                    v121.origin.x = v56;
                    v121.origin.y = v57;
                    v121.size.width = v58;
                    v121.size.height = v59;
                    v119.origin.x = v49;
                    v119.origin.y = v51;
                    v119.size.width = v53;
                    v119.size.height = v55;
                    v120 = CGRectIntersection(v119, v121);
                    if (v120.size.width * v120.size.height / (v53 * v55) >= 0.7)
                    {
                      -[VNScreenGazeFaceObjectState _replaceFaceObservation:imageWidth:imageHeight:frameIndex:]((uint64_t)v47, v42, v89, v88, v41->_currentFrame);
                      v61 = v47;

                      goto LABEL_60;
                    }
                    ++v46;
                  }
                  while (v44 != v46);
                  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v101, &v113, 16);
                  v44 = v60;
                }
                while (v60);
              }

              v61 = [VNScreenGazeFaceObjectState alloc];
              temporalSmoothingFrameCount = v41->_temporalSmoothingFrameCount;
              currentFrame = v41->_currentFrame;
              v64 = v42;
              if (v61)
              {
                v105.receiver = v61;
                v105.super_class = (Class)VNScreenGazeFaceObjectState;
                v61 = (VNScreenGazeFaceObjectState *)objc_msgSendSuper2(&v105, v84);
                if (v61)
                {
                  objc_msgSend(v64, "uuid");
                  v65 = objc_claimAutoreleasedReturnValue();
                  uuid = v61->_uuid;
                  v61->_uuid = (NSUUID *)v65;

                  v67 = operator new();
                  *(_DWORD *)v67 = temporalSmoothingFrameCount;
                  *(_BYTE *)(v67 + 4) = temporalSmoothingFrameCount > 1;
                  *(_OWORD *)(v67 + 8) = xmmword_1A15FB3F0;
                  *(_OWORD *)(v67 + 24) = 0u;
                  *(_OWORD *)(v67 + 40) = 0u;
                  *(_OWORD *)(v67 + 56) = 0u;
                  v61->_screenGazeState = (void *)v67;
                  -[VNScreenGazeFaceObjectState _replaceFaceObservation:imageWidth:imageHeight:frameIndex:]((uint64_t)v61, v64, v89, v88, currentFrame);
                }
              }

              -[NSMutableArray addObject:](v41->_faceObjectStates, "addObject:", v61);
            }
            else
            {
              v61 = 0;
            }
LABEL_60:

            v110 = v42;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v68, CFSTR("VNDetectorProcessOption_InputFaceObservations"));

            objc_msgSend(v35, "setObject:forKeyedSubscript:", v61, CFSTR("VNScreenGazeDetectorProcessOption_FaceObjectState"));
            v69 = objc_msgSend(v94, "qosClass");
            -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
            objc_msgSend(v93, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v69, v35, self, v95, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v70)
            {

              v71 = 1;
              goto LABEL_68;
            }
            objc_msgSend(v92, "addObjectsFromArray:", v70);

            ++v40;
          }
          while (v40 != v90);
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
          v39 = &selRef_emptyTorsoprintDataForRevision_;
        }
        while (v38);
      }
      v71 = 0;
LABEL_68:

      v72 = self->_state;
      if (v72)
      {
        if (v72->_temporalSmoothingFrameCount > 1)
        {
          v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v74 = v72->_faceObjectStates;
          v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v106, &v117, 16);
          if (v75)
          {
            v76 = *(_QWORD *)v107;
            do
            {
              v77 = 0;
              do
              {
                if (*(_QWORD *)v107 != v76)
                  objc_enumerationMutation(v74);
                v78 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v77);
                if (v78)
                  v79 = *(_DWORD *)(v78 + 32);
                else
                  v79 = 0;
                if (v79 != v72->_currentFrame)
                  objc_msgSend(v73, "addObject:");
                ++v77;
              }
              while (v75 != v77);
              v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v106, &v117, 16);
              v75 = v80;
            }
            while (v80);
          }

          -[NSMutableArray removeObjectsInArray:](v72->_faceObjectStates, "removeObjectsInArray:", v73);
        }
        else
        {
          -[NSMutableArray removeAllObjects](v72->_faceObjectStates, "removeAllObjects");
        }
      }
      v23 = v71 == 0;
      if (!v71)
        -[VNRequest setResults:](self, "setResults:", v92);

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

LABEL_91:
  return v23;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNDetectScreenGazeRequest temporalSmoothingFrameCount](self, "temporalSmoothingFrameCount");
  if (v5 == objc_msgSend(v4, "temporalSmoothingFrameCount"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDetectScreenGazeRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)temporalSmoothingFrameCount
{
  void *v2;
  int64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "temporalSmoothingFrameCount");

  return v3;
}

- (void)setTemporalSmoothingFrameCount:(int64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTemporalSmoothingFrameCount:", a3);

}

- (unint64_t)screenSize
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenSize");

  return v3;
}

- (void)setScreenSize:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScreenSize:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectScreenGazeRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
