@implementation VCPPersonObservation

- (NSArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
  objc_storeStrong((id *)&self->_keypoints, a3);
}

- (VCPHandObservation)leftHand
{
  return self->_leftHand;
}

- (void)setLeftHand:(id)a3
{
  objc_storeStrong((id *)&self->_leftHand, a3);
}

- (VCPHandObservation)rightHand
{
  return self->_rightHand;
}

- (void)setRightHand:(id)a3
{
  objc_storeStrong((id *)&self->_rightHand, a3);
}

- (float)relativeActionScore
{
  return self->_relativeActionScore;
}

- (void)setRelativeActionScore:(float)a3
{
  self->_relativeActionScore = a3;
}

- (float)absoluteActionScore
{
  return self->_absoluteActionScore;
}

- (void)setAbsoluteActionScore:(float)a3
{
  self->_absoluteActionScore = a3;
}

- (int)personID
{
  return self->_personID;
}

- (void)setPersonID:(int)a3
{
  self->_personID = a3;
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHand, 0);
  objc_storeStrong((id *)&self->_leftHand, 0);
  objc_storeStrong((id *)&self->_keypoints, 0);
}

@end
