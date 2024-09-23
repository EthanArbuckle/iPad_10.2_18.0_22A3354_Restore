@implementation VNDetectHumanHandPoseRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNHumanHandPoseDetectorType");
    v5 = CFSTR("VNHumanHandPoseDetectorType");
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

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v8, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRequest usesCPUOnly](self, "usesCPUOnly"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("VNHumanPoseDetectorInitOption_UseCPUOnly"));

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  if (-[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4))
  {
    v5 = objc_msgSend(v4, "maximumHandCount");
    v6 = v5 >= -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount");
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v21, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v11)
    {
      v22[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("VNHumanHandPoseDetectorProcessOption_MaximumHandCount"));

      v15 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 != 0;
      if (v16)
      {
        if (a3 == 1
          && +[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:](VNRuntimeUtilities, "linkTimeOrRunTimeBeforeVersion:", 393216))
        {
          v18 = &__block_literal_global_86_33184;
          objc_msgSend(v16, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);
          v19 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v19;
        }
        -[VNRequest setResults:](self, "setResults:", v16);
      }

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

  return v17;
}

- (void)setProcessedResults:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v5 = -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount");
  if (objc_msgSend(v4, "count") > v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanHandPoseRequest;
  -[VNRequest setProcessedResults:](&v8, sel_setProcessedResults_, v4);

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNDetectHumanHandPoseRequest;
  return -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount") ^ __ROR8__(-[VNDetectHumanHandPoseRequest hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNDetectHumanHandPoseRequest *v4;
  VNDetectHumanHandPoseRequest *v5;
  NSUInteger v6;
  BOOL v7;
  objc_super v9;

  v4 = (VNDetectHumanHandPoseRequest *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNDetectHumanHandPoseRequest;
    if (-[VNDetectHumanHandPoseRequest isEqual:](&v9, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount");
      v7 = v6 == -[VNDetectHumanHandPoseRequest maximumHandCount](v5, "maximumHandCount");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNDetectHumanHandPoseRequest;
  v4 = -[VNRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
    objc_msgSend(v4, "setMaximumHandCount:", -[VNDetectHumanHandPoseRequest maximumHandCount](self, "maximumHandCount"));
  return v4;
}

- (NSArray)supportedJointNamesAndReturnError:(NSError *)error
{
  void *v5;
  NSError *v6;

  if (-[VNRequest revision](self, "revision") == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointNamesRevision1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (error)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
    v6 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    *error = v6;
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  void *v5;
  NSError *v6;

  if (-[VNRequest revision](self, "revision") == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointsGroupNamesRevision1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (error)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
    v6 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    *error = v6;
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSUInteger)maximumHandCount
{
  void *v2;
  NSUInteger v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumHandCount");

  return v3;
}

- (void)setMaximumHandCount:(NSUInteger)maximumHandCount
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumHandCount:", maximumHandCount);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a4)
    return 0;
  v8 = v4;
  v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNDetectHumanHandPoseRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_12053);
  return (id)+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames;
}

+ (id)_supportedJointsGroupNamesRevision1
{
  if (+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::onceToken, &__block_literal_global_102);
  return (id)+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames;
}

+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  VNDetectHumanHandPoseRequest *v6;
  void *v7;

  v6 = objc_alloc_init(VNDetectHumanHandPoseRequest);
  if (-[VNRequest setRevision:error:](v6, "setRevision:error:", revision, error))
  {
    -[VNDetectHumanHandPoseRequest supportedJointNamesAndReturnError:](v6, "supportedJointNamesAndReturnError:", error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

+ (NSArray)supportedJointsGroupNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  VNDetectHumanHandPoseRequest *v6;
  void *v7;

  v6 = objc_alloc_init(VNDetectHumanHandPoseRequest);
  if (-[VNRequest setRevision:error:](v6, "setRevision:error:", revision, error))
  {
    -[VNDetectHumanHandPoseRequest supportedJointsGroupNamesAndReturnError:](v6, "supportedJointsGroupNamesAndReturnError:", error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

void __67__VNDetectHumanHandPoseRequest__supportedJointsGroupNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNHLRKT");
  v2[1] = CFSTR("VNHLRKM");
  v2[2] = CFSTR("VNHLRKI");
  v2[3] = CFSTR("VNHLRKR");
  v2[4] = CFSTR("VNHLRKP");
  v2[5] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames;
  +[VNDetectHumanHandPoseRequest _supportedJointsGroupNamesRevision1]::jointGroupNames = v0;

}

void __61__VNDetectHumanHandPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];

  v2[21] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNHLKWRI");
  v2[1] = CFSTR("VNHLKTCMC");
  v2[2] = CFSTR("VNHLKTMP");
  v2[3] = CFSTR("VNHLKTIP");
  v2[4] = CFSTR("VNHLKTTIP");
  v2[5] = CFSTR("VNHLKIMCP");
  v2[6] = CFSTR("VNHLKIPIP");
  v2[7] = CFSTR("VNHLKIDIP");
  v2[8] = CFSTR("VNHLKITIP");
  v2[9] = CFSTR("VNHLKMMCP");
  v2[10] = CFSTR("VNHLKMPIP");
  v2[11] = CFSTR("VNHLKMDIP");
  v2[12] = CFSTR("VNHLKMTIP");
  v2[13] = CFSTR("VNHLKRMCP");
  v2[14] = CFSTR("VNHLKRPIP");
  v2[15] = CFSTR("VNHLKRDIP");
  v2[16] = CFSTR("VNHLKRTIP");
  v2[17] = CFSTR("VNHLKPMCP");
  v2[18] = CFSTR("VNHLKPPIP");
  v2[19] = CFSTR("VNHLKPDIP");
  v2[20] = CFSTR("VNHLKPTIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames;
  +[VNDetectHumanHandPoseRequest _supportedJointNamesRevision1]::jointNames = v0;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectHumanHandPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
