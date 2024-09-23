@implementation SCNPhysicsHingeJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  btHingeConstraint *constraint;
  objc_super v4;

  constraint = self->_constraint;
  if (constraint)
    (*((void (**)(btHingeConstraint *, SEL))constraint->var0 + 1))(constraint, a2);

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsHingeJoint;
  -[SCNPhysicsHingeJoint dealloc](&v4, sel_dealloc);
}

- (SCNPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8
{
  float z;
  float y;
  float x;
  float v12;
  float v13;
  float v14;
  SCNPhysicsHingeJoint *v16;
  objc_super v18;
  float v19;
  float v20;
  float v21;

  z = a5.z;
  y = a5.y;
  x = a5.x;
  v12 = a4.z;
  v13 = a4.y;
  v14 = a4.x;
  v18.receiver = self;
  v18.super_class = (Class)SCNPhysicsHingeJoint;
  v16 = -[SCNPhysicsHingeJoint init](&v18, sel_init, a3, a6, *(_QWORD *)&a8.x, *(_QWORD *)&a8.z);
  if (v16)
  {
    v16->_definition.bodyA = (SCNPhysicsBody *)a3;
    v16->_definition.axisA.x = v14;
    v16->_definition.axisA.y = v13;
    v16->_definition.axisA.z = v12;
    v16->_definition.anchorA.x = x;
    v16->_definition.anchorA.y = y;
    v16->_definition.anchorA.z = z;
    v16->_definition.bodyB = (SCNPhysicsBody *)a6;
    v16->_definition.axisB = a7;
    v16->_definition.anchorB.x = v19;
    v16->_definition.anchorB.y = v20;
    v16->_definition.anchorB.z = v21;
  }
  return v16;
}

- (SCNPhysicsHingeJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5
{
  return -[SCNPhysicsHingeJoint initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:](self, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", a3, 0, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z, *(double *)&a5.x, *(double *)&a5.y, *(double *)&a5.z, 0, 0, 0);
}

+ (SCNPhysicsHingeJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB
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
  return (SCNPhysicsHingeJoint *)(id)objc_msgSend(v16, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", bodyA, bodyB, v17, v18, v19, v20, v21, v22, *(_QWORD *)&axisB.x, v24);
}

+ (SCNPhysicsHingeJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor
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
  return (SCNPhysicsHingeJoint *)(id)objc_msgSend(v12, "initWithBody:axis:anchor:", body, v13, v14, v15, v16, v17, v18);
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
  v4[2] = __33__SCNPhysicsHingeJoint_setAxisA___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = axisA;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

double __33__SCNPhysicsHingeJoint_setAxisA___block_invoke(uint64_t a1)
{
  btHingeConstraint *v2;
  double result;
  float32x4_t v4;

  v2 = *(btHingeConstraint **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    v4.i64[0] = *(_QWORD *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    *(_QWORD *)&result = btHingeConstraint::setAxis(v2, &v4).u64[0];
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
  v4[2] = __33__SCNPhysicsHingeJoint_setAxisB___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = axisB;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

double __33__SCNPhysicsHingeJoint_setAxisB___block_invoke(uint64_t a1)
{
  btHingeConstraint *v2;
  double result;
  float32x4_t v4;

  v2 = *(btHingeConstraint **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    v4.i64[0] = *(_QWORD *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    *(_QWORD *)&result = btHingeConstraint::setAxis(v2, &v4).u64[0];
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
  v4[2] = __35__SCNPhysicsHingeJoint_setAnchorA___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorA;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __35__SCNPhysicsHingeJoint_setAnchorA___block_invoke(uint64_t a1)
{
  uint64_t result;
  btVector3 v3;
  btVector3 v4;
  btVector3 v5;
  btVector3 v6;
  btTransform v7;
  btTransform v8;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
  {
    v3 = *(btVector3 *)(result + 672);
    v8.var0.var0[0] = *(btVector3 *)(result + 656);
    v8.var0.var0[1] = v3;
    v4 = *(btVector3 *)(result + 688);
    v5 = *(btVector3 *)(result + 736);
    v7.var0.var0[0] = *(btVector3 *)(result + 720);
    v7.var0.var0[1] = v5;
    v6 = *(btVector3 *)(result + 768);
    v7.var0.var0[2] = *(btVector3 *)(result + 752);
    v7.var1 = v6;
    *(_QWORD *)v3.var0.var0 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)&v3.var0.var0[2] = *(unsigned int *)(a1 + 48);
    v8.var0.var0[2] = v4;
    v8.var1 = v3;
    return btHingeConstraint::setFrames((btHingeConstraint *)result, &v8, &v7);
  }
  return result;
}

- (SCNVector3)anchorB
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_definition.anchorB.x;
  y = self->_definition.anchorB.y;
  z = self->_definition.anchorB.z;
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
  v4[2] = __35__SCNPhysicsHingeJoint_setAnchorB___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorB;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

uint64_t __35__SCNPhysicsHingeJoint_setAnchorB___block_invoke(uint64_t a1)
{
  uint64_t result;
  btVector3 v3;
  btVector3 v4;
  btVector3 v5;
  btTransform v6;
  btTransform v7;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
  {
    v3 = *(btVector3 *)(result + 672);
    v7.var0.var0[0] = *(btVector3 *)(result + 656);
    v7.var0.var0[1] = v3;
    v4 = *(btVector3 *)(result + 704);
    v7.var0.var0[2] = *(btVector3 *)(result + 688);
    v7.var1 = v4;
    v5 = *(btVector3 *)(result + 736);
    v6.var0.var0[0] = *(btVector3 *)(result + 720);
    v6.var0.var0[1] = v5;
    *(_QWORD *)v5.var0.var0 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)&v5.var0.var0[2] = *(unsigned int *)(a1 + 48);
    v6.var0.var0[2] = *(btVector3 *)(result + 752);
    v6.var1 = v5;
    return btHingeConstraint::setFrames((btHingeConstraint *)result, &v7, &v6);
  }
  return result;
}

- (void)_copyDefinition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->_definition.axisA.z;
  v5 = *(_OWORD *)&self->_definition.bodyA;
  v4 = *(_OWORD *)&self->_definition.anchorA.x;
  *(_OWORD *)&a3->var0[32] = *(_OWORD *)&self->_definition.anchorB.y;
  *(_OWORD *)&a3->var0[48] = v3;
  *(_OWORD *)a3->var0 = v5;
  *(_OWORD *)&a3->var0[16] = v4;
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  SCNPhysicsWorld *world;
  BOOL v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _OWORD v13[4];

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
  v10 = *(_OWORD *)&a4->var0[16];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v10;
  v11 = *(_OWORD *)&a4->var0[48];
  v13[2] = *(_OWORD *)&a4->var0[32];
  v13[3] = v11;
  self->_constraint = _createConstraintFromDefinition((uint64_t)v13);
  v12 = objc_msgSend(a3, "_handle");
  (*(void (**)(uint64_t, btHingeConstraint *, _QWORD))(*(_QWORD *)v12 + 112))(v12, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  uint64_t v4;
  btHingeConstraint *constraint;

  if (self->_constraint)
  {
    v4 = objc_msgSend(a3, "_handle");
    (*(void (**)(uint64_t, btHingeConstraint *))(*(_QWORD *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint)
      (*((void (**)(btHingeConstraint *))constraint->var0 + 1))(constraint);
    self->_constraint = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  $3F1CFB7B4EAFEC35E1C229479D3CF367 *p_definition;
  SCNPhysicsBody *bodyB;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsHingeJoint;
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
}

- (SCNPhysicsHingeJoint)initWithCoder:(id)a3
{
  SCNPhysicsHingeJoint *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNPhysicsHingeJoint;
  v4 = -[SCNPhysicsBehavior initWithCoder:](&v15, sel_initWithCoder_);
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
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

- (void)_addToPhysicsWorld:(os_log_t)log definition:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: didAddToPhysicsWorld - can't share a physics behavior to multiple world", v1, 2u);
}

@end
