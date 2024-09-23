@implementation VNAnimalBodyPoseObservation

- (VNRecognizedPoint)recognizedPointForJointName:(VNAnimalBodyPoseObservationJointName)jointName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", jointName, error);
  return (VNRecognizedPoint *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)recognizedPointsForJointsGroupName:(VNAnimalBodyPoseObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointsForGroupKey:error:](self, "recognizedPointsForGroupKey:error:", jointsGroupName, error);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

@end
