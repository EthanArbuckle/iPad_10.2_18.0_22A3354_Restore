@implementation VNImageRegistrationRequest

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 1;
}

- (id)cachedFloatingImageBufferReturningError:(id *)a3
{
  VNImageBuffer *cachedFloatingImageBuffer;
  VNImageBuffer *v5;
  VNImageBuffer *v6;

  cachedFloatingImageBuffer = self->_cachedFloatingImageBuffer;
  if (cachedFloatingImageBuffer)
    goto LABEL_4;
  -[VNTargetedImageRequest requiredTargetedImageBufferReturningError:](self, "requiredTargetedImageBufferReturningError:", a3);
  v5 = (VNImageBuffer *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self->_cachedFloatingImageBuffer;
    self->_cachedFloatingImageBuffer = v5;

    cachedFloatingImageBuffer = self->_cachedFloatingImageBuffer;
LABEL_4:
    v5 = cachedFloatingImageBuffer;
  }
  return v5;
}

- (id)cachedFloatingImageRegistrationSignatureReturningError:(id *)a3
{
  VNImageRegistrationSignature *cachedFloatingImageSignature;
  VNImageRegistrationSignature *v6;
  VNImageRegistrationSignature *v7;
  VNImageRegistrationSignature *v8;
  VNImageRegistrationSignature *v9;
  VNImageRegistrationSignature *v10;

  cachedFloatingImageSignature = self->_cachedFloatingImageSignature;
  if (cachedFloatingImageSignature)
    goto LABEL_4;
  -[VNImageRegistrationRequest cachedFloatingImageBufferReturningError:](self, "cachedFloatingImageBufferReturningError:");
  v6 = (VNImageRegistrationSignature *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = [VNImageRegistrationSignature alloc];
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v9 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:](v8, "initWithImageBuffer:regionOfInterest:error:", v7, a3);
    v10 = self->_cachedFloatingImageSignature;
    self->_cachedFloatingImageSignature = v9;

    cachedFloatingImageSignature = self->_cachedFloatingImageSignature;
LABEL_4:
    v6 = cachedFloatingImageSignature;
  }
  return v6;
}

- (BOOL)getReferenceImageBuffer:(id *)a3 registrationSignature:(id *)a4 forRequestPerformingContext:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  VNImageRegistrationSignature *v14;
  VNImageRegistrationSignature *v15;
  BOOL v16;
  id v17;
  id v18;

  v10 = a5;
  objc_msgSend(v10, "previousSequencedObservationsAcceptedByRequest:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "imageBufferAndReturnError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      if (a4)
      {
        v14 = [VNImageRegistrationSignature alloc];
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        v15 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:](v14, "initWithImageBuffer:regionOfInterest:error:", v12, a6);
        *a4 = v15;
        if (!v15)
          goto LABEL_24;
      }
    }
    else
    {
      if (a3
        && (-[VNImageRegistrationRequest cachedFloatingImageBufferReturningError:](self, "cachedFloatingImageBufferReturningError:", a6), v17 = (id)objc_claimAutoreleasedReturnValue(), (*a3 = v17) == 0)|| a4&& (-[VNImageRegistrationRequest cachedFloatingImageRegistrationSignatureReturningError:](self, "cachedFloatingImageRegistrationSignatureReturningError:", a6), v18 = (id)objc_claimAutoreleasedReturnValue(), (*a4 = v18) == 0))
      {
        v12 = 0;
LABEL_24:
        v16 = 0;
        goto LABEL_20;
      }
      v12 = 0;
    }
LABEL_19:
    v16 = 1;
LABEL_20:

    goto LABEL_21;
  }
  if (+[VNValidationUtilities validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "validateArray:named:hasElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", v11, CFSTR("previous request results"), objc_opt_class(), 1, 1, a6))
  {
    if (a3)
      *a3 = 0;
    if (!a4)
    {
      v16 = 1;
      goto LABEL_21;
    }
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatingImageSignature");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFloatingImageSignature, 0);
  objc_storeStrong((id *)&self->_cachedFloatingImageBuffer, 0);
}

@end
