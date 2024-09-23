@implementation SCNPhysicsSpringField

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldSpring *v2;

  v2 = (c3dPhysicsFieldSpring *)operator new();
  c3dPhysicsFieldSpring::c3dPhysicsFieldSpring(v2);
  return (c3dPhysicsField *)v2;
}

- (BOOL)supportsDirection
{
  return 0;
}

@end
