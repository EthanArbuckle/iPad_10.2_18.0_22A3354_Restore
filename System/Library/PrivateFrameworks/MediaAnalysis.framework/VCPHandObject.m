@implementation VCPHandObject

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

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
