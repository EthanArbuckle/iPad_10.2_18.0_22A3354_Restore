@implementation VNCreateNeuralHashprintRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  VNCreateNeuralHashprintRequest *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCreateNeuralHashprintRequest;
  if ((objc_msgSendSuper2(&v10, sel_warmUpSession_error_, v6, a4) & 1) != 0)
  {
    v7 = objc_alloc_init(VNCreateNeuralHashprintRequest);
    v8 = -[VNRequest warmUpSession:error:](v7, "warmUpSession:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VN4nFZhnOcBOiJmeVWzBWsvType");
  return CFSTR("VN4nFZhnOcBOiJmeVWzBWsvType");
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v10, 0, 0, a5))
    {
      objc_msgSend(v9, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v19, 1, v11, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v19;
      if (v12)
      {
        v20[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        v15 = objc_msgSend(v9, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v13, self, a5, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 != 0;
        if (v16)
          -[VNRequest setResults:](self, "setResults:", v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCreateNeuralHashprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
