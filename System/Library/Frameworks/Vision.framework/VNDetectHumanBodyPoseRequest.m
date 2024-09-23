@implementation VNDetectHumanBodyPoseRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;

  if (a3 == 3737841664 || a3 == 1)
  {
    v5 = CFSTR("VNHumanBodyPoseDetectorType");
    v6 = CFSTR("VNHumanBodyPoseDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSArray)supportedJointNamesAndReturnError:(NSError *)error
{
  NSUInteger v5;
  void *v6;

  v5 = -[VNRequest revision](self, "revision");
  if (v5 == 3737841664 || v5 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointNamesRevision1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (error)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      return (NSArray *)0;
    }
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  NSUInteger v5;
  void *v6;

  v5 = -[VNRequest revision](self, "revision");
  if (v5 == 3737841664 || v5 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointsGroupNamesRevision1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (error)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      return (NSArray *)0;
    }
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanBodyPoseRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v8, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRequest usesCPUOnly](self, "usesCPUOnly"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("VNHumanPoseDetectorInitOption_UseCPUOnly"));

  return v5;
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

      if (a3 == 3737841664)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectHumanBodyPoseRequest detectsHands](self, "detectsHands"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("VNHumanBodyPoseDetectorProcessOption_HolisticDetection"));

      }
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

- (BOOL)detectsHands
{
  return self->_detectsHands;
}

- (void)setDetectsHands:(BOOL)a3
{
  self->_detectsHands = a3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_20956);
  return (id)+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames;
}

+ (id)_supportedJointsGroupNamesRevision1
{
  if (+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::onceToken, &__block_literal_global_20_20955);
  return (id)+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames;
}

+ (NSArray)supportedJointNamesForRevision:(NSUInteger)revision error:(NSError *)error
{
  VNDetectHumanBodyPoseRequest *v6;
  void *v7;

  v6 = objc_alloc_init(VNDetectHumanBodyPoseRequest);
  if (-[VNRequest setRevision:error:](v6, "setRevision:error:", revision, error))
  {
    -[VNDetectHumanBodyPoseRequest supportedJointNamesAndReturnError:](v6, "supportedJointNamesAndReturnError:", error);
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
  VNDetectHumanBodyPoseRequest *v6;
  void *v7;

  v6 = objc_alloc_init(VNDetectHumanBodyPoseRequest);
  if (-[VNRequest setRevision:error:](v6, "setRevision:error:", revision, error))
  {
    -[VNDetectHumanBodyPoseRequest supportedJointsGroupNamesAndReturnError:](v6, "supportedJointsGroupNamesAndReturnError:", error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

void __67__VNDetectHumanBodyPoseRequest__supportedJointsGroupNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNIPOAll");
  v2[1] = CFSTR("VNBLKFACE");
  v2[2] = CFSTR("VNBLKTORSO");
  v2[3] = CFSTR("VNBLKLARM");
  v2[4] = CFSTR("VNBLKRARM");
  v2[5] = CFSTR("VNBLKLLEG");
  v2[6] = CFSTR("VNBLKRLEG");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames;
  +[VNDetectHumanBodyPoseRequest _supportedJointsGroupNamesRevision1]::jointsGroupNames = v0;

}

void __61__VNDetectHumanBodyPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[20];

  v2[19] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("head_joint");
  v2[1] = CFSTR("left_eye_joint");
  v2[2] = CFSTR("right_eye_joint");
  v2[3] = CFSTR("left_ear_joint");
  v2[4] = CFSTR("right_ear_joint");
  v2[5] = CFSTR("left_shoulder_1_joint");
  v2[6] = CFSTR("right_shoulder_1_joint");
  v2[7] = CFSTR("neck_1_joint");
  v2[8] = CFSTR("left_forearm_joint");
  v2[9] = CFSTR("right_forearm_joint");
  v2[10] = CFSTR("left_hand_joint");
  v2[11] = CFSTR("right_hand_joint");
  v2[12] = CFSTR("left_upLeg_joint");
  v2[13] = CFSTR("right_upLeg_joint");
  v2[14] = CFSTR("root");
  v2[15] = CFSTR("left_leg_joint");
  v2[16] = CFSTR("right_leg_joint");
  v2[17] = CFSTR("left_foot_joint");
  v2[18] = CFSTR("right_foot_joint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames;
  +[VNDetectHumanBodyPoseRequest _supportedJointNamesRevision1]::jointNames = v0;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectHumanBodyPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_48);
  return (id)+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3737841664)
  {
    v5 = CFSTR("VNDetectHumanBodyPoseRequestRevision2");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNDetectHumanBodyPoseRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __64__VNDetectHumanBodyPoseRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841664);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions;
  +[VNDetectHumanBodyPoseRequest(Revisioning) privateRevisionsSet]::privateRevisions = v0;

}

@end
