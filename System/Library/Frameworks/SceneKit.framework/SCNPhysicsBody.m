@implementation SCNPhysicsBody

- (SCNPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4
{
  SCNPhysicsBody *v6;
  SCNPhysicsBody *v7;
  double v8;
  int64x2_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SCNPhysicsBody;
  v6 = -[SCNPhysicsBody init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_physicsShape = (SCNPhysicsShape *)a4;
    v8 = 0.0;
    if (a3 == 1)
      v8 = 1.0;
    v7->_mass = v8;
    *(_OWORD *)&v7->_charge = xmmword_1DD02A3F0;
    *(_OWORD *)&v7->_restitution = xmmword_1DD02A400;
    v7->_damping = 0.1;
    v7->_angularDamping = 0.1;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&v7->_velocityFactor.x = _Q0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v7->_angularVelocityFactor.y = _Q0;
    *(int64x2_t *)&v7->_linearRestingThreshold = vdupq_n_s64(0x3FB999999999999AuLL);
    v7->_allowsResting = 1;
    v7->_ignoreGravity = 0;
    *(int32x2_t *)&_Q0 = vdup_n_s32(a3 == 0);
    v14.i64[0] = _Q0;
    v14.i64[1] = DWORD1(_Q0);
    *(int8x16_t *)&v7->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v14, 0x3FuLL)), (int8x16_t)xmmword_1DD02A410, (int8x16_t)xmmword_1DD009420);
    v7->_contactTestBitMask = 0;
    v7->_body = -[SCNPhysicsBody _createBody](v7, "_createBody");
    v7->_isDefaultShape = a4 == 0;
  }
  return v7;
}

- (__C3DScene)sceneRef
{
  return -[SCNNode sceneRef](self->_node, "sceneRef");
}

- (void)_handle
{
  return self->_body;
}

- (void)dealloc
{
  _QWORD *body;
  uint64_t v4;
  objc_super v5;

  body = self->_body;
  if (body)
  {
    v4 = body[67];
    if (!v4 || ((*(void (**)(_QWORD, SEL))(*(_QWORD *)v4 + 8))(body[67], a2), (body = self->_body) != 0))
      (*(void (**)(_QWORD *, SEL))(*body + 16))(body, a2);
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsBody;
  -[SCNPhysicsBody dealloc](&v5, sel_dealloc);
}

+ (SCNPhysicsBody)bodyWithType:(SCNPhysicsBodyType)type shape:(SCNPhysicsShape *)shape
{
  return (SCNPhysicsBody *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:shape:", type, shape);
}

+ (SCNPhysicsBody)staticBody
{
  return (SCNPhysicsBody *)objc_msgSend((id)objc_opt_class(), "bodyWithType:shape:", 0, 0);
}

+ (SCNPhysicsBody)dynamicBody
{
  return (SCNPhysicsBody *)objc_msgSend((id)objc_opt_class(), "bodyWithType:shape:", 1, 0);
}

+ (SCNPhysicsBody)kinematicBody
{
  return (SCNPhysicsBody *)objc_msgSend((id)objc_opt_class(), "bodyWithType:shape:", 2, 0);
}

- (void)setType:(SCNPhysicsBodyType)type
{
  int32x2_t v5;
  int64x2_t v6;
  __C3DScene *v7;
  SCNNode *node;
  double v9;
  _QWORD v10[6];

  self->_type = type;
  v5 = vdup_n_s32(type == SCNPhysicsBodyTypeStatic);
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  *(int8x16_t *)&self->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v6, 0x3FuLL)), (int8x16_t)xmmword_1DD02A410, (int8x16_t)xmmword_1DD009420);
  v7 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__SCNPhysicsBody_setType___block_invoke;
  v10[3] = &unk_1EA59E450;
  v10[4] = self;
  v10[5] = type;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, node, v10);
  v9 = 0.0;
  if (type == SCNPhysicsBodyTypeDynamic)
    v9 = 1.0;
  -[SCNPhysicsBody setMass:](self, "setMass:", v9);
}

btCollisionObject *__26__SCNPhysicsBody_setType___block_invoke(uint64_t a1)
{
  btCollisionObject *result;
  uint64_t v3;
  int v4;

  result = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (result)
  {
    btCollisionObject::forceActivationState(result, 1);
    __modifyCollisionFlagsFromType(*(btRigidBody **)(*(_QWORD *)(a1 + 32) + 232), *(SCNPhysicsBodyType *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 224))
      v4 = 1;
    else
      v4 = 4;
    btCollisionObject::setActivationState(*(btCollisionObject **)(v3 + 232), v4);
    return btCollisionObject::activate(*(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232), 0);
  }
  return result;
}

- (SCNPhysicsBodyType)type
{
  return self->_type;
}

- (void)setMass:(CGFloat)mass
{
  __int128 v5;
  __C3DScene *v6;
  SCNNode *node;
  _QWORD v8[7];
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_mass = mass;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  *(_QWORD *)&v5 = *(_QWORD *)&self->_momentOfInertia.x;
  DWORD2(v5) = LODWORD(self->_momentOfInertia.z);
  v10 = v5;
  v6 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__SCNPhysicsBody_setMass___block_invoke;
  v8[3] = &unk_1EA5A1570;
  *(CGFloat *)&v8[6] = mass;
  v8[4] = self;
  v8[5] = v9;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, node, v8);
  _Block_object_dispose(v9, 8);
}

void __26__SCNPhysicsBody_setMass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int128 *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 232);
  if (v3)
  {
    if (*(_BYTE *)(v2 + 168))
      v4 = (unsigned __int128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    else
      v4 = 0;
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(a1 + 48));
  }
}

- (CGFloat)mass
{
  return self->_mass;
}

- (BOOL)respondsToCollision
{
  return 1;
}

- (void)setMomentOfInertia:(SCNVector3)momentOfInertia
{
  float y;
  float z;
  __C3DScene *v6;
  SCNNode *node;
  _QWORD v8[6];
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_momentOfInertia = momentOfInertia;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  y = momentOfInertia.y;
  z = momentOfInertia.z;
  v10 = *(_OWORD *)&momentOfInertia.x;
  v6 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SCNPhysicsBody_setMomentOfInertia___block_invoke;
  v8[3] = &unk_1EA5A1598;
  v8[4] = self;
  v8[5] = v9;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, node, v8);
  _Block_object_dispose(v9, 8);
}

void __37__SCNPhysicsBody_setMomentOfInertia___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int128 *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 232);
  if (v3)
  {
    if (*(_BYTE *)(v2 + 168))
      v4 = (unsigned __int128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    else
      v4 = 0;
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(v2 + 16));
  }
}

- (SCNVector3)momentOfInertia
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_momentOfInertia.x;
  y = self->_momentOfInertia.y;
  z = self->_momentOfInertia.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterOfMassOffset:(SCNVector3)centerOfMassOffset
{
  float y;
  float z;
  double mass;
  float v7;
  BOOL explicitMomentOfInertia;
  __C3DScene *v9;
  SCNNode *node;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  SCNPhysicsBody *v16;
  double v17;
  BOOL v18;

  self->_centerOfMassOffset = centerOfMassOffset;
  y = centerOfMassOffset.y;
  z = centerOfMassOffset.z;
  v12 = *(_OWORD *)&centerOfMassOffset.x;
  mass = self->_mass;
  *(_QWORD *)&centerOfMassOffset.x = *(_QWORD *)&self->_momentOfInertia.x;
  v7 = self->_momentOfInertia.z;
  v11 = *(_OWORD *)&centerOfMassOffset.x;
  explicitMomentOfInertia = self->_explicitMomentOfInertia;
  v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__SCNPhysicsBody_setCenterOfMassOffset___block_invoke;
  v13[3] = &unk_1EA5A15C0;
  v16 = self;
  v17 = mass;
  v18 = explicitMomentOfInertia;
  v14 = v12;
  v15 = v11;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v13);
}

void __40__SCNPhysicsBody_setCenterOfMassOffset___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  btQuaternion *v7;
  double v8;
  unsigned __int128 *v9;
  float v10;
  __int128 v11;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 232);
  if (v1)
  {
    v3 = *(_OWORD **)(v1 + 536);
    if (v3)
    {
      v3[3] = *(_OWORD *)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 232);
      *(_QWORD *)(v4 + 536) = v3;
      (*(void (**)(_OWORD *, uint64_t))(*(_QWORD *)v3 + 16))(v3, v4 + 16);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 232);
      v7 = *(btQuaternion **)(v6 + 208);
      v8 = *(double *)(a1 + 72);
      if (*(_BYTE *)(a1 + 80))
        v9 = (unsigned __int128 *)(a1 + 48);
      else
        v9 = 0;
      v10 = *(float *)(a1 + 40);
      *(_QWORD *)&v11 = *(_QWORD *)(a1 + 32);
      *((_QWORD *)&v11 + 1) = LODWORD(v10);
      __setCollisionShape(v6, v7, v9, &v11, v8, v10, *(float *)&v11, v5);
    }
  }
}

- (SCNVector3)centerOfMassOffset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_centerOfMassOffset.x;
  y = self->_centerOfMassOffset.y;
  z = self->_centerOfMassOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUsesDefaultMomentOfInertia:(BOOL)usesDefaultMomentOfInertia
{
  __int128 v3;
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_explicitMomentOfInertia = !usesDefaultMomentOfInertia;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3020000000;
  *(_QWORD *)&v3 = *(_QWORD *)&self->_momentOfInertia.x;
  DWORD2(v3) = LODWORD(self->_momentOfInertia.z);
  v9 = v3;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SCNPhysicsBody_setUsesDefaultMomentOfInertia___block_invoke;
  v7[3] = &unk_1EA5A1598;
  v7[4] = self;
  v7[5] = v8;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
  _Block_object_dispose(v8, 8);
}

void __48__SCNPhysicsBody_setUsesDefaultMomentOfInertia___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int128 *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 232);
  if (v3)
  {
    if (*(_BYTE *)(v2 + 168))
      v4 = (unsigned __int128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    else
      v4 = 0;
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(v2 + 16));
  }
}

- (BOOL)usesDefaultMomentOfInertia
{
  return !self->_explicitMomentOfInertia;
}

- (void)setCharge:(CGFloat)charge
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_charge = charge;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__SCNPhysicsBody_setCharge___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = charge;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

float __28__SCNPhysicsBody_setCharge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 532) = result;
  }
  return result;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (BOOL)isResting
{
  _DWORD *body;
  int v3;

  body = self->_body;
  if (!body)
    return 0;
  v3 = body[61];
  return v3 == 2 || v3 == 5;
}

- (void)updateGlobalScale:(double)a3
{
  uint64_t v3;
  float v4;

  v3 = *((_QWORD *)self->_body + 67);
  if (v3)
  {
    v4 = a3;
    *(float *)(v3 + 64) = v4;
  }
}

- (BOOL)allowsResting
{
  return self->_allowsResting;
}

- (void)setAllowsResting:(BOOL)allowsResting
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[5];
  BOOL v8;

  self->_allowsResting = allowsResting;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SCNPhysicsBody_setAllowsResting___block_invoke;
  v7[3] = &unk_1EA59E478;
  v7[4] = self;
  v8 = allowsResting;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

btCollisionObject *__35__SCNPhysicsBody_setAllowsResting___block_invoke(uint64_t a1)
{
  btCollisionObject *result;
  int v3;

  result = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (result)
  {
    btCollisionObject::activate(result, 0);
    if (*(_BYTE *)(a1 + 40))
      v3 = 1;
    else
      v3 = 4;
    return btCollisionObject::setActivationState(*(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232), v3);
  }
  return result;
}

- (void)setFriction:(CGFloat)friction
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_friction = friction;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SCNPhysicsBody_setFriction___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = friction;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

float __30__SCNPhysicsBody_setFriction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 252) = result;
  }
  return result;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (void)setRestitution:(CGFloat)restitution
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_restitution = restitution;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SCNPhysicsBody_setRestitution___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = restitution;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

float __33__SCNPhysicsBody_setRestitution___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 256) = result;
  }
  return result;
}

- (CGFloat)restitution
{
  return self->_restitution;
}

- (void)setRollingFriction:(CGFloat)rollingFriction
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_rollingFriction = rollingFriction;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SCNPhysicsBody_setRollingFriction___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = rollingFriction;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

float __37__SCNPhysicsBody_setRollingFriction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 260) = result;
  }
  return result;
}

- (CGFloat)rollingFriction
{
  return self->_rollingFriction;
}

- (void)setDamping:(CGFloat)damping
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_damping = damping;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__SCNPhysicsBody_setDamping___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = damping;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

int8x8_t __29__SCNPhysicsBody_setDamping___block_invoke(uint64_t a1)
{
  btRigidBody *v2;
  double v3;
  int8x8_t result;

  v2 = *(btRigidBody **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    v3 = *(double *)(a1 + 40);
    *(float *)&v3 = v3;
    return btRigidBody::setDamping(v2, *(float32x2_t *)&v3, *(float32_t *)&v3);
  }
  return result;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setAngularDamping:(CGFloat)angularDamping
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_angularDamping = angularDamping;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SCNPhysicsBody_setAngularDamping___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = angularDamping;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

int8x8_t __36__SCNPhysicsBody_setAngularDamping___block_invoke(uint64_t a1)
{
  uint64_t v2;
  btRigidBody *v3;
  double v4;
  float32_t v5;
  int8x8_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(btRigidBody **)(v2 + 232);
  if (v3)
  {
    v4 = *(double *)(v2 + 80);
    *(float *)&v4 = v4;
    v5 = *(double *)(a1 + 40);
    return btRigidBody::setDamping(v3, *(float32x2_t *)&v4, v5);
  }
  return result;
}

- (CGFloat)angularDamping
{
  return self->_angularDamping;
}

- (void)setLinearRestingThreshold:(CGFloat)linearRestingThreshold
{
  double angularRestingThreshold;
  __C3DScene *v6;
  SCNNode *node;
  _QWORD v8[7];

  self->_linearRestingThreshold = linearRestingThreshold;
  angularRestingThreshold = self->_angularRestingThreshold;
  v6 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SCNPhysicsBody_setLinearRestingThreshold___block_invoke;
  v8[3] = &unk_1EA5A15E8;
  v8[4] = self;
  *(CGFloat *)&v8[5] = linearRestingThreshold;
  *(double *)&v8[6] = angularRestingThreshold;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, node, v8);
}

float32x2_t __44__SCNPhysicsBody_setLinearRestingThreshold___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float32x2_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
    *(float32x2_t *)(v1 + 524) = result;
  }
  return result;
}

- (CGFloat)linearRestingThreshold
{
  return self->_linearRestingThreshold;
}

- (void)setAngularRestingThreshold:(CGFloat)angularRestingThreshold
{
  double linearRestingThreshold;
  __C3DScene *v6;
  SCNNode *node;
  _QWORD v8[7];

  self->_angularRestingThreshold = angularRestingThreshold;
  linearRestingThreshold = self->_linearRestingThreshold;
  v6 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SCNPhysicsBody_setAngularRestingThreshold___block_invoke;
  v8[3] = &unk_1EA5A15E8;
  v8[4] = self;
  *(double *)&v8[5] = linearRestingThreshold;
  *(CGFloat *)&v8[6] = angularRestingThreshold;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, node, v8);
}

float32x2_t __45__SCNPhysicsBody_setAngularRestingThreshold___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float32x2_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    result = vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
    *(float32x2_t *)(v1 + 524) = result;
  }
  return result;
}

- (CGFloat)angularRestingThreshold
{
  return self->_angularRestingThreshold;
}

- (double)linearSleepingThreshold
{
  return self->_linearRestingThreshold;
}

- (double)angularSleepingThreshold
{
  return self->_angularRestingThreshold;
}

- (btCollisionShape)_shapeHandleWithShape:(id)a3 owner:(id)a4
{
  btCollisionShape *v7;

  if (objc_msgSend(a3, "referenceObject"))
    return (btCollisionShape *)objc_msgSend(a3, "_handle");
  objc_msgSend(a3, "setReferenceObject:", a4);
  v7 = (btCollisionShape *)objc_msgSend(a3, "_handle");
  objc_msgSend(a3, "setReferenceObject:", 0);
  return v7;
}

- (void)setPhysicsShape:(SCNPhysicsShape *)physicsShape
{
  SCNPhysicsShape *v3;
  double mass;
  __int128 v7;
  BOOL explicitMomentOfInertia;
  __C3DScene *v9;
  SCNNode *node;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  SCNPhysicsBody *v16;
  SCNPhysicsShape *v17;
  SCNPhysicsShape *v18;
  double v19;
  BOOL v20;

  v3 = self->_physicsShape;
  if (v3 != physicsShape)
  {
    self->_isDefaultShape = 0;
    self->_physicsShape = physicsShape;
    mass = self->_mass;
    *(_QWORD *)&v7 = *(_QWORD *)&self->_momentOfInertia.x;
    DWORD2(v7) = LODWORD(self->_momentOfInertia.z);
    v12 = v7;
    *(_QWORD *)&v7 = *(_QWORD *)&self->_centerOfMassOffset.x;
    explicitMomentOfInertia = self->_explicitMomentOfInertia;
    *((_QWORD *)&v7 + 1) = LODWORD(self->_centerOfMassOffset.z);
    v11 = v7;
    v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
    node = self->_node;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3321888768;
    v13[2] = __34__SCNPhysicsBody_setPhysicsShape___block_invoke;
    v13[3] = &unk_1EA59AD88;
    v16 = self;
    v17 = physicsShape;
    v19 = mass;
    v20 = explicitMomentOfInertia;
    v14 = v12;
    v15 = v11;
    v18 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v13);
  }
}

void __34__SCNPhysicsBody_setPhysicsShape___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  btCollisionShape *DefaultShapeForNode;
  float v5;
  float v6;
  uint64_t v7;
  double v8;
  unsigned __int128 *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = a1 + 64;
  v3 = *(_QWORD **)(a1 + 64);
  if (v3[29])
  {
    DefaultShapeForNode = (btCollisionShape *)objc_msgSend(v3, "_shapeHandleWithShape:owner:", *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 64), "_owner"));
    if (DefaultShapeForNode
      || (v10 = *(void **)(*(_QWORD *)v2 + 8)) != 0
      && (DefaultShapeForNode = C3DPhysicsShapeGetDefaultShapeForNode((float32x4_t *)objc_msgSend(v10, "nodeRef"))) != 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 232);
      v8 = *(double *)(a1 + 88);
      if (*(_BYTE *)(a1 + 96))
        v9 = (unsigned __int128 *)(a1 + 32);
      else
        v9 = 0;
      v18 = *(_OWORD *)(a1 + 48);
      __setCollisionShape(v7, (btQuaternion *)DefaultShapeForNode, v9, &v18, v8, *(float *)&v18, v5, v6);
    }
    else
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __34__SCNPhysicsBody_setPhysicsShape___block_invoke_cold_1(v2, v11, v12, v13, v14, v15, v16, v17);
    }
  }

}

- (SCNPhysicsShape)physicsShape
{
  return self->_physicsShape;
}

- (NSUInteger)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  unint64_t collisionBitMask;
  unint64_t contactTestBitMask;
  uint64_t v7;
  uint64_t v8;
  __C3DScene *v9;
  SCNNode *node;
  _QWORD v11[9];

  self->_categoryBitMask = categoryBitMask;
  collisionBitMask = self->_collisionBitMask;
  contactTestBitMask = self->_contactTestBitMask;
  v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
    node = self->_node;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__SCNPhysicsBody_setCategoryBitMask___block_invoke;
    v11[3] = &unk_1EA5A1610;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = categoryBitMask;
    v11[7] = collisionBitMask;
    v11[8] = contactTestBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v11);
  }
}

void __37__SCNPhysicsBody_setCategoryBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 200);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 8) != *(_QWORD *)(a1 + 48))
        _recreateProxy((btDynamicsWorld *)objc_msgSend(*(id *)(a1 + 40), "_handle"), *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
  }
}

- (NSUInteger)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(NSUInteger)collisionBitMask
{
  unint64_t categoryBitMask;
  unint64_t contactTestBitMask;
  uint64_t v7;
  uint64_t v8;
  __C3DScene *v9;
  SCNNode *node;
  _QWORD v11[9];

  self->_collisionBitMask = collisionBitMask;
  categoryBitMask = self->_categoryBitMask;
  contactTestBitMask = self->_contactTestBitMask;
  v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
    node = self->_node;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__SCNPhysicsBody_setCollisionBitMask___block_invoke;
    v11[3] = &unk_1EA5A1610;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = collisionBitMask;
    v11[7] = categoryBitMask;
    v11[8] = contactTestBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v11);
  }
}

void __38__SCNPhysicsBody_setCollisionBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 200);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 16) != *(_QWORD *)(a1 + 48))
        _recreateProxy((btDynamicsWorld *)objc_msgSend(*(id *)(a1 + 40), "_handle"), *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
  }
}

- (NSUInteger)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(NSUInteger)contactTestBitMask
{
  unint64_t categoryBitMask;
  unint64_t collisionBitMask;
  uint64_t v7;
  uint64_t v8;
  __C3DScene *v9;
  SCNNode *node;
  _QWORD v11[9];

  self->_contactTestBitMask = contactTestBitMask;
  categoryBitMask = self->_categoryBitMask;
  collisionBitMask = self->_collisionBitMask;
  v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
    node = self->_node;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__SCNPhysicsBody_setContactTestBitMask___block_invoke;
    v11[3] = &unk_1EA5A1610;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = contactTestBitMask;
    v11[7] = collisionBitMask;
    v11[8] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v11);
  }
}

void __40__SCNPhysicsBody_setContactTestBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 200);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 24) != *(_QWORD *)(a1 + 48))
        _recreateProxy((btDynamicsWorld *)objc_msgSend(*(id *)(a1 + 40), "_handle"), *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
  }
}

- (void)setContinuousCollisionDetectionThreshold:(CGFloat)continuousCollisionDetectionThreshold
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[6];

  self->_continuousCollisionDetectionThreshold = continuousCollisionDetectionThreshold;
  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SCNPhysicsBody_setContinuousCollisionDetectionThreshold___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = continuousCollisionDetectionThreshold;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

uint64_t __59__SCNPhysicsBody_setContinuousCollisionDetectionThreshold___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 232);
  if (v1)
  {
    v2 = *(double *)(result + 40);
    *(float *)(v1 + 288) = v2;
    return __updateCCDRadiusIfNeeded(*(_QWORD *)(*(_QWORD *)(result + 32) + 232));
  }
  return result;
}

- (double)continuousCollisionDetection
{
  return self->_continuousCollisionDetectionThreshold;
}

- (void)setVelocity:(SCNVector3)velocity
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  SCNNode *node;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  z = velocity.z;
  y = velocity.y;
  x = velocity.x;
  self->_velocity = velocity;
  v7 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__SCNPhysicsBody_setVelocity___block_invoke;
  v9[3] = &unk_1EA59E4C8;
  v9[4] = self;
  v10 = x;
  v11 = y;
  v12 = z;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, node, v9);
}

float __30__SCNPhysicsBody_setVelocity___block_invoke(uint64_t a1)
{
  btCollisionObject *v2;
  __int128 v3;

  v2 = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    *(_QWORD *)&v3 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)&v3 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) + 352) = v3;
  }
  return *(float *)&v3;
}

- (SCNVector3)velocity
{
  char *body;
  SCNVector3 *p_velocity;
  float *p_y;
  float *p_z;
  float v7;
  float v8;
  float x;
  SCNVector3 result;

  if (+[SCNTransaction immediateMode](SCNTransaction, "immediateMode")
    && (body = (char *)self->_body) != 0)
  {
    p_velocity = (SCNVector3 *)(body + 352);
    p_y = (float *)(body + 356);
    p_z = (float *)(body + 360);
  }
  else
  {
    p_velocity = &self->_velocity;
    p_y = &self->_velocity.y;
    p_z = &self->_velocity.z;
  }
  v7 = *p_z;
  v8 = *p_y;
  x = p_velocity->x;
  result.z = v7;
  result.y = v8;
  result.x = x;
  return result;
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  SCNNode *node;
  uint64_t v6;
  uint64_t v7;
  SCNNode *v8;
  _QWORD v9[6];
  BOOL v10;

  self->_ignoreGravity = !affectedByGravity;
  node = self->_node;
  if (node)
  {
    v6 = objc_msgSend(-[SCNNode scene](node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
    node = self->_node;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[SCNNode sceneRef](node, "sceneRef");
  v8 = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SCNPhysicsBody_setAffectedByGravity___block_invoke;
  v9[3] = &unk_1EA5A1638;
  v10 = affectedByGravity;
  v9[4] = self;
  v9[5] = v6;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, v8, v9);
}

double __39__SCNPhysicsBody_setAffectedByGravity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  __int32 v5;
  __int32 v6;
  double v7;
  btRigidBody *v8;
  float32x4_t v9;
  btVector3 v10;
  double result;
  __int32 v12;
  float32x4_t v13;
  __int32 v14;
  btVector3 v15;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)(v1 + 576) = *(_BYTE *)(a1 + 48) == 0;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "gravity");
      v13.i64[0] = v4;
      v12 = v5;
      v14 = v6;
      objc_msgSend(*(id *)(a1 + 40), "scale");
      *(float *)&v7 = v7;
      v8 = *(btRigidBody **)(*(_QWORD *)(a1 + 32) + 232);
      v9 = v13;
      v9.i32[1] = v12;
      v9.i32[2] = v14;
      v10 = (btVector3)vmulq_n_f32(v9, 1.0 / *(float *)&v7);
      v10.var0.var0[3] = 0.0;
      v15 = v10;
    }
    else
    {
      v8 = *(btRigidBody **)(*(_QWORD *)(a1 + 32) + 232);
      v15 = (btVector3)0;
    }
    *(_QWORD *)&result = btRigidBody::setGravity(v8, (float32x4_t *)&v15).n128_u64[0];
  }
  return result;
}

- (BOOL)isAffectedByGravity
{
  return !self->_ignoreGravity;
}

- (void)setAngularVelocity:(SCNVector4)angularVelocity
{
  float w;
  float z;
  float y;
  float x;
  __C3DScene *v8;
  SCNNode *node;
  _QWORD v10[5];
  float v11;
  float v12;
  float v13;
  float v14;

  w = angularVelocity.w;
  z = angularVelocity.z;
  y = angularVelocity.y;
  x = angularVelocity.x;
  self->_angularVelocity = angularVelocity;
  v8 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__SCNPhysicsBody_setAngularVelocity___block_invoke;
  v10[3] = &unk_1EA5A15E8;
  v10[4] = self;
  v11 = x;
  v12 = y;
  v13 = z;
  v14 = w;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, node, v10);
}

float32x4_t __37__SCNPhysicsBody_setAngularVelocity___block_invoke(uint64_t a1, float32x4_t result)
{
  __n128 *v2;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    result.i64[0] = *(_QWORD *)(a1 + 40);
    result.i32[2] = *(_DWORD *)(a1 + 48);
    result = vmulq_n_f32(result, *(float *)(a1 + 52));
    result.i32[3] = 0;
    v2[23] = (__n128)result;
  }
  return result;
}

- (SCNVector4)angularVelocity
{
  float32x4_t *body;
  float32x4_t v4;
  int8x16_t v5;
  float w;
  float32x4_t v7;
  float z;
  float v9;
  SCNVector4 result;

  if (+[SCNTransaction immediateMode](SCNTransaction, "immediateMode")
    && (body = (float32x4_t *)self->_body) != 0)
  {
    v4 = body[23];
    v5 = (int8x16_t)vmulq_f32(v4, v4);
    w = sqrtf(vadd_f32(vpadd_f32(*(float32x2_t *)v5.i8, *(float32x2_t *)v5.i8), (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)).f32[0]);
    if (w <= 0.0)
    {
      v7.i64[0] = 0;
      z = 0.0;
      w = 0.0;
    }
    else
    {
      v7 = vmulq_n_f32(v4, 1.0 / w);
      z = v7.f32[2];
    }
  }
  else
  {
    v7.i64[0] = *(_QWORD *)&self->_angularVelocity.x;
    z = self->_angularVelocity.z;
    w = self->_angularVelocity.w;
  }
  v9 = v7.f32[1];
  result.x = v7.f32[0];
  result.w = w;
  result.z = z;
  result.y = v9;
  return result;
}

- (void)setVelocityFactor:(SCNVector3)velocityFactor
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  SCNNode *node;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  z = velocityFactor.z;
  y = velocityFactor.y;
  x = velocityFactor.x;
  self->_velocityFactor = velocityFactor;
  v7 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SCNPhysicsBody_setVelocityFactor___block_invoke;
  v9[3] = &unk_1EA59E4C8;
  v9[4] = self;
  v10 = x;
  v11 = y;
  v12 = z;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, node, v9);
}

__n128 __36__SCNPhysicsBody_setVelocityFactor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float32x4_t v2;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    v2.i64[0] = *(_QWORD *)(a1 + 40);
    v2.i64[1] = *(unsigned int *)(a1 + 48);
    *(float32x4_t *)(v1 + 400) = v2;
    result = (__n128)vmulq_n_f32(v2, *(float *)(v1 + 384));
    result.n128_u32[3] = 0;
    *(__n128 *)(v1 + 640) = result;
  }
  return result;
}

- (SCNVector3)velocityFactor
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_velocityFactor.x;
  y = self->_velocityFactor.y;
  z = self->_velocityFactor.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAngularVelocityFactor:(SCNVector3)angularVelocityFactor
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  SCNNode *node;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  z = angularVelocityFactor.z;
  y = angularVelocityFactor.y;
  x = angularVelocityFactor.x;
  self->_angularVelocityFactor = angularVelocityFactor;
  v7 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SCNPhysicsBody_setAngularVelocityFactor___block_invoke;
  v9[3] = &unk_1EA59E4C8;
  v9[4] = self;
  v10 = x;
  v11 = y;
  v12 = z;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, node, v9);
}

float __43__SCNPhysicsBody_setAngularVelocityFactor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    *(_QWORD *)&v2 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 624) = v2;
  }
  return *(float *)&v2;
}

- (SCNVector3)angularVelocityFactor
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_angularVelocityFactor.x;
  y = self->_angularVelocityFactor.y;
  z = self->_angularVelocityFactor.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)applyForce:(SCNVector3)direction impulse:(BOOL)impulse
{
  float z;
  float y;
  float x;
  __C3DScene *v9;
  SCNNode *node;
  _QWORD v11[5];
  float v12;
  float v13;
  float v14;
  BOOL v15;

  z = direction.z;
  y = direction.y;
  x = direction.x;
  v9 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__SCNPhysicsBody_applyForce_impulse___block_invoke;
  v11[3] = &unk_1EA5A1660;
  v11[4] = self;
  v15 = impulse;
  v12 = x;
  v13 = y;
  v14 = z;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, node, v11);
}

float32x4_t __37__SCNPhysicsBody_applyForce_impulse___block_invoke(uint64_t a1)
{
  btCollisionObject *v2;
  float32x4_t *v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t result;
  NSObject *v8;

  v2 = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    v3 = *(float32x4_t **)(*(_QWORD *)(a1 + 32) + 232);
    v4.i64[0] = *(_QWORD *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    v5 = vmulq_f32(v4, v3[25]);
    if (*(_BYTE *)(a1 + 52))
    {
      v6 = vmulq_n_f32(v5, v3[24].f32[0]);
      v6.i32[3] = 0;
      result = vaddq_f32(v3[22], v6);
      v3[22] = result;
    }
    else
    {
      result = vaddq_f32(v3[29], v5);
      v3[29] = result;
    }
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
  }
  return result;
}

- (void)applyForce:(SCNVector3)direction atPosition:(SCNVector3)position impulse:(BOOL)impulse
{
  float z;
  float y;
  float x;
  float v9;
  float v10;
  float v11;
  __C3DScene *v13;
  SCNNode *node;
  _QWORD v15[5];
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  BOOL v22;

  z = position.z;
  y = position.y;
  x = position.x;
  v9 = direction.z;
  v10 = direction.y;
  v11 = direction.x;
  v13 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__SCNPhysicsBody_applyForce_atPosition_impulse___block_invoke;
  v15[3] = &unk_1EA5A1688;
  v15[4] = self;
  v22 = impulse;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  v19 = x;
  v20 = y;
  v21 = z;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v13, node, v15);
}

float32x4_t __48__SCNPhysicsBody_applyForce_atPosition_impulse___block_invoke(uint64_t a1)
{
  btCollisionObject *v2;
  uint64_t v3;
  float32x4_t result;
  NSObject *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  int8x16_t v13;
  btVector3 v14;

  v2 = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
    if (*(_BYTE *)(a1 + 64))
    {
      *(_QWORD *)v14.var0.var0 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)&v14.var0.var0[2] = *(unsigned int *)(a1 + 48);
      v13.i64[0] = *(_QWORD *)(a1 + 52);
      v13.i64[1] = *(unsigned int *)(a1 + 60);
      result.i64[0] = btRigidBody::applyImpulse((btRigidBody *)v3, (float32x4_t *)&v14, &v13).u64[0];
    }
    else
    {
      v6.i64[0] = *(_QWORD *)(a1 + 40);
      v6.i64[1] = *(unsigned int *)(a1 + 48);
      v7.i64[0] = *(_QWORD *)(a1 + 52);
      v8.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
      v8.i32[1] = *(_DWORD *)(a1 + 60);
      v8.i64[1] = v7.i64[0];
      v7.i64[1] = v8.u32[1];
      v9 = vmulq_f32(v6, *(float32x4_t *)(v3 + 400));
      v10.i64[0] = vextq_s8((int8x16_t)v9, (int8x16_t)v9, 4uLL).u64[0];
      v10.i64[1] = v9.i64[0];
      v11 = (int8x16_t)vsubq_f32(vmulq_f32(v7, v10), vmulq_f32(v9, v8));
      v10.i64[0] = vextq_s8(v11, v11, 4uLL).u64[0];
      v10.i64[1] = v11.u32[0];
      result = vaddq_f32(*(float32x4_t *)(v3 + 464), v9);
      v12 = vaddq_f32(*(float32x4_t *)(v3 + 480), vmulq_f32(*(float32x4_t *)(v3 + 624), v10));
      *(float32x4_t *)(v3 + 464) = result;
      *(float32x4_t *)(v3 + 480) = v12;
    }
  }
  else
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
  }
  return result;
}

- (void)applyTorque:(SCNVector4)torque impulse:(BOOL)impulse
{
  float w;
  float z;
  float y;
  float x;
  __C3DScene *v10;
  SCNNode *node;
  _QWORD v12[5];
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;

  w = torque.w;
  z = torque.z;
  y = torque.y;
  x = torque.x;
  v10 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__SCNPhysicsBody_applyTorque_impulse___block_invoke;
  v12[3] = &unk_1EA5A16B0;
  v12[4] = self;
  v13 = x;
  v14 = y;
  v15 = z;
  v16 = w;
  v17 = impulse;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v10, node, v12);
}

float32x4_t __38__SCNPhysicsBody_applyTorque_impulse___block_invoke(uint64_t a1)
{
  btCollisionObject *v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t *v5;
  float32x4_t v6;
  int8x16_t v7;
  int8x16_t v8;
  float32x4_t result;
  NSObject *v10;

  v2 = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    v3.i64[0] = *(_QWORD *)(a1 + 40);
    v3.i32[2] = *(_DWORD *)(a1 + 48);
    v4 = vmulq_n_f32(v3, *(float *)(a1 + 52));
    v4.i32[3] = 0;
    v5 = *(float32x4_t **)(*(_QWORD *)(a1 + 32) + 232);
    if (*(_BYTE *)(a1 + 56))
    {
      v6 = vmulq_f32(v5[19], v4);
      v7 = (int8x16_t)vmulq_f32(v5[20], v4);
      v8 = (int8x16_t)vmulq_f32(v5[21], v4);
      v8.i32[3] = 0;
      *(float32x2_t *)v6.f32 = vadd_f32(vpadd_f32(*(float32x2_t *)v6.f32, *(float32x2_t *)v7.i8), (float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
      *(float32x2_t *)&v6.u32[2] = vpadd_f32(vpadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0);
      result = vaddq_f32(v5[23], vmulq_f32(v6, v5[39]));
      v5[23] = result;
    }
    else
    {
      result = vaddq_f32(v5[30], vmulq_f32(v5[39], v4));
      v5[30] = result;
    }
  }
  else
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
  }
  return result;
}

- (void)_activate
{
  btCollisionObject *body;

  body = (btCollisionObject *)self->_body;
  if (body)
    btCollisionObject::activate(body, 0);
}

- (void)clearAllForces
{
  __C3DScene *v3;
  SCNNode *node;
  _QWORD v5[5];

  v3 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SCNPhysicsBody_clearAllForces__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, node, v5);
}

void __32__SCNPhysicsBody_clearAllForces__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v1)
  {
    *(_OWORD *)(v1 + 464) = 0u;
    *(_OWORD *)(v1 + 480) = 0u;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) + 352) = 0u;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) + 368) = 0u;
  }
  else
  {
    v2 = scn_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __32__SCNPhysicsBody_clearAllForces__block_invoke_cold_1();
  }
}

- (void)setResting:(BOOL)resting
{
  __C3DScene *v5;
  SCNNode *node;
  _QWORD v7[5];
  BOOL v8;

  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  node = self->_node;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__SCNPhysicsBody_setResting___block_invoke;
  v7[3] = &unk_1EA59E478;
  v7[4] = self;
  v8 = resting;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v7);
}

btCollisionObject *__29__SCNPhysicsBody_setResting___block_invoke(uint64_t a1)
{
  btCollisionObject *result;

  result = *(btCollisionObject **)(*(_QWORD *)(a1 + 32) + 232);
  if (result)
  {
    if (*(_BYTE *)(a1 + 40))
      return btCollisionObject::setActivationState(result, 3);
    else
      return btCollisionObject::activate(result, 0);
  }
  return result;
}

- (void)resetToTransform:(SCNMatrix4 *)a3
{
  __C3DScene *v5;
  __int128 v6;
  __int128 v7;
  SCNNode *node;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = -[SCNNode sceneRef](self->_node, "sceneRef");
  v9[1] = 3221225472;
  v6 = *(_OWORD *)&a3->m21;
  v10 = *(_OWORD *)&a3->m11;
  v11 = v6;
  v7 = *(_OWORD *)&a3->m41;
  v12 = *(_OWORD *)&a3->m31;
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __35__SCNPhysicsBody_resetToTransform___block_invoke;
  v9[3] = &unk_1EA5A16D8;
  v9[4] = self;
  v13 = v7;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, node, v9);
}

uint64_t __35__SCNPhysicsBody_resetToTransform___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v2;
  v3 = *(_OWORD *)(a1 + 88);
  v5[2] = *(_OWORD *)(a1 + 72);
  v5[3] = v3;
  return objc_msgSend(v1, "moveToTransform:", v5);
}

- (void)resetTransform
{
  SCNNode *node;
  __C3DScene *v4;
  SCNNode *v5;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  node = self->_node;
  if (node)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SCNNode worldTransform](node, "worldTransform");
    v4 = -[SCNNode sceneRef](self->_node, "sceneRef");
    v6[1] = 3221225472;
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v5 = self->_node;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __32__SCNPhysicsBody_resetTransform__block_invoke;
    v6[3] = &unk_1EA5A16D8;
    v6[4] = self;
    v10 = v14;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, v5, v6);
  }
}

uint64_t __32__SCNPhysicsBody_resetTransform__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v2;
  v3 = *(_OWORD *)(a1 + 88);
  v5[2] = *(_OWORD *)(a1 + 72);
  v5[3] = v3;
  return objc_msgSend(v1, "moveToTransform:", v5);
}

- (void)moveToPosition:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  SCNNode *v7;
  _OWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = -[SCNNode presentationNode](self->_node, "presentationNode");
  if (v7)
  {
    -[SCNNode worldTransform](v7, "worldTransform");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }
  *(_QWORD *)&v12 = __PAIR64__(LODWORD(y), LODWORD(x));
  *((float *)&v12 + 2) = z;
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  -[SCNPhysicsBody moveToTransform:](self, "moveToTransform:", v8);
}

- (void)rotateToAxisAngle:(SCNVector4)a3
{
  float w;
  float z;
  float y;
  float x;
  SCNNode *v8;
  SCNMatrix4 v9;
  SCNMatrix4 v10;
  SCNMatrix4 b;
  SCNMatrix4 a;
  SCNMatrix4 v13;
  SCNMatrix4 v14;
  SCNMatrix4 v15;
  float32x4_t v16;
  int8x16_t v17;
  _OWORD v18[4];

  w = a3.w;
  z = a3.z;
  y = a3.y;
  x = a3.x;
  v17.i32[2] = 0;
  v17.i64[0] = 0;
  v16.i32[2] = 0;
  v16.i64[0] = 0;
  memset(&v15, 0, sizeof(v15));
  v8 = -[SCNNode presentationNode](self->_node, "presentationNode");
  if (v8)
    -[SCNNode worldTransform](v8, "worldTransform");
  else
    memset(&v15, 0, sizeof(v15));
  C3DMatrix4x4FromSCNMatrix4(v18, (uint64_t)&v15);
  C3DMatrix4x4GetAffineTransforms((uint64_t)v18, &v17, 0, &v16);
  memset(&a.m22, 0, 40);
  *(_OWORD *)&a.m12 = 0u;
  LODWORD(a.m11) = v16.i32[0];
  LODWORD(a.m22) = v16.i32[0];
  LODWORD(a.m33) = v16.i32[2];
  a.m44 = 1.0;
  SCNMatrix4MakeRotation(&b, w, x, y, z);
  SCNMatrix4Mult(&v13, &a, &b);
  v10.m11 = 1.0;
  *(_QWORD *)&v10.m14 = 0;
  *(_QWORD *)&v10.m12 = 0;
  v10.m22 = 1.0;
  *(_QWORD *)&v10.m23 = 0;
  *(_QWORD *)&v10.m31 = 0;
  *(_QWORD *)&v10.m33 = 1065353216;
  LODWORD(v10.m41) = v17.i32[0];
  *(int32x2_t *)&v10.m42 = vzip1_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
  v10.m44 = 1.0;
  SCNMatrix4Mult(&v14, &v13, &v10);
  v15 = v14;
  v9 = v14;
  -[SCNPhysicsBody moveToTransform:](self, "moveToTransform:", &v9);
}

- (void)moveToTransform:(SCNMatrix4 *)a3
{
  btRigidBody *body;
  void *v5;
  float32x4_t *v6;
  btTransform v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13[4];

  if (self->_body)
  {
    C3DMatrix4x4FromSCNMatrix4(v13, (uint64_t)a3);
    v8.i32[2] = 0;
    v8.i64[0] = 0;
    C3DMatrix4x4GetScale(v13, &v8);
    v9 = v13[0];
    v10 = v13[1];
    v11 = v13[2];
    v12 = v13[3];
    C3DMatrix4x4ClearScale(&v9);
    body = (btRigidBody *)self->_body;
    *(_QWORD *)v7.var0.var0[0].var0.var0 = __PAIR64__(v10.u32[0], v9.u32[0]);
    *(_QWORD *)&v7.var0.var0[0].var0.var0[2] = v11.u32[0];
    *(_QWORD *)v7.var0.var0[1].var0.var0 = __PAIR64__(v10.u32[1], v9.u32[1]);
    *(_QWORD *)&v7.var0.var0[1].var0.var0[2] = v11.u32[1];
    *(_QWORD *)v7.var0.var0[2].var0.var0 = __PAIR64__(v10.u32[2], v9.u32[2]);
    *(_QWORD *)&v7.var0.var0[2].var0.var0[2] = v11.u32[2];
    *(_QWORD *)v7.var1.var0.var0 = v12.i64[0];
    *(_QWORD *)&v7.var1.var0.var0[2] = v12.u32[2];
    btRigidBody::proceedToTransform(body, &v7);
    v5 = self->_body;
    v6 = (float32x4_t *)*((_QWORD *)v5 + 67);
    if (v6)
    {
      v6[1] = v8;
      v5 = self->_body;
    }
    __updateCCDRadiusIfNeeded((uint64_t)v5);
    btCollisionObject::activate((btCollisionObject *)self->_body, 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  +[SCNTransaction begin](SCNTransaction, "begin", a3);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:shape:", -[SCNPhysicsBody type](self, "type"), -[SCNPhysicsBody physicsShape](self, "physicsShape"));
  -[SCNPhysicsBody mass](self, "mass");
  objc_msgSend(v4, "setMass:");
  -[SCNPhysicsBody charge](self, "charge");
  objc_msgSend(v4, "setCharge:");
  -[SCNPhysicsBody friction](self, "friction");
  objc_msgSend(v4, "setFriction:");
  -[SCNPhysicsBody restitution](self, "restitution");
  objc_msgSend(v4, "setRestitution:");
  -[SCNPhysicsBody rollingFriction](self, "rollingFriction");
  objc_msgSend(v4, "setRollingFriction:");
  -[SCNPhysicsBody damping](self, "damping");
  objc_msgSend(v4, "setDamping:");
  -[SCNPhysicsBody angularVelocity](self, "angularVelocity");
  objc_msgSend(v4, "setAngularVelocity:");
  -[SCNPhysicsBody angularDamping](self, "angularDamping");
  objc_msgSend(v4, "setAngularDamping:");
  -[SCNPhysicsBody linearRestingThreshold](self, "linearRestingThreshold");
  objc_msgSend(v4, "setLinearRestingThreshold:");
  -[SCNPhysicsBody angularRestingThreshold](self, "angularRestingThreshold");
  objc_msgSend(v4, "setAngularRestingThreshold:");
  -[SCNPhysicsBody velocityFactor](self, "velocityFactor");
  objc_msgSend(v4, "setVelocityFactor:");
  -[SCNPhysicsBody angularVelocityFactor](self, "angularVelocityFactor");
  objc_msgSend(v4, "setAngularVelocityFactor:");
  -[SCNPhysicsBody velocity](self, "velocity");
  objc_msgSend(v4, "setVelocity:");
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNPhysicsBody categoryBitMask](self, "categoryBitMask"));
  objc_msgSend(v4, "setCollisionBitMask:", -[SCNPhysicsBody collisionBitMask](self, "collisionBitMask"));
  objc_msgSend(v4, "setContactTestBitMask:", -[SCNPhysicsBody contactTestBitMask](self, "contactTestBitMask"));
  objc_msgSend(v4, "setAllowsResting:", -[SCNPhysicsBody allowsResting](self, "allowsResting"));
  -[SCNPhysicsBody angularVelocity](self, "angularVelocity");
  objc_msgSend(v4, "setAngularVelocity:");
  objc_msgSend(v4, "setAffectedByGravity:", -[SCNPhysicsBody isAffectedByGravity](self, "isAffectedByGravity"));
  objc_msgSend(v4, "setUsesDefaultMomentOfInertia:", -[SCNPhysicsBody usesDefaultMomentOfInertia](self, "usesDefaultMomentOfInertia"));
  -[SCNPhysicsBody momentOfInertia](self, "momentOfInertia");
  objc_msgSend(v4, "setMomentOfInertia:");
  -[SCNPhysicsBody centerOfMassOffset](self, "centerOfMassOffset");
  objc_msgSend(v4, "setCenterOfMassOffset:");
  -[SCNPhysicsBody continuousCollisionDetectionThreshold](self, "continuousCollisionDetectionThreshold");
  objc_msgSend(v4, "setContinuousCollisionDetectionThreshold:");
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

- (id)copy
{
  return -[SCNPhysicsBody copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_createBody
{
  float mass;
  float damping;
  float64x2_t v5;
  uint64_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int v9;
  float charge;
  float continuousCollisionDetectionThreshold;
  float32x4_t v13;
  float v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float32x4_t v25;
  float32x2_t v26;
  char v27;
  __int128 v28;

  mass = self->_mass;
  v14 = mass;
  v15 = 0;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v27 = 0;
  v28 = xmmword_1DD009410;
  v16 = xmmword_1DD007970;
  v17 = xmmword_1DD007920;
  v18 = xmmword_1DD007600;
  v19 = 0;
  damping = self->_damping;
  v24 = damping;
  v5.f64[0] = self->_angularDamping;
  v26 = vcvt_f32_f64(*(float64x2_t *)&self->_linearRestingThreshold);
  v5.f64[1] = self->_friction;
  v25 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), (float64x2_t)vextq_s8(*(int8x16_t *)&self->_restitution, *(int8x16_t *)&self->_restitution, 8uLL));
  v6 = btAlignedAllocInternal(704, 16);
  btRigidBody::btRigidBody((btCollisionObject *)v6, (uint64_t)&v14);
  __modifyCollisionFlagsFromType((btRigidBody *)v6, (SCNPhysicsBodyType)self->_type);
  v7.i64[0] = *(_QWORD *)&self->_velocity.x;
  v7.i64[1] = LODWORD(self->_velocity.z);
  *(float32x4_t *)(v6 + 352) = v7;
  v7.i64[0] = *(_QWORD *)&self->_angularVelocity.x;
  v7.i64[1] = LODWORD(self->_angularVelocity.z);
  *(float32x4_t *)(v6 + 368) = v7;
  v7.i64[0] = *(_QWORD *)&self->_velocityFactor.x;
  v7.i32[2] = LODWORD(self->_velocityFactor.z);
  v8 = vmulq_n_f32(v7, *(float *)(v6 + 384));
  v7.i32[3] = 0;
  *(float32x4_t *)(v6 + 400) = v7;
  v8.i32[3] = 0;
  *(float32x4_t *)(v6 + 640) = v8;
  v7.i64[0] = *(_QWORD *)&self->_angularVelocityFactor.x;
  v7.i64[1] = LODWORD(self->_angularVelocityFactor.z);
  *(float32x4_t *)(v6 + 624) = v7;
  if (self->_allowsResting)
    v9 = 1;
  else
    v9 = 4;
  btCollisionObject::setActivationState((btCollisionObject *)v6, v9);
  charge = self->_charge;
  *(float *)(v6 + 532) = charge;
  continuousCollisionDetectionThreshold = self->_continuousCollisionDetectionThreshold;
  *(float *)(v6 + 288) = continuousCollisionDetectionThreshold;
  if (self->_ignoreGravity)
  {
    *(_DWORD *)(v6 + 576) = 1;
    v13 = 0uLL;
    btRigidBody::setGravity((btRigidBody *)v6, &v13);
  }
  return (void *)v6;
}

- (void)_ownerWillDie
{
  self->_node = 0;
}

- (void)_removeOwner
{
  SCNNode *node;
  uint64_t v4;
  void *body;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[8];

  node = self->_node;
  v4 = objc_msgSend(-[SCNNode scene](node, "scene"), "physicsWorld");
  self->_node = 0;
  body = self->_body;
  if (body)
  {
    v6 = v4;
    v7 = -[SCNNode sceneRef](node, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__SCNPhysicsBody__removeOwner__block_invoke;
    v8[3] = &unk_1EA5A1700;
    v8[4] = node;
    v8[5] = v6;
    v8[6] = self;
    v8[7] = body;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, node, v8);
  }
}

uint64_t __30__SCNPhysicsBody__removeOwner__block_invoke(uint64_t a1)
{
  C3DNodeSetHasPhysicsBody(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), 0);
  return objc_msgSend(*(id *)(a1 + 40), "removePhysicsBody:handle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setOwner:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  void *body;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  __int128 v11;
  double mass;
  __int128 v13;
  BOOL explicitMomentOfInertia;
  SCNPhysicsShape *physicsShape;
  NSUInteger v16;
  __C3DScene *v17;
  SCNNode *node;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  BOOL isDefaultShape;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  id v32;
  SCNPhysicsBody *v33;
  SCNPhysicsShape *v34;
  uint64_t v35;
  void *v36;
  double v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  BOOL v41;
  BOOL v42;

  if (self->_node)
  {
    if (self->_body)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNPhysicsBody _setOwner:].cold.2(v5);
    }
  }
  self->_node = (SCNNode *)a3;
  v6 = objc_msgSend(a3, "nodeRef");
  body = self->_body;
  v8 = -[SCNPhysicsBody categoryBitMask](self, "categoryBitMask");
  v9 = -[SCNPhysicsBody collisionBitMask](self, "collisionBitMask");
  v10 = -[SCNPhysicsBody contactTestBitMask](self, "contactTestBitMask");
  if (self->_node)
  {
    mass = self->_mass;
    isDefaultShape = self->_isDefaultShape;
    *(_QWORD *)&v11 = *(_QWORD *)&self->_momentOfInertia.x;
    DWORD2(v11) = LODWORD(self->_momentOfInertia.z);
    v27 = v11;
    *(_QWORD *)&v13 = *(_QWORD *)&self->_centerOfMassOffset.x;
    explicitMomentOfInertia = self->_explicitMomentOfInertia;
    *((_QWORD *)&v13 + 1) = LODWORD(self->_centerOfMassOffset.z);
    v26 = v13;
    physicsShape = self->_physicsShape;
    v16 = v10;
    v17 = -[SCNPhysicsBody sceneRef](self, "sceneRef");
    node = self->_node;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3321888768;
    v29[2] = __28__SCNPhysicsBody__setOwner___block_invoke;
    v29[3] = &unk_1EA59ACB8;
    v35 = v6;
    v36 = body;
    v41 = isDefaultShape;
    v32 = a3;
    v33 = self;
    v34 = physicsShape;
    v37 = mass;
    v42 = explicitMomentOfInertia;
    v30 = v27;
    v31 = v26;
    v38 = v8;
    v39 = v9;
    v40 = v16;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v17, node, v29);
  }
  else
  {
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SCNPhysicsBody _setOwner:].cold.1((uint64_t)self, v19, v20, v21, v22, v23, v24, v25);
  }
}

uint64_t __28__SCNPhysicsBody__setOwner___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  btCollisionShape *DefaultShapeForNode;
  float v5;
  float v6;
  btQuaternion *v7;
  uint64_t v8;
  double v9;
  unsigned __int128 *v10;
  __int128 v12;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "scene"), "physicsWorld");
  C3DNodeSetHasPhysicsBody(*(_QWORD *)(a1 + 88), 1);
  v3 = *(_QWORD *)(a1 + 96);
  if (v3 && !*(_QWORD *)(v3 + 208))
  {
    if (*(_BYTE *)(a1 + 136))
      DefaultShapeForNode = C3DPhysicsShapeGetDefaultShapeForNode(*(float32x4_t **)(a1 + 88));
    else
      DefaultShapeForNode = (btCollisionShape *)objc_msgSend(*(id *)(a1 + 72), "_shapeHandleWithShape:owner:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
    v7 = (btQuaternion *)DefaultShapeForNode;
    v8 = *(_QWORD *)(a1 + 96);
    v9 = *(double *)(a1 + 104);
    if (*(_BYTE *)(a1 + 137))
      v10 = (unsigned __int128 *)(a1 + 32);
    else
      v10 = 0;
    v12 = *(_OWORD *)(a1 + 48);
    __setCollisionShape(v8, v7, v10, &v12, v9, *(float *)&v12, v5, v6);
  }
  return objc_msgSend(v2, "addPhysicsBody:nodeRef:colGroup:colMask:colTest:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
}

- (id)_owner
{
  return self->_node;
}

- (void)_didDecodeSCNPhysicsBody:(id)a3
{
  self->_body = -[SCNPhysicsBody _createBody](self, "_createBody", a3);
}

- (void)encodeWithCoder:(id)a3
{
  SCNPhysicsShape *physicsShape;

  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mass"), self->_mass);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("charge"), self->_charge);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("friction"), self->_friction);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("restitution"), self->_restitution);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("rollingFriction"), self->_rollingFriction);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("ccdThreshold"), self->_continuousCollisionDetectionThreshold);
  physicsShape = self->_physicsShape;
  if (physicsShape)
    objc_msgSend(a3, "encodeObject:forKey:", physicsShape, CFSTR("physicsShape"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("damping"), self->_damping);
  SCNEncodeVector4(a3, (uint64_t)CFSTR("angularVelocity"), self->_angularVelocity.x, self->_angularVelocity.y, self->_angularVelocity.z, self->_angularVelocity.w);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("angularDamping"), self->_angularDamping);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("linearRestingThreshold"), self->_linearRestingThreshold);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("angularRestingThreshold"), self->_angularRestingThreshold);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("velocityFactor"), self->_velocityFactor.x, self->_velocityFactor.y, self->_velocityFactor.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("angularVelocityFactor"), self->_angularVelocityFactor.x, self->_angularVelocityFactor.y, self->_angularVelocityFactor.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("velocity"), self->_velocity.x, self->_velocity.y, self->_velocity.z);
  objc_msgSend(a3, "encodeBool:forKey:", self->_ignoreGravity, CFSTR("ignoreGravity"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_explicitMomentOfInertia, CFSTR("explicitMomentOfInertia"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("momentOfInertia"), self->_momentOfInertia.x, self->_momentOfInertia.y, self->_momentOfInertia.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("centerOfMassOffset"), self->_centerOfMassOffset.x, self->_centerOfMassOffset.y, self->_centerOfMassOffset.z);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_categoryBitMask, CFSTR("categoryBitMask"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_collisionBitMask, CFSTR("collisionBitMask"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_contactTestBitMask, CFSTR("contactTestBitMask"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_allowsResting, CFSTR("allowsResting"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isDefaultShape, CFSTR("isDefaultShape"));
}

- (SCNPhysicsBody)initWithCoder:(id)a3
{
  SCNPhysicsBody *v4;
  _BOOL8 v5;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNPhysicsBody;
  v4 = -[SCNPhysicsBody init](&v15, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("charge"));
    -[SCNPhysicsBody setCharge:](v4, "setCharge:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("friction"));
    -[SCNPhysicsBody setFriction:](v4, "setFriction:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("restitution"));
    -[SCNPhysicsBody setRestitution:](v4, "setRestitution:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("rollingFriction"));
    -[SCNPhysicsBody setRollingFriction:](v4, "setRollingFriction:");
    -[SCNPhysicsBody setPhysicsShape:](v4, "setPhysicsShape:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicsShape")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ccdThreshold")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("ccdThreshold"));
      -[SCNPhysicsBody setContinuousCollisionDetectionThreshold:](v4, "setContinuousCollisionDetectionThreshold:");
    }
    -[SCNPhysicsBody setType:](v4, "setType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mass"));
    -[SCNPhysicsBody setMass:](v4, "setMass:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("damping"));
    -[SCNPhysicsBody setDamping:](v4, "setDamping:");
    *(float *)&v6 = SCNDecodeVector4(a3, (uint64_t)CFSTR("angularVelocity"));
    -[SCNPhysicsBody setAngularVelocity:](v4, "setAngularVelocity:", v6);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("angularDamping"));
    -[SCNPhysicsBody setAngularDamping:](v4, "setAngularDamping:");
    v7 = CFSTR("linearRestingThreshold");
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("linearRestingThreshold")) & 1) != 0
      || (v7 = CFSTR("linearSleepingThreshold"),
          objc_msgSend(a3, "containsValueForKey:", CFSTR("linearSleepingThreshold"))))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", v7);
      -[SCNPhysicsBody setLinearRestingThreshold:](v4, "setLinearRestingThreshold:");
    }
    v8 = CFSTR("angularRestingThreshold");
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("angularRestingThreshold")) & 1) != 0
      || (v8 = CFSTR("angularSleepingThreshold"),
          objc_msgSend(a3, "containsValueForKey:", CFSTR("angularSleepingThreshold"))))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", v8);
      -[SCNPhysicsBody setAngularRestingThreshold:](v4, "setAngularRestingThreshold:");
    }
    *(float *)&v9 = SCNDecodeVector3(a3, (uint64_t)CFSTR("velocityFactor"));
    -[SCNPhysicsBody setVelocityFactor:](v4, "setVelocityFactor:", v9);
    *(float *)&v10 = SCNDecodeVector3(a3, (uint64_t)CFSTR("angularVelocityFactor"));
    -[SCNPhysicsBody setAngularVelocityFactor:](v4, "setAngularVelocityFactor:", v10);
    *(float *)&v11 = SCNDecodeVector3(a3, (uint64_t)CFSTR("velocity"));
    -[SCNPhysicsBody setVelocity:](v4, "setVelocity:", v11);
    -[SCNPhysicsBody setAffectedByGravity:](v4, "setAffectedByGravity:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ignoreGravity")) ^ 1);
    -[SCNPhysicsBody setUsesDefaultMomentOfInertia:](v4, "setUsesDefaultMomentOfInertia:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("explicitMomentOfInertia")) ^ 1);
    *(float *)&v12 = SCNDecodeVector3(a3, (uint64_t)CFSTR("momentOfInertia"));
    -[SCNPhysicsBody setMomentOfInertia:](v4, "setMomentOfInertia:", v12);
    *(float *)&v13 = SCNDecodeVector3(a3, (uint64_t)CFSTR("centerOfMassOffset"));
    -[SCNPhysicsBody setCenterOfMassOffset:](v4, "setCenterOfMassOffset:", v13);
    -[SCNPhysicsBody setCategoryBitMask:](v4, "setCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("categoryBitMask")));
    -[SCNPhysicsBody setCollisionBitMask:](v4, "setCollisionBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("collisionBitMask")));
    -[SCNPhysicsBody setContactTestBitMask:](v4, "setContactTestBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("contactTestBitMask")));
    -[SCNPhysicsBody setAllowsResting:](v4, "setAllowsResting:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsResting")));
    v4->_isDefaultShape = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isDefaultShape"));
    -[SCNPhysicsBody _didDecodeSCNPhysicsBody:](v4, "_didDecodeSCNPhysicsBody:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGFloat)continuousCollisionDetectionThreshold
{
  return self->_continuousCollisionDetectionThreshold;
}

void __34__SCNPhysicsBody_setPhysicsShape___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: unable to update the physics shape of %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot apply force on a body that is not attached to a SCNNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __32__SCNPhysicsBody_clearAllForces__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot clear forces on a body that is not attached to a SCNNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setOwner:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: cannot attach a body to a null node %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_setOwner:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "!_node || _body == 0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. SCNPhysicsBody is already attached to a SCNNode", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
