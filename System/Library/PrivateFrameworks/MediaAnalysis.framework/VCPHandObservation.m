@implementation VCPHandObservation

+ (id)twoHandGestureTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76968);
}

- (VCPHandObservation)init
{
  VCPHandObservation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VCPHandObservation;
  result = -[VCPHandObservation init](&v3, sel_init);
  if (result)
    result->_gestureType = -1;
  return result;
}

- (NSArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
  objc_storeStrong((id *)&self->_keypoints, a3);
}

- (int)chirality
{
  return self->_chirality;
}

- (void)setChirality:(int)a3
{
  self->_chirality = a3;
}

- (int)handID
{
  return self->_handID;
}

- (void)setHandID:(int)a3
{
  self->_handID = a3;
}

- (int)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int)a3
{
  self->_groupID = a3;
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

- (int)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int)a3
{
  self->_gestureType = a3;
}

- (float)gestureConfidence
{
  return self->_gestureConfidence;
}

- (void)setGestureConfidence:(float)a3
{
  self->_gestureConfidence = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (unint64_t)mitigationType
{
  return self->_mitigationType;
}

- (void)setMitigationType:(unint64_t)a3
{
  self->_mitigationType = a3;
}

- (unint64_t)fingerOpenness
{
  return self->_fingerOpenness;
}

- (void)setFingerOpenness:(unint64_t)a3
{
  self->_fingerOpenness = a3;
}

- (float)holdObject
{
  return self->_holdObject;
}

- (void)setHoldObject:(float)a3
{
  self->_holdObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keypoints, 0);
}

@end
