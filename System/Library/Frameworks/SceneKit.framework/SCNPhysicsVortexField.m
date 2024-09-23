@implementation SCNPhysicsVortexField

- (SCNPhysicsVortexField)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVortexField;
  return -[SCNPhysicsField init](&v3, sel_init);
}

- (c3dPhysicsField)_createField
{
  uint64_t v3;
  float strength;
  int v5;
  __int128 v6;
  int v7;

  v3 = operator new();
  c3dPhysicsFieldVortex::c3dPhysicsFieldVortex((c3dPhysicsFieldVortex *)v3);
  strength = self->super._strength;
  *(float *)(v3 + 160) = strength;
  -[SCNPhysicsField direction](self, "direction");
  DWORD1(v6) = v5;
  DWORD2(v6) = v7;
  *(_OWORD *)(v3 + 240) = v6;
  return (c3dPhysicsField *)v3;
}

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
  v12.super_class = (Class)SCNPhysicsVortexField;
  -[SCNPhysicsField setDirection:](&v12, sel_setDirection_);
  v7 = (void *)objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SCNPhysicsVortexField_setDirection___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  objc_msgSend(v7, "_postCommandWithBlock:", v8);
}

__n128 __38__SCNPhysicsVortexField_setDirection___block_invoke(uint64_t a1, __n128 a2)
{
  __n128 *v2;
  __n128 result;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[15] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

@end
