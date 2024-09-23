@implementation SCNPhysicsDragField

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldDrag *v2;

  v2 = (c3dPhysicsFieldDrag *)operator new();
  c3dPhysicsFieldDrag::c3dPhysicsFieldDrag(v2);
  return (c3dPhysicsField *)v2;
}

- (BOOL)supportsDirection
{
  return 0;
}

- (BOOL)supportsOffset
{
  return 0;
}

@end
