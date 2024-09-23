@implementation VNTrackingRequest

- (NSUInteger)supportedNumberOfTrackersAndReturnError:(NSError *)error
{
  return 32;
}

- (id)applicableTrackerAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a5;
  v11 = -[VNTrackingRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a4, v10);
  objc_msgSend(v10, "trackerWithOptions:error:", v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    v13 = v12;
  }

  return v12;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  objc_msgSend((id)objc_opt_class(), "trackerTypeForRequestRevision:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[VNTrackingRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", v5, 0);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("VNTrackingOption_TrackerType"));
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, v8, a3);

    if (v9)
    {
      objc_msgSend(v9, "supportedComputeDevicesForOptions:error:", v7, a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
      {
        v14 = CFSTR("VNComputeStageMain");
        v15[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFDictionaryRef DictionaryRepresentation;
  void *v13;
  void *v14;
  VNProcessingDeviceComputeDeviceBridge *v15;
  VNProcessingDeviceComputeDeviceBridge *v16;
  void *v17;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)VNTrackingRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v19, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = (void *)objc_opt_class();
  objc_msgSend(v7, "trackerTypeForRequestRevision:error:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNTrackingOption_TrackerType"));
    -[VNTrackingRequest _trackingLevelOptionFromTrackingLevelEnum](self, "_trackingLevelOptionFromTrackingLevelEnum");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNTrackingOption_TrackingLevel"));

    -[VNTrackingRequest inputObservation](self, "inputObservation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNTrackingOption_TrackerKey"));

    objc_msgSend(v10, "boundingBox");
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v20);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("VNTrackingOption_InputBBox"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "frameCVPixelBufferFormatForRequestRevision:", a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNTrackingOption_CVPixelBufferFormat"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
    v15 = (VNProcessingDeviceComputeDeviceBridge *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = [VNProcessingDeviceComputeDeviceBridge alloc];
      +[VNProcessingDevice defaultDevice](VNProcessingDevice, "defaultDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[VNProcessingDeviceComputeDeviceBridge initWithProcessingDevice:](v16, "initWithProcessingDevice:", v17);

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("VNTrackingOption_ComputeDevice"));

  }
  return v6;
}

- (id)_trackingLevelOptionFromTrackingLevelEnum
{
  __CFString *v2;

  if (self->_trackingLevel)
    v2 = CFSTR("VNTrackingOption_TrackingLevelFast");
  else
    v2 = CFSTR("VNTrackingOption_TrackingLevelAccurate");
  return v2;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNTrackingRequest;
  if (-[VNRequest warmUpSession:error:](&v10, sel_warmUpSession_error_, v6, a4))
  {
    -[VNTrackingRequest applicableTrackerAndOptions:forRevision:loadedInSession:error:](self, "applicableTrackerAndOptions:forRevision:loadedInSession:error:", 0, -[VNRequest resolvedRevision](self, "resolvedRevision"), v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setTrackingLevel:(VNRequestTrackingLevel)trackingLevel
{
  self->_trackingLevel = trackingLevel;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)VNTrackingRequest;
  -[VNRequest sequencedRequestPreviousObservationsKey](&v8, sel_sequencedRequestPreviousObservationsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNTrackingRequest _trackingLevelOptionFromTrackingLevelEnum](self, "_trackingLevelOptionFromTrackingLevelEnum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:Trk=%@"), v4, v5);

  return v6;
}

- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3
{
  return -[VNTrackingRequest initWithDetectedObjectObservation:completionHandler:](self, "initWithDetectedObjectObservation:completionHandler:", a3, 0);
}

- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  VNTrackingRequest *v9;
  VNTrackingRequest *v10;
  VNTrackingRequest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNTrackingRequest;
  v9 = -[VNRequest initWithCompletionHandler:](&v13, sel_initWithCompletionHandler_, v8);
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v10->_inputObservation, a3);
      v10->_trackingLevel = 1;
      v10->_lastFrame = 0;
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)newDuplicateInstance
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[VNTrackingRequest inputObservation](self, "inputObservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDetectedObjectObservation:completionHandler:", v4, v5);

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNTrackingRequest *v4;
  objc_super v5;

  v4 = (VNTrackingRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackingRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_trackingLevel = -[VNTrackingRequest trackingLevel](v4, "trackingLevel");
      self->_lastFrame = -[VNTrackingRequest isLastFrame](v4, "isLastFrame");
    }
  }

}

- (void)setInputObservation:(VNDetectedObjectObservation *)inputObservation
{
  objc_storeStrong((id *)&self->_inputObservation, inputObservation);
}

- (VNDetectedObjectObservation)inputObservation
{
  return self->_inputObservation;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  BOOL v20;

  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestPerformerAndReturnError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    goto LABEL_14;
  }
  v12 = -[VNTrackingRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v11, "width"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNTrackingOption_InputImageMaxWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v11, "height"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("VNTrackingOption_InputImageMaxHeight"));

  -[VNTrackingRequest populateDetectorProcessingOptions:session:](self, "populateDetectorProcessingOptions:session:", v12, v9);
  objc_msgSend(v9, "trackerWithOptions:error:", v12, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v10, "recordTracker:", v15);
    -[VNTrackingRequest _resetTrackerIfNeeded:session:options:error:](self, "_resetTrackerIfNeeded:session:options:error:", v15, v9, v12, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if ((objc_msgSend(v16, "isTracking") & 1) != 0)
      {
        objc_msgSend(v16, "trackInFrame:error:", v11, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[VNTrackingRequest inputObservation](self, "inputObservation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTrackedObjects:inFrame:error:", v19, v11, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
  v18 = 1;
LABEL_13:

LABEL_14:
  if (-[VNTrackingRequest isLastFrame](self, "isLastFrame"))
    objc_msgSend(v9, "releaseTracker:", v16);
  if (!v18)
  {
    -[VNRequest setResults:](self, "setResults:", v17);
    v20 = v17 != 0;
    goto LABEL_19;
  }
LABEL_17:
  v20 = 0;
LABEL_19:

  return v20;
}

- (id)_resetTrackerIfNeeded:(id)a3 session:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGSize v39;
  const __CFDictionary *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  CGRect rect;
  CGRect v75;
  CGRect v76;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "isTracking") & 1) == 0 || (objc_msgSend(v9, "isResettable") & 1) == 0)
    goto LABEL_22;
  objc_msgSend(v9, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackerKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v9, "level");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_TrackingLevel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) == 0)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Tracker level has changed, restarting tracking sequence: current tracking level = %@; new tracking level = %@"),
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        (uint64_t)v23);
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v9, "lastTrackedBBox");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v39 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    rect.size = v39;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNTrackingOption_InputBBox"));
    v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v41 = CGRectMakeWithDictionaryRepresentation(v40, &rect);

    if (!v41)
    {
      if (a6)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: internal type conversion failed"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
LABEL_18:

      v51 = 0;
      goto LABEL_23;
    }
    v75.origin.x = v32;
    v75.origin.y = v34;
    v75.size.width = v36;
    v75.size.height = v38;
    v76 = CGRectIntersection(v75, rect);
    v48 = v36 * v38;
    if (v48 < 1.1755e-38)
    {
      if (a6)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: unexpected tracked object bounding box size"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        *a6 = v49;
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v53 = v76.size.width * v76.size.height;
    if ((float)(v53 / v48) < 0.35)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Bounding box input location has changed, restarting tracking sequence"), v42, v43, v44, v45, v46, v47, v73);
      VNValidatedLog(1, (uint64_t)CFSTR("currentTrackerBBox.x = %f; currentTrackerBBox.x = %f; currentTrackerBBox.width = %f; currentTrackerBBox.height = %f; "),
        v54,
        v55,
        v56,
        v57,
        v58,
        v59,
        *(uint64_t *)&v32);
      VNValidatedLog(1, (uint64_t)CFSTR("newTrackerBBox.x = %f; newTrackerBBox.x = %f; newTrackerBBox.width = %f; newTrackerBBox.height = %f; "),
        v60,
        v61,
        v62,
        v63,
        v64,
        v65,
        *(uint64_t *)&rect.origin.x);
      VNValidatedLog(1, (uint64_t)CFSTR("currentBBoxArea = %f; overlappedBBoxArea = %f; overlappedBBoxArea / currentBBoxArea = %f"),
        v66,
        v67,
        v68,
        v69,
        v70,
        v71,
        COERCE__INT64(v48));
      goto LABEL_11;
    }

LABEL_22:
    v51 = v9;
    goto LABEL_23;
  }
  VNValidatedLog(1, (uint64_t)CFSTR("Tracker key has changed, restarting tracking sequence: current tracker key = %@; new tracker key = %@"),
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    (uint64_t)v12);
LABEL_12:

  objc_msgSend(v10, "releaseTracker:", v9);
  objc_msgSend(v10, "trackerWithOptions:error:", v11, a6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
    v52 = v50;

LABEL_23:
  return v51;
}

- (VNRequestTrackingLevel)trackingLevel
{
  return self->_trackingLevel;
}

- (BOOL)isLastFrame
{
  return self->_lastFrame;
}

- (void)setLastFrame:(BOOL)lastFrame
{
  self->_lastFrame = lastFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputObservation, 0);
}

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  return 875704422;
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This method should not be invoked directly. Derived classes are responsible for providing correct implementation"));
  return 0;
}

@end
