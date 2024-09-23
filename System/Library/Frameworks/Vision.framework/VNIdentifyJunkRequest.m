@implementation VNIdentifyJunkRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNJunkIdentifierType");
  return CFSTR("VNJunkIdentifierType");
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing IdentifyJunk request\n"), v9, v10, v11, v12, v13, v14, v24);
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v15, 0, 0, a5))
  {
    objc_msgSend(v8, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v25, a3, v16, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v25;
    if (v17)
    {
      v26[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v20 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v20, v18, self, a5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;
      if (v21)
        -[VNRequest setResults:](self, "setResults:", v21);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
