@implementation SCNPhysicsSliderJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  $41E0176A46297CABFF97AED9241D27A1 *p_definition;
  btSliderConstraint *constraint;
  objc_super v5;

  p_definition = &self->_definition;

  constraint = self->_constraint;
  if (constraint)
    (*((void (**)(btSliderConstraint *))constraint->var0 + 1))(constraint);
  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsSliderJoint;
  -[SCNPhysicsSliderJoint dealloc](&v5, sel_dealloc);
}

- (SCNPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8
{
  float z;
  float y;
  float x;
  float v12;
  float v13;
  float v14;
  char *v16;
  objc_super v18;
  int v19;
  int v20;
  int v21;

  z = a5.z;
  y = a5.y;
  x = a5.x;
  v12 = a4.z;
  v13 = a4.y;
  v14 = a4.x;
  v18.receiver = self;
  v18.super_class = (Class)SCNPhysicsSliderJoint;
  v16 = -[SCNPhysicsSliderJoint init](&v18, sel_init, a3, a6, *(_QWORD *)&a8.x, *(_QWORD *)&a8.z);
  if (v16)
  {
    *((_QWORD *)v16 + 1) = a3;
    *((float *)v16 + 6) = v14;
    *((float *)v16 + 7) = v13;
    *((float *)v16 + 8) = v12;
    *((float *)v16 + 9) = x;
    *((float *)v16 + 10) = y;
    *((float *)v16 + 11) = z;
    *((_QWORD *)v16 + 2) = a6;
    *((SCNVector3 *)v16 + 4) = a7;
    *((_DWORD *)v16 + 15) = v19;
    *((_DWORD *)v16 + 16) = v20;
    *((_DWORD *)v16 + 17) = v21;
    *(_OWORD *)(v16 + 72) = xmmword_1DD02C420;
    *(_OWORD *)(v16 + 88) = xmmword_1DD02C430;
    *((_QWORD *)v16 + 16) = 0x3FF0000000000000;
    *((_QWORD *)v16 + 14) = 0x3FF0000000000000;
  }
  return (SCNPhysicsSliderJoint *)v16;
}

- (SCNPhysicsSliderJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5
{
  return -[SCNPhysicsSliderJoint initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:](self, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", a3, 0, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z, *(double *)&a5.x, *(double *)&a5.y, *(double *)&a5.z, 0, 0, 0);
}

+ (SCNPhysicsSliderJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB
{
  float z;
  float y;
  float x;
  float v12;
  float v13;
  float v14;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v24;
  uint64_t v25;
  int v26;

  z = anchorA.z;
  y = anchorA.y;
  x = anchorA.x;
  v12 = axisA.z;
  v13 = axisA.y;
  v14 = axisA.x;
  v16 = objc_alloc((Class)a1);
  HIDWORD(v24) = v26;
  *(_QWORD *)((char *)&v24 + 4) = v25;
  *(float *)&v24 = axisB.z;
  *(float *)&v17 = v14;
  *(float *)&v18 = v13;
  *(float *)&v19 = v12;
  *(float *)&v20 = x;
  *(float *)&v21 = y;
  *(float *)&v22 = z;
  return (SCNPhysicsSliderJoint *)(id)objc_msgSend(v16, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", bodyA, bodyB, v17, v18, v19, v20, v21, v22, *(_QWORD *)&axisB.x, v24);
}

+ (SCNPhysicsSliderJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor
{
  float z;
  float y;
  float x;
  float v8;
  float v9;
  float v10;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  z = anchor.z;
  y = anchor.y;
  x = anchor.x;
  v8 = axis.z;
  v9 = axis.y;
  v10 = axis.x;
  v12 = objc_alloc((Class)a1);
  *(float *)&v13 = v10;
  *(float *)&v14 = v9;
  *(float *)&v15 = v8;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  return (SCNPhysicsSliderJoint *)(id)objc_msgSend(v12, "initWithBody:axis:anchor:", body, v13, v14, v15, v16, v17, v18);
}

- (SCNPhysicsBody)bodyA
{
  return self->_definition.bodyA;
}

- (SCNPhysicsBody)bodyB
{
  return self->_definition.bodyB;
}

- (SCNVector3)axisA
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_definition.axisA.x;
  y = self->_definition.axisA.y;
  z = self->_definition.axisA.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAxisA:(SCNVector3)axisA
{
  SCNPhysicsWorld *world;
  _QWORD v4[5];
  SCNVector3 v5;

  self->_definition.axisA = axisA;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SCNPhysicsSliderJoint_setAxisA___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = axisA;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __34__SCNPhysicsSliderJoint_setAxisA___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;
  float v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  float v23;
  double v24;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  if (v1)
  {
    v2 = *(float *)(result + 40);
    v3 = *(float *)(result + 44);
    v4 = *(float *)(result + 48);
    v5 = fabsf(v4) <= 0.70711;
    v6 = (float)(v3 * v3) + (float)(v2 * v2);
    v7 = 1.0 / sqrtf(v6);
    v8 = -(float)(v3 * v7);
    v9 = v2 * v7;
    v10 = -(float)(v4 * (float)(v2 * v7));
    v11 = v4 * v8;
    v12 = v6 * v7;
    v13 = 0.0;
    v14 = (float)(v4 * v4) + (float)(v3 * v3);
    v15 = 1.0 / sqrtf(v14);
    v16 = -(float)(v4 * v15);
    v17 = v3 * v15;
    v18 = v14 * v15;
    v19 = v2 * v16;
    if (v5)
    {
      v18 = v10;
    }
    else
    {
      v9 = v16;
      v8 = 0.0;
      v13 = v17;
      v11 = -(float)(v2 * v17);
    }
    LODWORD(v20) = *(_DWORD *)(result + 40);
    *((float *)&v20 + 1) = v8;
    HIDWORD(v22) = 0;
    *((_QWORD *)&v20 + 1) = LODWORD(v18);
    LODWORD(v21) = *(_DWORD *)(result + 44);
    *((float *)&v21 + 1) = v9;
    *((_QWORD *)&v21 + 1) = LODWORD(v11);
    LODWORD(v22) = *(_DWORD *)(result + 48);
    if (v5)
      v23 = v12;
    else
      v23 = v19;
    *((float *)&v22 + 1) = v13;
    *((float *)&v22 + 2) = v23;
    *(_OWORD *)(v1 + 80) = v20;
    *(_OWORD *)(v1 + 96) = v21;
    *(_OWORD *)(v1 + 112) = v22;
    v24 = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(_QWORD *)(v1 + 40) + 16), (const btTransform *)(*(_QWORD *)(v1 + 48) + 16));
    return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)v1 + 16))(v1, v24);
  }
  return result;
}

- (SCNVector3)axisB
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_definition.axisB.x;
  y = self->_definition.axisB.y;
  z = self->_definition.axisB.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAxisB:(SCNVector3)axisB
{
  SCNPhysicsWorld *world;
  _QWORD v4[5];
  SCNVector3 v5;

  self->_definition.axisB = axisB;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SCNPhysicsSliderJoint_setAxisB___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = axisB;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __34__SCNPhysicsSliderJoint_setAxisB___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;
  float v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  float v23;
  double v24;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  if (v1)
  {
    v2 = *(float *)(result + 40);
    v3 = *(float *)(result + 44);
    v4 = *(float *)(result + 48);
    v5 = fabsf(v4) <= 0.70711;
    v6 = (float)(v3 * v3) + (float)(v2 * v2);
    v7 = 1.0 / sqrtf(v6);
    v8 = -(float)(v3 * v7);
    v9 = v2 * v7;
    v10 = -(float)(v4 * (float)(v2 * v7));
    v11 = v4 * v8;
    v12 = v6 * v7;
    v13 = 0.0;
    v14 = (float)(v4 * v4) + (float)(v3 * v3);
    v15 = 1.0 / sqrtf(v14);
    v16 = -(float)(v4 * v15);
    v17 = v3 * v15;
    v18 = v14 * v15;
    v19 = v2 * v16;
    if (v5)
    {
      v18 = v10;
    }
    else
    {
      v9 = v16;
      v8 = 0.0;
      v13 = v17;
      v11 = -(float)(v2 * v17);
    }
    LODWORD(v20) = *(_DWORD *)(result + 40);
    *((float *)&v20 + 1) = v8;
    HIDWORD(v22) = 0;
    *((_QWORD *)&v20 + 1) = LODWORD(v18);
    LODWORD(v21) = *(_DWORD *)(result + 44);
    *((float *)&v21 + 1) = v9;
    *((_QWORD *)&v21 + 1) = LODWORD(v11);
    LODWORD(v22) = *(_DWORD *)(result + 48);
    if (v5)
      v23 = v12;
    else
      v23 = v19;
    *((float *)&v22 + 1) = v13;
    *((float *)&v22 + 2) = v23;
    *(_OWORD *)(v1 + 144) = v20;
    *(_OWORD *)(v1 + 160) = v21;
    *(_OWORD *)(v1 + 176) = v22;
    v24 = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(_QWORD *)(v1 + 40) + 16), (const btTransform *)(*(_QWORD *)(v1 + 48) + 16));
    return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)v1 + 16))(v1, v24);
  }
  return result;
}

- (SCNVector3)anchorA
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_definition.anchorA.x;
  y = self->_definition.anchorA.y;
  z = self->_definition.anchorA.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorA:(SCNVector3)anchorA
{
  SCNPhysicsWorld *world;
  _QWORD v4[5];
  SCNVector3 v5;

  self->_definition.anchorA = anchorA;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsSliderJoint_setAnchorA___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorA;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __36__SCNPhysicsSliderJoint_setAnchorA___block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  double v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  if (v1)
  {
    *(_QWORD *)&v2 = *(_QWORD *)(result + 40);
    *((_QWORD *)&v2 + 1) = *(unsigned int *)(result + 48);
    *(_OWORD *)(v1 + 128) = v2;
    v3 = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(_QWORD *)(v1 + 40) + 16), (const btTransform *)(*(_QWORD *)(v1 + 48) + 16));
    return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)v1 + 16))(v1, v3);
  }
  return result;
}

- (SCNVector3)anchorB
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_definition.axisB.x;
  y = self->_definition.axisB.y;
  z = self->_definition.axisB.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorB:(SCNVector3)anchorB
{
  SCNPhysicsWorld *world;
  _QWORD v4[5];
  SCNVector3 v5;

  self->_definition.anchorB = anchorB;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsSliderJoint_setAnchorB___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorB;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __36__SCNPhysicsSliderJoint_setAnchorB___block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  double v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  if (v1)
  {
    *(_QWORD *)&v2 = *(_QWORD *)(result + 40);
    *((_QWORD *)&v2 + 1) = *(unsigned int *)(result + 48);
    *(_OWORD *)(v1 + 192) = v2;
    v3 = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(_QWORD *)(v1 + 40) + 16), (const btTransform *)(*(_QWORD *)(v1 + 48) + 16));
    return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)v1 + 16))(v1, v3);
  }
  return result;
}

- (CGFloat)minimumLinearLimit
{
  return self->_definition.minLinearLimit;
}

- (void)setMinimumLinearLimit:(CGFloat)minimumLinearLimit
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.minLinearLimit = minimumLinearLimit;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMinimumLinearLimit___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = minimumLinearLimit;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __47__SCNPhysicsSliderJoint_setMinimumLinearLimit___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 212) = result;
  }
  return result;
}

- (CGFloat)maximumLinearLimit
{
  return self->_definition.maxLinearLimit;
}

- (void)setMaximumLinearLimit:(CGFloat)maximumLinearLimit
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.maxLinearLimit = maximumLinearLimit;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMaximumLinearLimit___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = maximumLinearLimit;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __47__SCNPhysicsSliderJoint_setMaximumLinearLimit___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 216) = result;
  }
  return result;
}

- (CGFloat)minimumAngularLimit
{
  return self->_definition.minAngularLimit;
}

- (void)setMinimumAngularLimit:(CGFloat)minimumAngularLimit
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.minAngularLimit = minimumAngularLimit;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SCNPhysicsSliderJoint_setMinimumAngularLimit___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = minimumAngularLimit;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

void __48__SCNPhysicsSliderJoint_setMinimumAngularLimit___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float v2;
  float v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    v2 = *(double *)(a1 + 40);
    v3 = fmodf(v2, 6.2832);
    if (v3 >= -3.1416)
    {
      if (v3 > 3.1416)
        v3 = v3 + -6.2832;
    }
    else
    {
      v3 = v3 + 6.2832;
    }
    *(float *)(v1 + 220) = v3;
  }
}

- (CGFloat)maximumAngularLimit
{
  return self->_definition.maxAngularLimit;
}

- (void)setMaximumAngularLimit:(CGFloat)maximumAngularLimit
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.maxAngularLimit = maximumAngularLimit;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SCNPhysicsSliderJoint_setMaximumAngularLimit___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = maximumAngularLimit;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

void __48__SCNPhysicsSliderJoint_setMaximumAngularLimit___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float v2;
  float v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    v2 = *(double *)(a1 + 40);
    v3 = fmodf(v2, 6.2832);
    if (v3 >= -3.1416)
    {
      if (v3 > 3.1416)
        v3 = v3 + -6.2832;
    }
    else
    {
      v3 = v3 + 6.2832;
    }
    *(float *)(v1 + 224) = v3;
  }
}

- (CGFloat)motorTargetLinearVelocity
{
  return self->_definition.motorTargetLinearVelocity;
}

- (void)setMotorTargetLinearVelocity:(CGFloat)motorTargetLinearVelocity
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.motorTargetLinearVelocity = motorTargetLinearVelocity;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SCNPhysicsSliderJoint_setMotorTargetLinearVelocity___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = motorTargetLinearVelocity;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __54__SCNPhysicsSliderJoint_setMotorTargetLinearVelocity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    v2 = *(double *)(a1 + 40);
    *(_BYTE *)(v1 + 1216) = v2 != 0.0;
    result = v2;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 1220) = result;
  }
  return result;
}

- (CGFloat)motorMaximumForce
{
  return self->_definition.motorMaximumForce;
}

- (void)setMotorMaximumForce:(CGFloat)motorMaximumForce
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.motorMaximumForce = motorMaximumForce;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SCNPhysicsSliderJoint_setMotorMaximumForce___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = motorMaximumForce;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __46__SCNPhysicsSliderJoint_setMotorMaximumForce___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 1224) = result;
  }
  return result;
}

- (CGFloat)motorTargetAngularVelocity
{
  return self->_definition.motorTargetAngularVelocity;
}

- (void)setMotorTargetAngularVelocity:(CGFloat)motorTargetAngularVelocity
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.motorTargetAngularVelocity = motorTargetAngularVelocity;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SCNPhysicsSliderJoint_setMotorTargetAngularVelocity___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = motorTargetAngularVelocity;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __55__SCNPhysicsSliderJoint_setMotorTargetAngularVelocity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    v2 = *(double *)(a1 + 40);
    *(_BYTE *)(v1 + 1232) = v2 != 0.0;
    result = v2;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 1236) = result;
  }
  return result;
}

- (CGFloat)motorMaximumTorque
{
  return self->_definition.motorMaximumTorque;
}

- (void)setMotorMaximumTorque:(CGFloat)motorMaximumTorque
{
  SCNPhysicsWorld *world;
  _QWORD v4[6];

  self->_definition.motorMaximumTorque = motorMaximumTorque;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMotorMaximumTorque___block_invoke;
  v4[3] = &unk_1EA59E450;
  v4[4] = self;
  *(CGFloat *)&v4[5] = motorMaximumTorque;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __47__SCNPhysicsSliderJoint_setMotorMaximumTorque___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 1240) = result;
  }
  return result;
}

- (void)_copyDefinition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->_definition.axisB.z;
  v5 = *(_OWORD *)&self->_definition.bodyA;
  v4 = *(_OWORD *)&self->_definition.axisA.x;
  *(_OWORD *)&a3->var0[32] = *(_OWORD *)&self->_definition.anchorA.y;
  *(_OWORD *)&a3->var0[48] = v3;
  *(_OWORD *)a3->var0 = v5;
  *(_OWORD *)&a3->var0[16] = v4;
  v6 = *(_OWORD *)&self->_definition.motorTargetAngularVelocity;
  v8 = *(_OWORD *)&self->_definition.minLinearLimit;
  v7 = *(_OWORD *)&self->_definition.minAngularLimit;
  *(_OWORD *)&a3->var0[96] = *(_OWORD *)&self->_definition.motorTargetLinearVelocity;
  *(_OWORD *)&a3->var0[112] = v6;
  *(_OWORD *)&a3->var0[64] = v8;
  *(_OWORD *)&a3->var0[80] = v7;
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  SCNPhysicsWorld *world;
  BOOL v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[8];

  world = self->_world;
  if (world)
    v8 = world == a3;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:].cold.1(v9);
  }
  self->_world = (SCNPhysicsWorld *)a3;
  v10 = *(_OWORD *)&a4->var0[80];
  v15[4] = *(_OWORD *)&a4->var0[64];
  v15[5] = v10;
  v11 = *(_OWORD *)&a4->var0[112];
  v15[6] = *(_OWORD *)&a4->var0[96];
  v15[7] = v11;
  v12 = *(_OWORD *)&a4->var0[16];
  v15[0] = *(_OWORD *)a4->var0;
  v15[1] = v12;
  v13 = *(_OWORD *)&a4->var0[48];
  v15[2] = *(_OWORD *)&a4->var0[32];
  v15[3] = v13;
  self->_constraint = (btSliderConstraint *)_createConstraintFromDefinition((uint64_t)v15);
  v14 = objc_msgSend(a3, "_handle");
  (*(void (**)(uint64_t, btSliderConstraint *, _QWORD))(*(_QWORD *)v14 + 112))(v14, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  uint64_t v4;
  btSliderConstraint *constraint;

  if (self->_constraint)
  {
    v4 = objc_msgSend(a3, "_handle");
    (*(void (**)(uint64_t, btSliderConstraint *))(*(_QWORD *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint)
      (*((void (**)(btSliderConstraint *))constraint->var0 + 1))(constraint);
    self->_constraint = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  $41E0176A46297CABFF97AED9241D27A1 *p_definition;
  SCNPhysicsBody *bodyB;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsSliderJoint;
  -[SCNPhysicsBehavior encodeWithCoder:](&v7, sel_encodeWithCoder_);
  p_definition = &self->_definition;
  if (p_definition->bodyA)
    objc_msgSend(a3, "encodeObject:forKey:", p_definition->bodyA, CFSTR("bodyA"));
  bodyB = p_definition->bodyB;
  if (bodyB)
    objc_msgSend(a3, "encodeObject:forKey:", bodyB, CFSTR("bodyB"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("axisA"), p_definition->axisA.x, p_definition->axisA.y, p_definition->axisA.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("axisB"), p_definition->axisB.x, p_definition->axisB.y, p_definition->axisB.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("anchorA"), p_definition->anchorA.x, p_definition->anchorA.y, p_definition->anchorA.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("anchorB"), p_definition->anchorB.x, p_definition->anchorB.y, p_definition->anchorB.z);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("minLinearLimit"), p_definition->minLinearLimit);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("maxLinearLimit"), p_definition->maxLinearLimit);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("minAngularLimit"), p_definition->minAngularLimit);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("maxAngularLimit"), p_definition->maxAngularLimit);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("motorTargetLinearVelocity"), p_definition->motorTargetLinearVelocity);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("motorMaximumForce"), p_definition->motorMaximumForce);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("motorTargetAngularVelocity"), p_definition->motorTargetAngularVelocity);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("motorMaximumTorque"), p_definition->motorMaximumTorque);
}

- (SCNPhysicsSliderJoint)initWithCoder:(id)a3
{
  SCNPhysicsSliderJoint *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SCNPhysicsSliderJoint;
  v4 = -[SCNPhysicsBehavior initWithCoder:](&v23, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_definition.axisA.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("axisA"));
    v4->_definition.axisA.y = v6;
    v4->_definition.axisA.z = v7;
    v4->_definition.axisB.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("axisB"));
    v4->_definition.axisB.y = v8;
    v4->_definition.axisB.z = v9;
    v4->_definition.anchorA.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("anchorA"));
    v4->_definition.anchorA.y = v10;
    v4->_definition.anchorA.z = v11;
    v4->_definition.anchorB.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("anchorB"));
    v4->_definition.anchorB.y = v12;
    v4->_definition.anchorB.z = v13;
    v4->_definition.bodyA = (SCNPhysicsBody *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyA"));
    v4->_definition.bodyB = (SCNPhysicsBody *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyB"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("minLinearLimit"));
    v4->_definition.minLinearLimit = v14;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("maxLinearLimit"));
    v4->_definition.maxLinearLimit = v15;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("minAngularLimit"));
    v4->_definition.minAngularLimit = v16;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("maxAngularLimit"));
    v4->_definition.maxAngularLimit = v17;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("motorTargetLinearVelocity"));
    v4->_definition.motorTargetLinearVelocity = v18;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("motorMaximumForce"));
    v4->_definition.motorMaximumForce = v19;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("motorTargetAngularVelocity"));
    v4->_definition.motorTargetAngularVelocity = v20;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("motorMaximumTorque"));
    v4->_definition.motorMaximumTorque = v21;
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

@end
