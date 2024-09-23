@implementation VNDetectHumanBodyPose3DRequest

- (void)_initializeStateForRevision:(unint64_t)a3
{
  VNABPKPipelineWrapper *v4;
  VNABPKPipelineWrapper *bodyPosePipelineWrapper;

  v4 = objc_alloc_init(VNABPKPipelineWrapper);
  bodyPosePipelineWrapper = self->_bodyPosePipelineWrapper;
  self->_bodyPosePipelineWrapper = v4;

}

- (VNDetectHumanBodyPose3DRequest)init
{
  return -[VNDetectHumanBodyPose3DRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNDetectHumanBodyPose3DRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[VNDetectHumanBodyPose3DRequest initWithFrameAnalysisSpacing:completionHandler:](self, "initWithFrameAnalysisSpacing:completionHandler:", &v4, completionHandler);
}

- (VNDetectHumanBodyPose3DRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4
{
  VNDetectHumanBodyPose3DRequest *v4;
  VNDetectHumanBodyPose3DRequest *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanBodyPose3DRequest;
  v7 = *a3;
  v4 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v8, sel_initWithFrameAnalysisSpacing_completionHandler_, &v7, a4);
  v5 = v4;
  if (v4)
    -[VNDetectHumanBodyPose3DRequest _initializeStateForRevision:](v4, "_initializeStateForRevision:", -[VNRequest resolvedRevision](v4, "resolvedRevision"));
  return v5;
}

- (NSArray)supportedJointNamesAndReturnError:(NSError *)error
{
  unint64_t v5;
  void *v6;
  NSError *v7;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v5 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointNamesRevision1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (error)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
    v7 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    *error = v7;
  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (NSArray)supportedJointsGroupNamesAndReturnError:(NSError *)error
{
  unint64_t v5;
  void *v6;
  NSError *v7;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v5 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_supportedJointsGroupsNamesRevision1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (error)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
    v7 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    *error = v7;
  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNHumanBodyPose3DDetectorType");
    v5 = CFSTR("VNHumanBodyPose3DDetectorType");
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

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectHumanBodyPose3DRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v4, sel_resolvedRevisionDidChangeFromRevision_, a3);
  -[VNDetectHumanBodyPose3DRequest _initializeStateForRevision:](self, "_initializeStateForRevision:", -[VNRequest resolvedRevision](self, "resolvedRevision"));
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v19, a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v20[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_bodyPosePipelineWrapper, CFSTR("VNHumanBodyPose3DDetectorProcessOption_ABPKPipeline"));
      v15 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v11, self, a5, 0);
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

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPosePipelineWrapper, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)_supportedJointNamesRevision1
{
  if (_supportedJointNamesRevision1_onceToken != -1)
    dispatch_once(&_supportedJointNamesRevision1_onceToken, &__block_literal_global_7484);
  return (id)_supportedJointNamesRevision1_supportedJointNamesRevision1;
}

+ (id)_supportedJointsGroupsNamesRevision1
{
  if (_supportedJointsGroupsNamesRevision1_onceToken != -1)
    dispatch_once(&_supportedJointsGroupsNamesRevision1_onceToken, &__block_literal_global_20);
  return (id)_supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1;
}

void __70__VNDetectHumanBodyPose3DRequest__supportedJointsGroupsNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("human_joint_group_head_3D");
  v2[1] = CFSTR("human_joint_group_left_arm_3D");
  v2[2] = CFSTR("human_joint_group_right_arm_3D");
  v2[3] = CFSTR("human_joint_group_torso_3D");
  v2[4] = CFSTR("human_joint_group_left_leg_3D");
  v2[5] = CFSTR("human_joint_group_right_leg_3D");
  v2[6] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1;
  _supportedJointsGroupsNamesRevision1_supportedJointsGroupsNamesRevision1 = v0;

}

void __63__VNDetectHumanBodyPose3DRequest__supportedJointNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];

  v2[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("human_top_head_3D");
  v2[1] = CFSTR("human_center_head_3D");
  v2[2] = CFSTR("human_center_shoulder_3D");
  v2[3] = CFSTR("human_left_shoulder_3D");
  v2[4] = CFSTR("human_right_shoulder_3D");
  v2[5] = CFSTR("human_spine_3D");
  v2[6] = CFSTR("human_left_elbow_3D");
  v2[7] = CFSTR("human_right_elbow_3D");
  v2[8] = CFSTR("human_left_wrist_3D");
  v2[9] = CFSTR("human_right_wrist_3D");
  v2[10] = CFSTR("human_root_3D");
  v2[11] = CFSTR("human_left_hip_3D");
  v2[12] = CFSTR("human_right_hip_3D");
  v2[13] = CFSTR("human_left_knee_3D");
  v2[14] = CFSTR("human_right_knee_3D");
  v2[15] = CFSTR("human_left_ankle_3D");
  v2[16] = CFSTR("human_right_ankle_3D");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_supportedJointNamesRevision1_supportedJointNamesRevision1;
  _supportedJointNamesRevision1_supportedJointNamesRevision1 = v0;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&revisionAvailability_ourRevisionAvailability_7492;
}

@end
