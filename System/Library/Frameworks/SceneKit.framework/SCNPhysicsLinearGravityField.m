@implementation SCNPhysicsLinearGravityField

- (void)setDirection:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  void *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;
  objc_super v12;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)SCNPhysicsLinearGravityField;
  -[SCNPhysicsField setDirection:](&v12, sel_setDirection_);
  v7 = (void *)objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SCNPhysicsLinearGravityField_setDirection___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  objc_msgSend(v7, "_postCommandWithBlock:", v8);
}

_OWORD *__45__SCNPhysicsLinearGravityField_setDirection___block_invoke(uint64_t a1, __n128 a2)
{
  _OWORD *result;
  __n128 v4;

  result = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 120);
  if (result)
  {
    a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v4 = a2;
    return (_OWORD *)c3dPhysicsFieldLinearGravity::setGravity(result, &v4);
  }
  return result;
}

- (c3dPhysicsField)_createField
{
  c3dPhysicsFieldLinearGravity *v3;
  int v4;
  __int128 v5;
  int v6;
  __int128 v8;

  v3 = (c3dPhysicsFieldLinearGravity *)operator new();
  c3dPhysicsFieldLinearGravity::c3dPhysicsFieldLinearGravity(v3);
  -[SCNPhysicsField direction](self, "direction");
  DWORD1(v5) = v4;
  DWORD2(v5) = v6;
  v8 = v5;
  c3dPhysicsFieldLinearGravity::setGravity(v3, &v8);
  return (c3dPhysicsField *)v3;
}

- (BOOL)supportsOffset
{
  return 0;
}

@end
