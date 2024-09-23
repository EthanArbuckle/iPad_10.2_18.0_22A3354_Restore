@implementation SCNPhysicsRadialGravityField

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldRadialGravity *v2;

  v2 = (c3dPhysicsFieldRadialGravity *)operator new();
  c3dPhysicsFieldRadialGravity::c3dPhysicsFieldRadialGravity(v2);
  return (c3dPhysicsField *)v2;
}

- (BOOL)supportsDirection
{
  return 0;
}

@end
