@implementation VNTranslationalImageRegistrationRequest

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

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  VNImageTranslationAlignmentObservation *v12;
  BOOL v13;
  void *v14;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[VNImageRegistrationRequest cachedFloatingImageRegistrationSignatureReturningError:](self, "cachedFloatingImageRegistrationSignatureReturningError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v20 = 0;
    v10 = -[VNImageRegistrationRequest getReferenceImageBuffer:registrationSignature:forRequestPerformingContext:error:](self, "getReferenceImageBuffer:registrationSignature:forRequestPerformingContext:error:", 0, &v20, v8, a5);
    v11 = v20;
    if (!v10)
    {
      v13 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v12 = -[VNObservation initWithRequestRevision:]([VNImageTranslationAlignmentObservation alloc], "initWithRequestRevision:", a3);
    -[VNImageAlignmentObservation setReferenceImageSignature:](v12, "setReferenceImageSignature:", v11);
    -[VNImageAlignmentObservation setFloatingImageSignature:](v12, "setFloatingImageSignature:", v9);
    if (v11)
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
      if (!+[VNImageRegistration computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:](VNImageRegistration, "computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:", &v17, v11, v9, a5, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.25))))
      {
        v13 = 0;
        goto LABEL_10;
      }
      v16[0] = v17;
      v16[1] = v18;
      v16[2] = v19;
      -[VNImageTranslationAlignmentObservation setAlignmentTransform:](v12, "setAlignmentTransform:", v16);
    }
    v21[0] = v12;
    v13 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest setResults:](self, "setResults:", v14);

LABEL_10:
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

@end
