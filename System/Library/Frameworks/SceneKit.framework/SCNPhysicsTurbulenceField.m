@implementation SCNPhysicsTurbulenceField

- (c3dPhysicsField)_createField
{
  float *v3;
  float strength;
  float smoothness;
  float animationSpeed;

  v3 = (float *)operator new();
  c3dPhysicsFieldTurbulence::c3dPhysicsFieldTurbulence((c3dPhysicsFieldTurbulence *)v3);
  strength = self->super.super._strength;
  v3[40] = strength;
  smoothness = self->super._smoothness;
  animationSpeed = self->super._animationSpeed;
  v3[60] = smoothness;
  v3[61] = animationSpeed;
  return (c3dPhysicsField *)v3;
}

@end
