@implementation VNTrackTranslationalImageRegistrationRequest

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&revisionAvailability_revisionAvailability;
}

- (VNTrackTranslationalImageRegistrationRequest)init
{
  return -[VNTrackTranslationalImageRegistrationRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNTrackTranslationalImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](self, "initWithFrameAnalysisSpacing:completionHandler:", &v4, completionHandler);
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  VNImageRegistrationSignature *v11;
  VNImageRegistrationSignature *v12;
  VNImageRegistrationSignature *previousImageRegistrationSignature;
  VNImageRegistrationSignature *v14;
  VNImageTranslationAlignmentObservation *v15;
  void *v16;
  VNImageTranslationAlignmentObservation *v17;
  BOOL v18;
  void *v19;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v18 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = [VNImageRegistrationSignature alloc];
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v12 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:](v11, "initWithImageBuffer:regionOfInterest:error:", v10, a5);
    if (v12)
    {
      if (self->_previousRequestRevision != 1)
      {
        self->_previousRequestRevision = 0;
        previousImageRegistrationSignature = self->_previousImageRegistrationSignature;
        self->_previousImageRegistrationSignature = 0;

      }
      v14 = self->_previousImageRegistrationSignature;
      if (!v14)
      {
        v17 = 0;
        goto LABEL_15;
      }
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
      if (+[VNImageRegistration computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:](VNImageRegistration, "computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:", &v22, v14, v12, a5, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.25))))
      {
        v15 = [VNImageTranslationAlignmentObservation alloc];
        -[VNRequest specifier](self, "specifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[VNObservation initWithOriginatingRequestSpecifier:](v15, "initWithOriginatingRequestSpecifier:", v16);

        v21[0] = v22;
        v21[1] = v23;
        v21[2] = v24;
        -[VNImageTranslationAlignmentObservation setAlignmentTransform:](v17, "setAlignmentTransform:", v21);
LABEL_15:
        v18 = 1;
        self->_previousRequestRevision = 1;
        objc_storeStrong((id *)&self->_previousImageRegistrationSignature, v12);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v17, 0);
        -[VNRequest setResults:](self, "setResults:", v19);

        goto LABEL_16;
      }
    }
    v18 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_18:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousImageRegistrationSignature, 0);
}

@end
