@implementation SCNActionTargetState

- (SCNVector3)position
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->position.x;
  y = self->position.y;
  z = self->position.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  self->position = a3;
}

- (SCNVector3)euler
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->euler.x;
  y = self->euler.y;
  z = self->euler.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEuler:(SCNVector3)a3
{
  self->euler = a3;
}

- (SCNVector4)rotation
{
  float x;
  float y;
  float z;
  float w;
  SCNVector4 result;

  x = self->rotation.x;
  y = self->rotation.y;
  z = self->rotation.z;
  w = self->rotation.w;
  result.w = w;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRotation:(SCNVector4)a3
{
  self->rotation = a3;
}

- (SCNVector3)scale
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->scale.x;
  y = self->scale.y;
  z = self->scale.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScale:(SCNVector3)a3
{
  self->scale = a3;
}

- (BOOL)usesEuler
{
  return self->usesEuler;
}

- (void)setUsesEuler:(BOOL)a3
{
  self->usesEuler = a3;
}

- (float)opacity
{
  return self->opacity;
}

- (void)setOpacity:(float)a3
{
  self->opacity = a3;
}

@end
