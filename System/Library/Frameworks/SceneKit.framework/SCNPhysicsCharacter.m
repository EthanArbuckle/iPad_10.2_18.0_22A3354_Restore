@implementation SCNPhysicsCharacter

- (SCNPhysicsCharacter)initWithCharacter:(id)a3
{
  SCNPhysicsCharacter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNPhysicsCharacter;
  v4 = -[SCNPhysicsCharacter init](&v6, sel_init);
  if (v4)
  {
    v4->_definition.characterBody = (SCNPhysicsBody *)a3;
    v4->_definition.velocity = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  btCharacterControllerInterface *characterController;
  void *ghostObject;
  btOverlapFilterCallback *filterCallback;
  btCapsuleShape *capsuleShape;
  objc_super v7;

  characterController = self->_characterController;
  if (characterController)
    (*((void (**)(btCharacterControllerInterface *))characterController->var0 + 1))(characterController);
  ghostObject = self->_ghostObject;
  if (ghostObject)
    (*(void (**)(void *))(*(_QWORD *)ghostObject + 16))(ghostObject);
  filterCallback = self->_filterCallback;
  if (filterCallback)
    (*((void (**)(btOverlapFilterCallback *))filterCallback->var0 + 1))(filterCallback);
  capsuleShape = self->_capsuleShape;
  if (capsuleShape)
    (*((void (**)(btCapsuleShape *))capsuleShape->var0 + 1))(capsuleShape);
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsCharacter;
  -[SCNPhysicsCharacter dealloc](&v7, sel_dealloc);
}

- (void)setWalkingDirection:(SCNVector3)a3
{
  double velocity;
  float y;
  __int128 v5;
  unsigned int v6;
  SCNPhysicsWorld *world;
  _QWORD v8[4];
  __int128 v9;
  SCNPhysicsCharacter *v10;

  self->_definition.direction = a3;
  velocity = self->_definition.velocity;
  y = a3.y;
  *(float32x2_t *)&v5 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&a3.x), velocity));
  *(float *)&v6 = velocity * a3.z;
  *((_QWORD *)&v5 + 1) = v6;
  world = self->_world;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __43__SCNPhysicsCharacter_setWalkingDirection___block_invoke;
  v8[3] = &unk_1EA59AD20;
  v10 = self;
  v9 = v5;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v8);
}

uint64_t __43__SCNPhysicsCharacter_setWalkingDirection___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 48);
  if (v1)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)v1 + 32))(*(_QWORD *)(*(_QWORD *)(result + 48) + 48), result + 32);
  return result;
}

- (BOOL)canJump
{
  -[SCNPhysicsWorld _postCommandWithBlock:](self->_world, "_postCommandWithBlock:", &__block_literal_global_32);
  return 0;
}

- (void)jump
{
  SCNPhysicsWorld *world;
  _QWORD v3[5];

  world = self->_world;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SCNPhysicsCharacter_jump__block_invoke;
  v3[3] = &unk_1EA59E4A0;
  v3[4] = self;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v3);
}

uint64_t __27__SCNPhysicsCharacter_jump__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 88))(result);
  return result;
}

- (void)setVelocity:(double)a3
{
  __int128 v3;
  unsigned int v4;
  SCNPhysicsWorld *world;
  _QWORD v6[4];
  __int128 v7;
  SCNPhysicsCharacter *v8;

  self->_definition.velocity = a3;
  *(float32x2_t *)&v3 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_definition.direction.x), a3));
  *(float *)&v4 = self->_definition.direction.z * a3;
  *((_QWORD *)&v3 + 1) = v4;
  world = self->_world;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __35__SCNPhysicsCharacter_setVelocity___block_invoke;
  v6[3] = &unk_1EA59AD20;
  v8 = self;
  v7 = v3;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v6);
}

uint64_t __35__SCNPhysicsCharacter_setVelocity___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 48);
  if (v1)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)v1 + 32))(*(_QWORD *)(*(_QWORD *)(result + 48) + 48), result + 32);
  return result;
}

- (double)velocity
{
  return self->_definition.velocity;
}

- (void)setJumpSpeed:(double)a3
{
  SCNPhysicsWorld *world;
  _QWORD v4[5];

  self->_definition.jumpSpeed = a3;
  world = self->_world;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsCharacter_setJumpSpeed___block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v4);
}

- (double)jumpSpeed
{
  return self->_definition.jumpSpeed;
}

- (void)_update
{
  id v3;
  int8x16_t *ghostObject;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int32x2_t v9;
  __int32 v10;
  int v11;
  int32x2_t v12;
  __int32 v13;
  int v14;
  int32x2_t v15;
  uint64_t v16;
  uint64_t v17;
  __int32 v18;
  int v19;

  v3 = -[SCNPhysicsBody _owner](self->_definition.characterBody, "_owner");
  ghostObject = (int8x16_t *)self->_ghostObject;
  v5 = ghostObject[1];
  v6 = ghostObject[2];
  v7 = ghostObject[3];
  v8 = ghostObject[4];
  v9 = vzip1_s32(*(int32x2_t *)v5.i8, *(int32x2_t *)v6.i8);
  v10 = v7.i32[0];
  v11 = 0;
  v12 = vzip2_s32(*(int32x2_t *)v5.i8, *(int32x2_t *)v6.i8);
  v13 = v7.i32[1];
  v14 = 0;
  v15 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  v16 = vextq_s8(v7, v7, 8uLL).u32[0];
  v17 = v8.i64[0];
  v18 = v8.i32[2];
  v19 = 1065353216;
  objc_msgSend(v3, "setWorldTransform:", &v9);
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  SCNPhysicsWorld *world;
  BOOL v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;

  world = self->_world;
  if (world)
    v7 = world == a3;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:].cold.1(v8);
  }
  self->_world = (SCNPhysicsWorld *)a3;
  -[SCNPhysicsCharacter _handleCreateIfNeeded:](self, "_handleCreateIfNeeded:", 1);
  v9 = -[SCNPhysicsWorld _handle](self->_world, "_handle");
  if (self->_characterController)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = v9;
    (*(void (**)(void *))(*(_QWORD *)v9 + 264))(v9);
    if (self->_ghostObject)
    {
      -[SCNPhysicsWorld _allowGhostObjects](self->_world, "_allowGhostObjects");
      (*(void (**)(void *, void *, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v11 + 72))(v11, self->_ghostObject, 32, 3, 0);
    }
  }
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  self->_world = 0;
}

- (void)_handleCreateIfNeeded:(BOOL)a3
{
  btCollisionObject *v4;
  btCollisionObject *v5;
  uint64_t v6;
  NSObject *v12;
  btPairCachingGhostObject *v13;
  btCapsuleShape *v14;
  float v15;
  float v16;
  btOverlapFilterCallback *v17;
  void **ghostObject;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  float v23[4];
  float v24[4];
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (a3 && !self->_characterController)
  {
    v4 = -[SCNPhysicsBody _handle](self->_definition.characterBody, "_handle");
    if (v4)
    {
      v5 = v4;
      btCollisionObject::setActivationState(v4, 4);
      if ((*((_BYTE *)v5 + 232) & 2) != 0)
      {
        v21 = *((_OWORD *)v5 + 2);
        *(_OWORD *)buf = *((_OWORD *)v5 + 1);
        v22 = *(_OWORD *)buf;
        v26 = v21;
        v19 = *((_OWORD *)v5 + 4);
        v27 = *((_OWORD *)v5 + 3);
        v20 = v27;
        v28 = v19;
        v13 = (btPairCachingGhostObject *)btAlignedAllocInternal(336, 16);
        btPairCachingGhostObject::btPairCachingGhostObject(v13);
        self->_ghostObject = v13;
        *((_OWORD *)v13 + 1) = v22;
        *((_OWORD *)v13 + 2) = v21;
        *((_OWORD *)v13 + 3) = v20;
        *((_OWORD *)v13 + 4) = v19;
        v14 = (btCapsuleShape *)*((_QWORD *)v5 + 26);
        if (v14->var1 != 10)
        {
          (*((void (**)(_QWORD, uint8_t *, float *, float *))v14->var0 + 2))(*((_QWORD *)v5 + 26), buf, v24, v23);
          v15 = v23[1] - v24[1];
          v16 = v23[0] - v24[0];
          v14 = (btCapsuleShape *)btAlignedAllocInternal(80, 16);
          btCapsuleShape::btCapsuleShape(v14, v16, v15);
          self->_capsuleShape = v14;
        }
        (*(void (**)(void *, btCapsuleShape *))(*(_QWORD *)self->_ghostObject + 24))(self->_ghostObject, v14);
        *((_DWORD *)self->_ghostObject + 58) = 16;
        v17 = (btOverlapFilterCallback *)operator new();
        ghostObject = (void **)self->_ghostObject;
        v17->var0 = (void **)&off_1EA597EE8;
        v17[1].var0 = (void **)v5;
        self->_filterCallback = v17;
        v17[2].var0 = ghostObject;
        (*(void (**)(_QWORD, btOverlapFilterCallback *))(**((_QWORD **)self->_ghostObject + 41) + 88))(*((_QWORD *)self->_ghostObject + 41), v17);
        v6 = btAlignedAllocInternal(240, 16);
        btKinematicCharacterController::btKinematicCharacterController(v6, (uint64_t)self->_ghostObject, (uint64_t)v14, 1, 0.35);
        btKinematicCharacterController::setGravity(v6, 9.8);
      }
      else
      {
        v6 = operator new();
        *(_QWORD *)v6 = &off_1EA597FE8;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)(v6 + 96) = _D0;
        *(_DWORD *)(v6 + 8) = 1065353216;
        *(_OWORD *)(v6 + 144) = xmmword_1DD0093E0;
        *(_QWORD *)(v6 + 16) = 0;
        *(_QWORD *)(v6 + 24) = 0;
        btC3DDynamicCharacterController::setup((btC3DDynamicCharacterController *)v6, 2.0, 0.25, 0.25);
      }
      self->_characterController = (btCharacterControllerInterface *)v6;
    }
    else
    {
      v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCCB8000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Character should already have a body", buf, 2u);
      }
    }
  }
}

@end
