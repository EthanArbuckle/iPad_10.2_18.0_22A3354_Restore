@implementation VNHumanHandPoseObservation

- (VNRecognizedPoint)recognizedPointForJointName:(VNHumanHandPoseObservationJointName)jointName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", jointName, error);
  return (VNRecognizedPoint *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanHandPoseObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointsForGroupKey:error:](self, "recognizedPointsForGroupKey:error:", jointsGroupName, error);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (VNChirality)chirality
{
  void *v2;
  VNChirality v3;

  -[VNRecognizedPointsObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "chirality");

  return v3;
}

@end
