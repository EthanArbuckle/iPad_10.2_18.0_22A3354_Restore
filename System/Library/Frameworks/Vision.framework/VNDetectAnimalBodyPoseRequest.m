@implementation VNDetectAnimalBodyPoseRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)_supportedJointNamesRevision1
{
  if (+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::onceToken, &__block_literal_global_19930);
  return (id)+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1;
}

+ (id)_supportedJointsGroupsNamesRevision1
{
  if (+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::onceToken != -1)
    dispatch_once(&+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::onceToken, &__block_literal_global_20_19928);
  return (id)+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1;
}

void __69__VNDetectAnimalBodyPoseRequest__supportedJointsGroupsNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNIPOAll");
  v2[1] = CFSTR("animal_joint_group_head");
  v2[2] = CFSTR("animal_joint_group_trunk");
  v2[3] = CFSTR("animal_joint_group_gorelegs");
  v2[4] = CFSTR("animal_joint_group_hindlegs");
  v2[5] = CFSTR("animal_joint_group_tail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1;
  +[VNDetectAnimalBodyPoseRequest _supportedJointsGroupsNamesRevision1]::supportedJointsGroupsNamesRevision1 = v0;

}

void __62__VNDetectAnimalBodyPoseRequest__supportedJointNamesRevision1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[26];

  v2[25] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("animal_joint_left_ear_top");
  v2[1] = CFSTR("animal_joint_right_ear_top");
  v2[2] = CFSTR("animal_joint_left_ear_middle");
  v2[3] = CFSTR("animal_joint_right_ear_middle");
  v2[4] = CFSTR("animal_joint_left_ear_bottom");
  v2[5] = CFSTR("animal_joint_right_ear_bottom");
  v2[6] = CFSTR("animal_joint_left_eye");
  v2[7] = CFSTR("animal_joint_right_eye");
  v2[8] = CFSTR("animal_joint_nose");
  v2[9] = CFSTR("animal_joint_heck");
  v2[10] = CFSTR("animal_joint_left_front_elbow");
  v2[11] = CFSTR("animal_joint_right_front_elbow");
  v2[12] = CFSTR("animal_joint_left_front_knee");
  v2[13] = CFSTR("animal_joint_right_front_knee");
  v2[14] = CFSTR("animal_joint_left_front_paw");
  v2[15] = CFSTR("animal_joint_right_front_paw");
  v2[16] = CFSTR("animal_joint_left_back_elbow");
  v2[17] = CFSTR("animal_joint_right_back_elbow");
  v2[18] = CFSTR("animal_joint_left_back_knee");
  v2[19] = CFSTR("animal_joint_right_back_knee");
  v2[20] = CFSTR("animal_joint_left_back_paw");
  v2[21] = CFSTR("animal_joint_right_back_paw");
  v2[22] = CFSTR("animal_joint_tail_top");
  v2[23] = CFSTR("animal_joint_tail_middle");
  v2[24] = CFSTR("animal_joint_tail_bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1;
  +[VNDetectAnimalBodyPoseRequest _supportedJointNamesRevision1]::supportedJointNamesRevision1 = v0;

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNAnimalBodyPoseDetectorType");
    v5 = CFSTR("VNAnimalBodyPoseDetectorType");
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

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v18, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v14 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;
      if (v15)
        -[VNRequest setResults:](self, "setResults:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectAnimalBodyPoseRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
