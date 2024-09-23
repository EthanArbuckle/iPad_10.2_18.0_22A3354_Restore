@implementation VNHomographicImageRegistrationRequest

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

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  id v22;
  id v23;
  id v24;

  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v24, a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    -[VNImageRegistrationRequest cachedFloatingImageBufferReturningError:](self, "cachedFloatingImageBufferReturningError:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer"));
      v22 = 0;
      v23 = 0;
      v13 = -[VNImageRegistrationRequest getReferenceImageBuffer:registrationSignature:forRequestPerformingContext:error:](self, "getReferenceImageBuffer:registrationSignature:forRequestPerformingContext:error:", &v23, &v22, v8, a5);
      v14 = v23;
      v15 = v22;
      if (v13)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"));
        -[VNImageRegistrationRequest cachedFloatingImageRegistrationSignatureReturningError:](self, "cachedFloatingImageRegistrationSignatureReturningError:", a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v21 = v16;
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"));
          v17 = objc_msgSend(v8, "qosClass");
          -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
          objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v11, self, a5, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 != 0;
          if (v18)
            -[VNRequest setResults:](self, "setResults:", v18);

          v16 = v21;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
