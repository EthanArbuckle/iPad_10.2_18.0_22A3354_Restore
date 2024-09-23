@implementation VNTrackHomographicImageRegistrationRequest

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNTrackHomographicImageRegistrationRequest revisionAvailability]::revisionAvailability;
}

- (VNTrackHomographicImageRegistrationRequest)init
{
  return -[VNTrackHomographicImageRegistrationRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNTrackHomographicImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](self, "initWithFrameAnalysisSpacing:completionHandler:", &v4, completionHandler);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNHomographicImageRegistrationDetectorType");
    v5 = CFSTR("VNHomographicImageRegistrationDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  VNImageRegistrationSignature *v19;
  int *v20;
  int *v21;
  CGSize v22;
  VNImageBuffer *previousImageBuffer;
  VNImageRegistrationSignature *previousImageRegistrationSignature;
  VNImageBuffer **p_previousImageBuffer;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  BOOL v30;
  double *v31;
  void *v33;
  id v34;

  v8 = a4;
  -[VNTrackHomographicImageRegistrationRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v30 = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageRegistrationSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v10, a5, v11, v13, v15, v17);
    if (!v19)
    {
      v30 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v20 = &OBJC_IVAR___VNClustererContextBase__torsoprintRequestRevision;
    v21 = &OBJC_IVAR___VNClustererContextBase__torsoprintRequestRevision;
    if (self->_previousRequestRevision != a3)
    {
      self->_previousRequestRevision = 0;
      v22 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_previousRegionOfInterest.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_previousRegionOfInterest.size = v22;
      previousImageBuffer = self->_previousImageBuffer;
      self->_previousImageBuffer = 0;

      previousImageRegistrationSignature = self->_previousImageRegistrationSignature;
      self->_previousImageRegistrationSignature = 0;

    }
    p_previousImageBuffer = &self->_previousImageBuffer;
    if (self->_previousImageBuffer)
    {
      objc_msgSend(v8, "session");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v34, a3, v33, a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v34;
      v28 = v27;
      if (!v26)
      {

        v29 = 0;
LABEL_16:
        v30 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", *p_previousImageBuffer, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", self->_previousImageRegistrationSignature, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"));
      objc_msgSend(v26, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v8, "qosClass"), v28, self, a5, 0, v12, v14, v16, v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = &OBJC_IVAR___VNClustererContextBase__torsoprintRequestRevision;
      v20 = &OBJC_IVAR___VNClustererContextBase__torsoprintRequestRevision;
      if (!v29)
        goto LABEL_16;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0C9AA60];
    }
    self->_previousRequestRevision = a3;
    v31 = (double *)((char *)self + v20[424]);
    *v31 = v12;
    v31[1] = v14;
    v31[2] = v16;
    v31[3] = v18;
    objc_storeStrong((id *)p_previousImageBuffer, v10);
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + v21[426]), v19);
    -[VNRequest setResults:](self, "setResults:", v29);
    v30 = 1;
LABEL_17:

    goto LABEL_18;
  }
  v30 = 0;
LABEL_20:

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousImageRegistrationSignature, 0);
  objc_storeStrong((id *)&self->_previousImageBuffer, 0);
}

@end
