@implementation SCNPhysicsBallSocketJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  btPoint2PointConstraint *constraint;
  objc_super v4;

  constraint = self->_constraint;
  if (constraint)
    (*((void (**)(btPoint2PointConstraint *, SEL))constraint->var0 + 1))(constraint, a2);

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsBallSocketJoint;
  -[SCNPhysicsBallSocketJoint dealloc](&v4, sel_dealloc);
}

- (SCNPhysicsBallSocketJoint)initWithBodyA:(id)a3 anchorA:(SCNVector3)a4 bodyB:(id)a5 anchorB:(SCNVector3)a6
{
  float z;
  float y;
  float x;
  float v10;
  float v11;
  float v12;
  SCNPhysicsBallSocketJoint *v14;
  objc_super v16;

  z = a6.z;
  y = a6.y;
  x = a6.x;
  v10 = a4.z;
  v11 = a4.y;
  v12 = a4.x;
  v16.receiver = self;
  v16.super_class = (Class)SCNPhysicsBallSocketJoint;
  v14 = -[SCNPhysicsBallSocketJoint init](&v16, sel_init);
  if (v14)
  {
    v14->_definition.bodyA = (SCNPhysicsBody *)a3;
    v14->_definition.anchorA.x = v12;
    v14->_definition.anchorA.y = v11;
    v14->_definition.anchorA.z = v10;
    v14->_definition.bodyB = (SCNPhysicsBody *)a5;
    v14->_definition.anchorB.x = x;
    v14->_definition.anchorB.y = y;
    v14->_definition.anchorB.z = z;
  }
  return v14;
}

- (SCNPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:(SCNVector3)a4
{
  float z;
  float y;
  float x;
  SCNPhysicsBallSocketJoint *v8;
  objc_super v10;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsBallSocketJoint;
  v8 = -[SCNPhysicsBallSocketJoint init](&v10, sel_init);
  if (v8)
  {
    v8->_definition.bodyA = (SCNPhysicsBody *)a3;
    v8->_definition.anchorA.x = x;
    v8->_definition.anchorA.y = y;
    v8->_definition.anchorA.z = z;
  }
  return v8;
}

+ (SCNPhysicsBallSocketJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB anchorB:(SCNVector3)anchorB
{
  float z;
  float y;
  float x;
  float v10;
  float v11;
  float v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  z = anchorB.z;
  y = anchorB.y;
  x = anchorB.x;
  v10 = anchorA.z;
  v11 = anchorA.y;
  v12 = anchorA.x;
  v14 = objc_alloc((Class)a1);
  *(float *)&v15 = v12;
  *(float *)&v16 = v11;
  *(float *)&v17 = v10;
  *(float *)&v18 = x;
  *(float *)&v19 = y;
  *(float *)&v20 = z;
  return (SCNPhysicsBallSocketJoint *)(id)objc_msgSend(v14, "initWithBodyA:anchorA:bodyB:anchorB:", bodyA, bodyB, v15, v16, v17, v18, v19, v20);
}

+ (SCNPhysicsBallSocketJoint)jointWithBody:(SCNPhysicsBody *)body anchor:(SCNVector3)anchor
{
  float z;
  float y;
  float x;
  id v8;
  double v9;
  double v10;
  double v11;

  z = anchor.z;
  y = anchor.y;
  x = anchor.x;
  v8 = objc_alloc((Class)a1);
  *(float *)&v9 = x;
  *(float *)&v10 = y;
  *(float *)&v11 = z;
  return (SCNPhysicsBallSocketJoint *)(id)objc_msgSend(v8, "initWithBody:anchor:", body, v9, v10, v11);
}

- (SCNPhysicsBody)bodyA
{
  return self->_definition.bodyA;
}

- (SCNPhysicsBody)bodyB
{
  return self->_definition.bodyB;
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
  v4[2] = __40__SCNPhysicsBallSocketJoint_setAnchorA___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorA;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __40__SCNPhysicsBallSocketJoint_setAnchorA___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    *(_QWORD *)&v2 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 368) = v2;
  }
  return *(float *)&v2;
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
  v4[2] = __40__SCNPhysicsBallSocketJoint_setAnchorB___block_invoke;
  v4[3] = &unk_1EA59E4C8;
  v4[4] = self;
  v5 = anchorB;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

float __40__SCNPhysicsBallSocketJoint_setAnchorB___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    *(_QWORD *)&v2 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 384) = v2;
  }
  return *(float *)&v2;
}

- (void)_copyDefinition:(id *)a3
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)&self->_definition.anchorB.y;
  v4 = *(_OWORD *)&self->_definition.anchorA.x;
  *(_OWORD *)a3->var0 = *(_OWORD *)&self->_definition.bodyA;
  *(_OWORD *)&a3->var0[16] = v4;
  *(_QWORD *)&a3->var0[32] = v3;
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  SCNPhysicsWorld *world;
  BOOL v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

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
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v10;
  v13 = *(_QWORD *)&a4->var0[32];
  self->_constraint = _createConstraintFromDefinition((uint64_t)v12);
  v11 = objc_msgSend(a3, "_handle");
  (*(void (**)(uint64_t, btPoint2PointConstraint *, _QWORD))(*(_QWORD *)v11 + 112))(v11, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  uint64_t v4;
  btPoint2PointConstraint *constraint;

  if (self->_constraint)
  {
    v4 = objc_msgSend(a3, "_handle");
    (*(void (**)(uint64_t, btPoint2PointConstraint *))(*(_QWORD *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint)
      (*((void (**)(btPoint2PointConstraint *))constraint->var0 + 1))(constraint);
    self->_constraint = 0;
    self->_world = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  $1263CD97BB41435D7BDAA56CF9645866 *p_definition;
  SCNPhysicsBody *bodyB;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsBallSocketJoint;
  -[SCNPhysicsBehavior encodeWithCoder:](&v7, sel_encodeWithCoder_);
  p_definition = &self->_definition;
  if (p_definition->bodyA)
    objc_msgSend(a3, "encodeObject:forKey:", p_definition->bodyA, CFSTR("bodyA"));
  bodyB = p_definition->bodyB;
  if (bodyB)
    objc_msgSend(a3, "encodeObject:forKey:", bodyB, CFSTR("bodyB"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("anchorA"), p_definition->anchorA.x, p_definition->anchorA.y, p_definition->anchorA.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("anchorB"), p_definition->anchorB.x, p_definition->anchorB.y, p_definition->anchorB.z);
}

- (SCNPhysicsBallSocketJoint)initWithCoder:(id)a3
{
  SCNPhysicsBallSocketJoint *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNPhysicsBallSocketJoint;
  v4 = -[SCNPhysicsBehavior initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_definition.anchorA.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("anchorA"));
    v4->_definition.anchorA.y = v6;
    v4->_definition.anchorA.z = v7;
    v4->_definition.anchorB.x = SCNDecodeVector3(a3, (uint64_t)CFSTR("anchorB"));
    v4->_definition.anchorB.y = v8;
    v4->_definition.anchorB.z = v9;
    v4->_definition.bodyA = (SCNPhysicsBody *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyA"));
    v4->_definition.bodyB = (SCNPhysicsBody *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyB"));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

@end
