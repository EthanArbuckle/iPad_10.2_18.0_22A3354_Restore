@implementation SCNPhysicsElectricField

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldElectric *v2;

  v2 = (c3dPhysicsFieldElectric *)operator new();
  c3dPhysicsFieldElectric::c3dPhysicsFieldElectric(v2);
  return (c3dPhysicsField *)v2;
}

- (BOOL)supportsDirection
{
  return 0;
}

@end
