@implementation VNHumanBodyPoseObservation

- (VNRecognizedPoint)recognizedPointForJointName:(VNHumanBodyPoseObservationJointName)jointName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", jointName, error);
  return (VNRecognizedPoint *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPoseObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  -[VNRecognizedPointsObservation recognizedPointsForGroupKey:error:](self, "recognizedPointsForGroupKey:error:", jointsGroupName, error);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLeftHand:(id)a3
{
  objc_storeStrong((id *)&self->_leftHand, a3);
}

- (void)setRightHand:(id)a3
{
  objc_storeStrong((id *)&self->_rightHand, a3);
}

- (id)leftHand
{
  return self->_leftHand;
}

- (id)rightHand
{
  return self->_rightHand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHand, 0);
  objc_storeStrong((id *)&self->_leftHand, 0);
}

@end
