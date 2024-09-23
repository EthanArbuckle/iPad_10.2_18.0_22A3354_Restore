@implementation HMDCoordinationPrimaryMeshLogEvent

- (BOOL)isLeader
{
  return self->_isLeader;
}

- (void)setIsLeader:(BOOL)a3
{
  self->_isLeader = a3;
}

- (BOOL)didChangeLeader
{
  return self->_didChangeLeader;
}

- (void)setDidChangeLeader:(BOOL)a3
{
  self->_didChangeLeader = a3;
}

- (BOOL)didElectLeader
{
  return self->_didElectLeader;
}

- (void)setDidElectLeader:(BOOL)a3
{
  self->_didElectLeader = a3;
}

- (BOOL)isInSecondaryMesh
{
  return self->_isInSecondaryMesh;
}

- (void)setIsInSecondaryMesh:(BOOL)a3
{
  self->_isInSecondaryMesh = a3;
}

- (BOOL)didCurrentDeviceLeavePrimaryMesh
{
  return self->_didCurrentDeviceLeavePrimaryMesh;
}

- (void)setDidCurrentDeviceLeavePrimaryMesh:(BOOL)a3
{
  self->_didCurrentDeviceLeavePrimaryMesh = a3;
}

@end
