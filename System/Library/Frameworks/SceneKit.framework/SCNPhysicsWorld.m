@implementation SCNPhysicsWorld

- (void)_preTick:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  float elapsedTime;
  float32x4_t v12;
  uint64_t v13;
  void *v14;
  char v15;

  self->_elapsedTime = self->_elapsedTime + a3;
  if (self->_hasActiveFields)
  {
    btAlignedObjectArray<btRigidBody *>::btAlignedObjectArray((uint64_t)&v13, (uint64_t)self->_world + 320);
    if (SHIDWORD(v13) >= 1)
    {
      v4 = 0;
      v5 = 8 * HIDWORD(v13);
      do
      {
        v6 = *(_QWORD *)((char *)v14 + v4);
        v7 = *(_DWORD *)(v6 + 244);
        if (v7 != 2 && v7 != 5)
        {
          v9 = *(_QWORD *)(v6 + 200);
          if (v9)
            v10 = *(_QWORD *)(v9 + 8);
          else
            LODWORD(v10) = -1;
          elapsedTime = self->_elapsedTime;
          c3dAether::evalForce((uint64_t)&self->_aether, v10, *(__n128 *)(v6 + 64), *(__n128 *)(v6 + 352), 1.0 / *(float *)(v6 + 384), *(float *)(v6 + 532), elapsedTime);
          v12.i32[3] = 0;
          *(float32x4_t *)(v6 + 464) = vaddq_f32(*(float32x4_t *)(v6 + 464), vmulq_f32(v12, *(float32x4_t *)(v6 + 400)));
        }
        v4 += 8;
      }
      while (v5 != v4);
    }
    if (v14)
    {
      if (v15)
        btAlignedFreeInternal((void **)v14);
    }
  }
}

- (void)_createDynamicWorldIfNeeded
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  btSequentialImpulseConstraintSolver *v7;
  btC3DDebugDraw *v8;
  float scale;
  float *v10;
  float v11;
  id Weak;
  uint64_t v13;
  float z;
  int v15;
  _QWORD v16[2];
  __int128 v17;

  if (!self->_world)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_world)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v16[0] = 0;
      v16[1] = 0;
      v17 = xmmword_1DD02A720;
      v4 = operator new();
      btDefaultCollisionConfiguration::btDefaultCollisionConfiguration(v4, v16);
      v5 = operator new();
      btC3DCollisionDispatcher::btC3DCollisionDispatcher(v5, v4, (uint64_t)self);
      v6 = operator new();
      btDbvtBroadphase::btDbvtBroadphase(v6, 0);
      v7 = (btSequentialImpulseConstraintSolver *)btAlignedAllocInternal(320, 16);
      btSequentialImpulseConstraintSolver::btSequentialImpulseConstraintSolver(v7);
      v8 = (btC3DDebugDraw *)operator new();
      v8->var0 = (void **)&off_1EA595A38;
      v8->var1 = 6157;
      v8->var3 = 0;
      self->_debugDrawer = v8;
      scale = self->_scale;
      v8->var2 = 1.0 / scale;
      v10 = (float *)btAlignedAllocInternal(464, 16);
      btDiscreteDynamicsWorld::btDiscreteDynamicsWorld(v10, v5, v6, v7, v4);
      *((_QWORD *)v10 + 16) = __preTickCallback;
      *((_QWORD *)v10 + 17) = self;
      v13 = *(_QWORD *)&self->_gravity.x;
      z = self->_gravity.z;
      v15 = 0;
      (*(void (**)(float *, uint64_t *))(*(_QWORD *)v10 + 144))(v10, &v13);
      v11 = self->_scale;
      v10[57] = v11;
      Weak = objc_loadWeak((id *)&self->_contactDelegate);
      if (Weak)
        btC3DCollisionDispatcher::setDelegate(*((_QWORD *)v10 + 5), (uint64_t)Weak);
      self->_world = v10;
      os_unfair_lock_unlock(p_lock);
      -[SCNPhysicsWorld _allowGhostObjects](self, "_allowGhostObjects");
    }
  }
}

- (id)_physicsContact
{
  id result;

  result = self->_contact;
  if (!result)
  {
    result = objc_alloc_init(SCNPhysicsContact);
    self->_contact = (SCNPhysicsContact *)result;
  }
  return result;
}

- (void)commonInit
{
  if (-[SCNPhysicsWorld commonInit]::onceToken != -1)
    dispatch_once(&-[SCNPhysicsWorld commonInit]::onceToken, &__block_literal_global_67);
  self->_lock._os_unfair_lock_opaque = 0;
  self->_bodies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
}

void __29__SCNPhysicsWorld_commonInit__block_invoke()
{
  gContactAddedCallback = btC3DSupportInternalEdgesCustomCallback;
}

- (SCNPhysicsWorld)initWithScene:(id)a3
{
  SCNPhysicsWorld *v4;
  SCNPhysicsWorld *v5;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCNPhysicsWorld;
  v4 = -[SCNPhysicsWorld init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SCNPhysicsWorld commonInit](v4, "commonInit");
    *(_QWORD *)&v5->_gravity.x = 0xC11CCCCD00000000;
    v5->_gravity.z = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v5->_speed = _Q0;
    v5->_timeStep = 0.0166666667;
    v5->_scene = (SCNScene *)a3;
  }
  return v5;
}

- (void)dealloc
{
  NSMutableArray *behaviors;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableSet *bodies;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  btVehicleRaycaster *vehicleRayCaster;
  btC3DDebugDraw *debugDrawer;
  _QWORD *world;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  btOverlappingPairCallback *ghostPairCallback;
  void *v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  behaviors = self->_behaviors;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __26__SCNPhysicsWorld_dealloc__block_invoke;
  v34[3] = &unk_1EA59E670;
  v34[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](behaviors, "enumerateObjectsUsingBlock:", v34);
  v4 = (id)-[NSMutableArray copy](self->_fields, "copy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_willRemoveFromPhysicsWorld");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }
  if (self->_world)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    bodies = self->_bodies;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(bodies);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "_handle");
          if (v14)
            (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_world + 184))(self->_world, v14);
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v11);
    }
  }

  vehicleRayCaster = self->_vehicleRayCaster;
  if (vehicleRayCaster)
    (*((void (**)(btVehicleRaycaster *))vehicleRayCaster->var0 + 1))(vehicleRayCaster);
  debugDrawer = self->_debugDrawer;
  if (debugDrawer)
    (*((void (**)(btC3DDebugDraw *))debugDrawer->var0 + 1))(debugDrawer);
  world = self->_world;
  if (world)
  {
    v18 = (_QWORD *)world[5];
    v19 = v18[1311];
    v20 = world[12];
    v21 = (*(uint64_t (**)(_QWORD *))(*world + 200))(world);
    if (self->_ghostPairCallback)
    {
      v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 72))(v20);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v22 + 120))(v22, 0);
      ghostPairCallback = self->_ghostPairCallback;
      if (ghostPairCallback)
        (*((void (**)(btOverlappingPairCallback *))ghostPairCallback->var0 + 1))(ghostPairCallback);
      self->_ghostPairCallback = 0;
    }
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    (*(void (**)(_QWORD *))(*v18 + 8))(v18);
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
    v24 = self->_world;
    if (v24)
      (*(void (**)(void *))(*(_QWORD *)v24 + 8))(v24);
  }
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v25.receiver = self;
  v25.super_class = (Class)SCNPhysicsWorld;
  -[SCNPhysicsWorld dealloc](&v25, sel_dealloc);
}

uint64_t __26__SCNPhysicsWorld_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_willRemoveFromPhysicsWorld:", *(_QWORD *)(a1 + 32));
}

- (void)sceneWillDie
{
  void *world;
  void **v3;

  self->_scene = 0;
  world = self->_world;
  if (world)
  {
    v3 = (void **)*((_QWORD *)world + 3);
    if (v3)
    {
      if (*((_BYTE *)world + 32))
        btAlignedFreeInternal(v3);
    }
    *((_BYTE *)world + 32) = 1;
    *((_QWORD *)world + 3) = 0;
    *((_DWORD *)world + 3) = 0;
    *((_DWORD *)world + 4) = 0;
  }
}

- (BOOL)_isDefault
{
  _BOOL4 v3;
  SCNVector3 v5;

  v5.y = -9.8;
  v5.x = 0.0;
  v5.z = 0.0;
  v3 = SCNVector3EqualToVector3(self->_gravity, v5);
  if (v3)
    LOBYTE(v3) = self->_speed == 1.0
              && self->_scale == 1.0
              && self->_timeStep == 0.0166666667
              && -[NSMutableArray count](self->_behaviors, "count") == 0;
  return v3;
}

- (void)wakeUpAllBodies
{
  btCollisionObject *world;

  world = (btCollisionObject *)self->_world;
  if (world)
    btDiscreteDynamicsWorld::activateAllBodies(world);
}

- (void)setGravity:(SCNVector3)gravity
{
  _QWORD v3[5];
  SCNVector3 v4;

  self->_gravity = gravity;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SCNPhysicsWorld_setGravity___block_invoke;
  v3[3] = &unk_1EA59E4C8;
  v3[4] = self;
  v4 = gravity;
  -[SCNPhysicsWorld _postCommandWithBlock:](self, "_postCommandWithBlock:", v3);
}

uint64_t __30__SCNPhysicsWorld_setGravity___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_DWORD *)(a1 + 48);
    v5 = 0;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 144))(result, &v3);
    return objc_msgSend(*(id *)(a1 + 32), "wakeUpAllBodies");
  }
  return result;
}

- (SCNVector3)gravity
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSpeed:(CGFloat)speed
{
  self->_speed = speed;
}

- (CGFloat)speed
{
  return self->_speed;
}

- (void)setScale:(double)a3
{
  uint64_t v5;
  btC3DDebugDraw *debugDrawer;
  float scale;
  _QWORD v8[5];
  _QWORD v9[6];

  if (self->_scale != a3)
  {
    self->_scale = a3;
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__SCNPhysicsWorld_setScale___block_invoke;
    v9[3] = &unk_1EA59E450;
    v9[4] = self;
    *(double *)&v9[5] = a3;
    -[SCNPhysicsWorld _postCommandWithBlock:](self, "_postCommandWithBlock:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __28__SCNPhysicsWorld_setScale___block_invoke_2;
    v8[3] = &__block_descriptor_40_e28_v24__0__SCNPhysicsBody_8_B16l;
    *(double *)&v8[4] = a3;
    -[SCNPhysicsWorld enumerateBodiesUsingBlock:](self, "enumerateBodiesUsingBlock:", v8);
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      scale = self->_scale;
      debugDrawer->var2 = 1.0 / scale;
    }
  }
}

float __28__SCNPhysicsWorld_setScale___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 228) = result;
  }
  return result;
}

uint64_t __28__SCNPhysicsWorld_setScale___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateGlobalScale:", *(double *)(a1 + 32));
}

- (double)scale
{
  return self->_scale;
}

- (void)setTimeStep:(NSTimeInterval)timeStep
{
  self->_timeStep = timeStep;
}

- (NSTimeInterval)timeStep
{
  return self->_timeStep;
}

- (id)contactDelegate
{
  return objc_loadWeak((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)contactDelegate
{
  SCNPhysicsContactDelegate **p_contactDelegate;
  _QWORD v6[6];

  p_contactDelegate = &self->_contactDelegate;
  if (objc_loadWeak((id *)&self->_contactDelegate) != contactDelegate)
    objc_storeWeak((id *)p_contactDelegate, contactDelegate);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsWorld_setContactDelegate___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = contactDelegate;
  -[SCNPhysicsWorld _postCommandWithBlock:](self, "_postCommandWithBlock:", v6);
}

uint64_t __38__SCNPhysicsWorld_setContactDelegate___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1)
    return btC3DCollisionDispatcher::setDelegate(*(_QWORD *)(v1 + 40), *(_QWORD *)(result + 40));
  return result;
}

- (void)addBehavior:(SCNPhysicsBehavior *)behavior
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *behaviors;
  _QWORD v7[6];
  _BYTE v8[296];
  _BYTE __src[296];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  behaviors = self->_behaviors;
  if (!behaviors)
  {
    behaviors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_behaviors = behaviors;
  }
  -[NSMutableArray addObject:](behaviors, "addObject:", behavior);
  self->_activeBehaviorsValid = 0;
  os_unfair_lock_unlock(p_lock);
  -[SCNPhysicsBehavior _copyDefinition:](behavior, "_copyDefinition:", __src);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SCNPhysicsWorld_addBehavior___block_invoke;
  v7[3] = &unk_1EA5A1EE0;
  v7[4] = behavior;
  v7[5] = self;
  memcpy(v8, __src, sizeof(v8));
  -[SCNPhysicsWorld _postCommandWithBlock:](self, "_postCommandWithBlock:", v7);
}

uint64_t __31__SCNPhysicsWorld_addBehavior___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BYTE v5[296];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  memcpy(v5, (const void *)(a1 + 48), sizeof(v5));
  objc_msgSend(v2, "_addToPhysicsWorld:definition:", v3, v5);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyA"), "_activate");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyB"), "_activate");
}

- (id)removeBehavior_unsafe:(id *)result
{
  id *v3;
  _QWORD v4[6];

  if (result)
  {
    v3 = result;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__SCNPhysicsWorld_removeBehavior_unsafe___block_invoke;
    v4[3] = &unk_1EA59F740;
    v4[4] = a2;
    v4[5] = result;
    objc_msgSend(result, "_postCommandWithBlock:", v4);
    result = (id *)objc_msgSend(v3[23], "removeObject:", a2);
    *((_BYTE *)v3 + 200) = 0;
  }
  return result;
}

uint64_t __41__SCNPhysicsWorld_removeBehavior_unsafe___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_willRemoveFromPhysicsWorld:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyA"), "_activate");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyB"), "_activate");
}

- (void)removeBehavior:(SCNPhysicsBehavior *)behavior
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, (uint64_t)behavior);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllBehaviors
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_behaviors, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)objectInAllBehaviorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_behaviors, "objectAtIndexedSubscript:", a3);
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v8 = objc_msgSend(a3, "rangeOfString:", CFSTR("["), a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = v8;
  v10 = v8 + 1;
  if (v8 + 1 >= (unint64_t)objc_msgSend(a3, "length"))
    return 0;
  v11 = objc_msgSend(a3, "substringToIndex:", v9);
  v12 = (void *)objc_msgSend(a3, "substringFromIndex:", v10);
  v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("]"));
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v14 = objc_msgSend((id)objc_msgSend(v12, "substringToIndex:", v13), "intValue");
  v15 = (void *)-[SCNPhysicsWorld valueForKey:](self, "valueForKey:", v11);
  if (objc_msgSend(v15, "count") <= (unint64_t)v14)
    return 0;
  *a5 = (id)objc_msgSend(v15, "objectAtIndex:", v14);
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;
  void *v7;

  v7 = 0;
  if (-[SCNPhysicsWorld parseSpecialKey:withPath:intoDestination:](self, "parseSpecialKey:withPath:intoDestination:", a3, a3, &v7))
  {
    return v7;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNPhysicsWorld;
  return -[SCNPhysicsWorld valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (NSArray)allBehaviors
{
  if (self->_behaviors)
    return &self->_behaviors->super;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)rayTestWithSegmentFromPoint:(SCNVector3)origin toPoint:(SCNVector3)dest options:(NSDictionary *)options
{
  __int128 v5;
  __int128 v6;
  NSArray *result;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v5 = *(_QWORD *)&origin.x;
  *((_QWORD *)&v5 + 1) = LODWORD(origin.z);
  *(_QWORD *)&v6 = *(_QWORD *)&dest.x;
  *((_QWORD *)&v6 + 1) = LODWORD(dest.z);
  v8 = v6;
  v9 = v5;
  result = -[SCNPhysicsWorld _rayTestWithSegmentFromPoint:toPoint:options:](self, "_rayTestWithSegmentFromPoint:toPoint:options:", &v9, &v8, options);
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5
{
  __int128 *v5;
  void *v6;
  void *v7;
  __int128 *v8;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t i;
  SCNHitTestResult *v23;
  SCNHitTestResult *v24;
  char v25;
  void (**v27)(btC3DRayResultCallback *__hidden);
  uint64_t v28;
  btCollisionObject *v29;
  __int128 v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  int v35;
  float32x4_t v36;
  float32x4_t v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  char v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  char v49;

  v7 = v6;
  v8 = v5;
  v11 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene", *(double *)a3.var0.var0, *(double *)&a3.var0.var0[1], *(double *)&a3.var0.var0[2], *(double *)&a3.var0.var0[3], *(double *)a4.var0.var0, *(double *)&a4.var0.var0[1], *(double *)&a4.var0.var0[2], *(double *)&a4.var0.var0[3]), "sceneRef");
  if (!v11 || !self->_world)
    return 0;
  v12 = v11;
  LODWORD(v28) = 1065353216;
  v29 = 0;
  v32 = 0;
  v27 = &off_1EA5972E0;
  v13 = *v8;
  v33 = *(_OWORD *)a5;
  v34 = v13;
  v40 = 1;
  v39 = 0;
  v38 = 0;
  v43 = 1;
  v42 = 0;
  v41 = 0;
  v46 = 1;
  v45 = 0;
  v44 = 0;
  v49 = 1;
  v48 = 0;
  v47 = 0;
  *(_QWORD *)&v14 = -1;
  *((_QWORD *)&v14 + 1) = -1;
  v30 = v14;
  v31 = 0;
  v15 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("backfaceCulling"), &off_1EA5972E0, v28);
  if (!v15 || objc_msgSend(v15, "BOOLValue"))
    v32 |= 1u;
  v16 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("results"));
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("all")) & 1) != 0)
    v17 = 2;
  else
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("closest")) ^ 1;
  v35 = v17;
  v18 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("collisionBitMask"));
  if (v18)
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
  else
    v19 = -1;
  *((_QWORD *)&v30 + 1) = v19;
  C3DSceneLock(v12);
  (*(void (**)(void *, id, __int128 *, void (***)(btC3DRayResultCallback *__hidden)))(*(_QWORD *)self->_world + 64))(self->_world, a5, v8, &v27);
  C3DSceneUnlock(v12);
  if (v35 == 2)
  {
    v20 = v38;
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v38);
    if (v20 >= 1)
    {
      for (i = 0; i != v20; ++i)
      {
        v23 = _hitTestResult(*((const btCollisionObject **)v39 + i), (float32x4_t *)v45 + i, (float32x4_t *)v42 + i);
        if (v23)
          objc_msgSend(v21, "addObject:", v23);
      }
    }
  }
  else
  {
    v24 = _hitTestResult(v29, &v37, &v36);
    if (!v24)
    {
      v21 = 0;
      v25 = 0;
      goto LABEL_22;
    }
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v24);
  }
  v25 = 1;
LABEL_22:
  v27 = &off_1EA5972E0;
  if (v48 && v49)
    btAlignedFreeInternal((void **)v48);
  v49 = 1;
  v48 = 0;
  v47 = 0;
  if (v45 && v46)
    btAlignedFreeInternal((void **)v45);
  v46 = 1;
  v45 = 0;
  v44 = 0;
  if (v42 && v43)
    btAlignedFreeInternal((void **)v42);
  v43 = 1;
  v42 = 0;
  v41 = 0;
  if (v39 && v40)
    btAlignedFreeInternal((void **)v39);
  if ((v25 & 1) == 0)
    return 0;
  return v21;
}

- (NSArray)contactTestBetweenBody:(SCNPhysicsBody *)bodyA andBody:(SCNPhysicsBody *)bodyB options:(NSDictionary *)options
{
  uint64_t v9;
  NSArray *world;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v17)(btC3DContactResultCallback *__hidden);
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  NSArray *v21;

  v9 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (v9)
  {
    world = (NSArray *)self->_world;
    if (world)
    {
      v11 = v9;
      v12 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("collisionBitMask"));
      if (v12)
        v13 = objc_msgSend(v12, "unsignedIntegerValue");
      else
        v13 = -1;
      v17 = &off_1EA597C60;
      v18 = xmmword_1DD009420;
      v19 = xmmword_1DD008320;
      v20 = v13;
      v21 = 0;
      C3DSceneLock(v11);
      v14 = -[SCNPhysicsBody _handle](bodyA, "_handle");
      v15 = -[SCNPhysicsBody _handle](bodyB, "_handle");
      if (v14 && v15)
        btCollisionWorld::contactPairTest((uint64_t)self->_world, (uint64_t)v14, (uint64_t)v15, (uint64_t)&v17);
      C3DSceneUnlock(v11);
      world = v21;
    }
  }
  else
  {
    world = 0;
  }
  if (world)
    return world;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)contactTestWithBody:(SCNPhysicsBody *)body options:(NSDictionary *)options
{
  uint64_t v7;
  NSArray *world;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void (**v14)(btC3DContactResultCallback *__hidden);
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  NSArray *v18;

  v7 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (v7)
  {
    world = (NSArray *)self->_world;
    if (world)
    {
      v9 = v7;
      v10 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("collisionBitMask"));
      if (v10)
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
      else
        v11 = -1;
      v14 = &off_1EA597C60;
      v15 = xmmword_1DD009420;
      v16 = xmmword_1DD008320;
      v17 = v11;
      v18 = 0;
      C3DSceneLock(v9);
      v12 = -[SCNPhysicsBody _handle](body, "_handle");
      if (v12)
        btCollisionWorld::contactTest((uint64_t)self->_world, (uint64_t)v12, (uint64_t)&v14);
      C3DSceneUnlock(v9);
      world = v18;
    }
  }
  else
  {
    world = 0;
  }
  if (world)
    return world;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)convexSweepTestWithShape:(SCNPhysicsShape *)shape fromTransform:(SCNMatrix4 *)from toTransform:(SCNMatrix4 *)to options:(NSDictionary *)options
{
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  id v14;
  float v15;
  float v16;
  id v17;
  uint64_t v18;
  id v19;
  int v20;
  btCollisionShape *v21;
  float m12;
  float m13;
  float m21;
  float m22;
  float m23;
  float m31;
  float m32;
  float m33;
  float m43;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  NSArray *v40;
  NSObject *v41;
  void *v43;
  _DWORD v44[12];
  __int128 v45;
  _DWORD v46[12];
  __int128 v47;
  void (**v48)(btC3DConvexResultCallback *__hidden);
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  int v55;
  btCollisionObject *v56;
  btVector3 v57;
  btVector3 v58;
  NSArray *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (!v11)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (self->_world)
  {
    v13 = v11;
    v14 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("ccdPenetration"));
    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      v16 = v15;
    }
    else
    {
      v16 = 0.0;
    }
    v17 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("collisionBitMask"));
    if (v17)
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
    else
      v18 = -1;
    v19 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("results"));
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("all")) & 1) != 0)
      v20 = 2;
    else
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("closest")) ^ 1;
    C3DSceneLock(v13);
    v21 = -[SCNPhysicsShape _handle](shape, "_handle");
    if (v21)
    {
      if (v21->var1 > 19)
      {
        v41 = scn_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[SCNPhysicsWorld convexSweepTestWithShape:fromTransform:toTransform:options:].cold.1(v41);
      }
      else
      {
        m12 = from->m12;
        m13 = from->m13;
        m21 = from->m21;
        m22 = from->m22;
        m23 = from->m23;
        m31 = from->m31;
        m32 = from->m32;
        m33 = from->m33;
        m43 = from->m43;
        v46[0] = LODWORD(from->m11);
        *(float *)&v46[1] = m21;
        *(float *)&v46[2] = m31;
        v46[3] = 0;
        *(float *)&v46[4] = m12;
        *(float *)&v46[5] = m22;
        *(float *)&v46[6] = m32;
        v46[7] = 0;
        *(float *)&v46[8] = m13;
        *(float *)&v46[9] = m23;
        *(float *)&v46[10] = m33;
        v46[11] = 0;
        *(_QWORD *)&v47 = *(_QWORD *)&from->m41;
        *((_QWORD *)&v47 + 1) = LODWORD(m43);
        v31 = to->m12;
        v32 = to->m13;
        v33 = to->m21;
        v34 = to->m22;
        v35 = to->m23;
        v36 = to->m31;
        v37 = to->m32;
        v38 = to->m33;
        v39 = to->m43;
        v44[0] = LODWORD(to->m11);
        *(float *)&v44[1] = v33;
        *(float *)&v44[2] = v36;
        v44[3] = 0;
        *(float *)&v44[4] = v31;
        *(float *)&v44[5] = v34;
        *(float *)&v44[6] = v37;
        v44[7] = 0;
        *(float *)&v44[8] = v32;
        *(float *)&v44[9] = v35;
        *(float *)&v44[10] = v38;
        v44[11] = 0;
        *(_QWORD *)&v45 = *(_QWORD *)&to->m41;
        *((_QWORD *)&v45 + 1) = LODWORD(v39);
        v49 = 1.0;
        v48 = &off_1EA5979F8;
        v51 = v18;
        v52 = 0;
        v53 = v47;
        v54 = v45;
        v56 = 0;
        v59 = 0;
        v50 = 1;
        v55 = v20;
        btCollisionWorld::convexSweepTest((uint64_t)self->_world, v21, (uint64_t)v46, (uint64_t)v44, (float *)&v48, v16);
        if (v49 < 1.0)
        {
          if (v20 == 2)
          {
            v40 = v59;
            goto LABEL_21;
          }
          v43 = __contact(v56, 0, &v58, &v57, 0.0, v49);
          if (v43)
          {
            v40 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v43);
LABEL_21:
            C3DSceneUnlock(v13);
            if (v40)
              return v40;
            return v12;
          }
        }
      }
    }
    v40 = 0;
    goto LABEL_21;
  }
  return v12;
}

- (void)updateCollisionPairs
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__SCNPhysicsWorld_updateCollisionPairs__block_invoke;
  v2[3] = &unk_1EA59E4A0;
  v2[4] = self;
  -[SCNPhysicsWorld _postCommandWithBlock:](self, "_postCommandWithBlock:", v2);
}

uint64_t __39__SCNPhysicsWorld_updateCollisionPairs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 16))(result);
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 24))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  return result;
}

- (BOOL)_needsRedraw
{
  _BYTE *world;

  return self->_speed != 0.0 && (world = self->_world) != 0 && world[448] != 0;
}

- (void)enumerateBodiesUsingBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *bodies;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  bodies = self->_bodies;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(bodies);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), &v15);
      if (v15)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *bodies;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  bodies = self->_bodies;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(bodies);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "clearAllForces");
        objc_msgSend(v9, "resetTransform");
        LODWORD(v10) = 0;
        LODWORD(v11) = 0;
        LODWORD(v12) = 0;
        objc_msgSend(v9, "setVelocity:", v10, v11, v12);
        LODWORD(v13) = 0;
        LODWORD(v14) = 0;
        LODWORD(v15) = 0;
        LODWORD(v16) = 0;
        objc_msgSend(v9, "setAngularVelocity:", v13, v14, v15, v16);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bodies, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_findFieldAttachedToNode:(id)a3
{
  NSMutableArray *fields;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  fields = self->_fields;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(fields);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)objc_msgSend(v9, "_owner") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_addFieldToWorld:(id)a3
{
  NSMutableArray *fields;
  c3dPhysicsField *v6;

  fields = self->_fields;
  if (!fields)
  {
    fields = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_fields = fields;
  }
  -[NSMutableArray addObject:](fields, "addObject:", a3);
  objc_msgSend(a3, "_setWorld:", self);
  v6 = (c3dPhysicsField *)objc_msgSend(a3, "_handle");
  if (v6)
    c3dAether::addField(&self->_aether, v6);
}

- (void)_removeFieldFromWorld:(id)a3
{
  -[NSMutableArray removeObject:](self->_fields, "removeObject:");
  c3dAether::removeField(&self->_aether, (c3dPhysicsField *)objc_msgSend(a3, "_handle"));
}

- (void)_aetherHandle
{
  return &self->_aether;
}

- (void)_updatePhysicsFieldsTransforms
{
  NSMutableArray *fields;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float32x4_t *v9;
  _OWORD *v10;
  float32x4_t *WorldMatrix;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4x4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_hasActiveFields = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  fields = self->_fields;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(fields);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        self->_hasActiveFields |= objc_msgSend(v8, "isActive");
        v9 = (float32x4_t *)objc_msgSend((id)objc_msgSend(v8, "_owner"), "nodeRef");
        v10 = (_OWORD *)objc_msgSend(v8, "_handle");
        WorldMatrix = C3DNodeGetWorldMatrix(v9);
        C3DMatrix4x4Invert((simd_float4x4 *)WorldMatrix, &v19);
        v12 = WorldMatrix[1];
        v13 = WorldMatrix[2];
        v14 = WorldMatrix[3];
        v15 = v19.columns[0];
        v16 = v19.columns[1];
        v17 = v19.columns[2];
        v18 = v19.columns[3];
        v10[1] = *WorldMatrix;
        v10[2] = v12;
        v10[3] = v13;
        v10[4] = v14;
        v10[5] = v15;
        v10[6] = v16;
        v10[7] = v17;
        v10[8] = v18;
        (*(void (**)(_OWORD *))(*(_QWORD *)v10 + 40))(v10);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
}

- (void)_step:(double)a3
{
  _QWORD *world;
  float timeStep;
  double speed;
  int v7;
  uint64_t v8;
  btC3DCollisionDispatcher *v9;
  NSArray *activeBehaviors;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  world = self->_world;
  if (world)
  {
    timeStep = self->_timeStep;
    speed = self->_speed;
    a3 = speed * a3;
    *(float *)&a3 = a3;
    *(float *)&speed = speed * (float)((float)(1.0 / timeStep) / 15.0);
    v7 = vcvtps_s32_f32(*(float *)&speed);
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    v9 = (btC3DCollisionDispatcher *)world[5];
    if (!self->_firstSimulationDone)
    {
      self->_firstSimulationDone = 1;
      if (timeStep >= *(float *)&a3)
        *(float *)&a3 = timeStep;
    }
    (*(void (**)(_QWORD *, uint64_t, __n128))(*world + 104))(world, v8, *(__n128 *)&a3);
    if (objc_loadWeak((id *)&self->_contactDelegate))
      btC3DCollisionDispatcher::dispatchContactsToDelegate(v9);
    if (!self->_activeBehaviorsValid)
    {
      os_unfair_lock_lock(&self->_lock);
      self->_activeBehaviorsValid = 1;

      self->_activeBehaviors = (NSArray *)-[NSMutableArray copy](self->_behaviors, "copy");
      os_unfair_lock_unlock(&self->_lock);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    activeBehaviors = self->_activeBehaviors;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](activeBehaviors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(activeBehaviors);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "_update");
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](activeBehaviors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }
}

- (btVehicleRaycaster)_defaultVehicleRayCaster
{
  btVehicleRaycaster *result;
  void **world;

  result = self->_vehicleRayCaster;
  if (!result)
  {
    -[SCNPhysicsWorld _createDynamicWorldIfNeeded](self, "_createDynamicWorldIfNeeded");
    result = (btVehicleRaycaster *)operator new();
    world = (void **)self->_world;
    result->var0 = (void **)&unk_1EA597B38;
    result[1].var0 = world;
    self->_vehicleRayCaster = result;
  }
  return result;
}

- (void)_handle
{
  -[SCNPhysicsWorld _createDynamicWorldIfNeeded](self, "_createDynamicWorldIfNeeded");
  return self->_world;
}

- (void)_allowGhostObjects
{
  btOverlappingPairCallback *v3;
  uint64_t v4;

  if (!self->_ghostPairCallback)
  {
    -[SCNPhysicsWorld _createDynamicWorldIfNeeded](self, "_createDynamicWorldIfNeeded");
    v3 = (btOverlappingPairCallback *)operator new();
    v3->var0 = (void **)&off_1EA596C58;
    self->_ghostPairCallback = v3;
    v4 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)self->_world + 12) + 72))(*((_QWORD *)self->_world + 12));
    (*(void (**)(uint64_t, btOverlappingPairCallback *))(*(_QWORD *)v4 + 120))(v4, self->_ghostPairCallback);
  }
}

- (id)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  self->_scene = (SCNScene *)a3;
}

- (void)_postCommandWithBlock:(id)a3
{
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", -[SCNScene sceneRef](self->_scene, "sceneRef"), self->_scene, a3);
}

- (void)_drawDebugInAuthoringEnvironment:(void *)a3
{
  btC3DDebugDraw *debugDrawer;

  if (self->_world)
  {
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      debugDrawer->var3 = a3;
      (*(void (**)(void *, btC3DDebugDraw *))(*(_QWORD *)self->_world + 32))(self->_world, self->_debugDrawer);
      (*(void (**)(void *))(*(_QWORD *)self->_world + 48))(self->_world);
      (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_world + 32))(self->_world, 0);
      self->_debugDrawer->var3 = 0;
    }
  }
}

- (void)addPhysicsBody:(id)a3 nodeRef:(__C3DNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7
{
  void *v13;
  uint64_t v14;
  unsigned __int32 v15;
  __n128 v16;
  unsigned __int32 v17;

  v13 = -[SCNPhysicsWorld _handle](self, "_handle");
  if (v13)
  {
    v14 = (uint64_t)v13;
    objc_msgSend(a3, "centerOfMassOffset");
    v16.n128_u32[1] = v15;
    v16.n128_u32[2] = v17;
    C3DPhysicsWorldAddBodyToWorld(v14, objc_msgSend(a3, "_handle"), a4, a5, a6, a7, v16);
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_bodies, "addObject:", a3);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removePhysicsBody:(id)a3 handle:(void *)a4
{
  void *world;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  world = self->_world;
  if (world)
    (*(void (**)(void *, void *))(*(_QWORD *)world + 184))(world, a4);
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)-[NSMutableArray copy](self->_behaviors, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasReferenceToPhysicsBody:", a3))
          -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, (uint64_t)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[NSMutableSet removeObject:](self->_bodies, "removeObject:", a3);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_customEncodingOfSCNPhysicsWorld:(id)a3
{
  NSMutableArray *behaviors;

  behaviors = self->_behaviors;
  if (behaviors)
    objc_msgSend(a3, "encodeObject:forKey:", behaviors, CFSTR("behaviors"));
}

- (void)_didDecodeSCNPhysicsWorld:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("behaviors"));
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SCNPhysicsWorld addBehavior:](self, "addBehavior:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)encodeWithCoder:(id)a3
{
  SCNScene *scene;

  -[SCNPhysicsWorld _customEncodingOfSCNPhysicsWorld:](self, "_customEncodingOfSCNPhysicsWorld:");
  scene = self->_scene;
  if (scene)
    objc_msgSend(a3, "encodeObject:forKey:", scene, CFSTR("scene"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("gravity"), self->_gravity.x, self->_gravity.y, self->_gravity.z);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeStep"), self->_timeStep);
}

- (SCNPhysicsWorld)initWithCoder:(id)a3
{
  SCNPhysicsWorld *v4;
  _BOOL8 v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsWorld;
  v4 = -[SCNPhysicsWorld init](&v8, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNPhysicsWorld _customDecodingOfSCNPhysicsWorld:](v4, "_customDecodingOfSCNPhysicsWorld:", a3);
    -[SCNPhysicsWorld setScene:](v4, "setScene:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scene")));
    *(float *)&v6 = SCNDecodeVector3(a3, (uint64_t)CFSTR("gravity"));
    -[SCNPhysicsWorld setGravity:](v4, "setGravity:", v6);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speed"));
    -[SCNPhysicsWorld setSpeed:](v4, "setSpeed:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("scale"));
    -[SCNPhysicsWorld setScale:](v4, "setScale:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeStep"));
    -[SCNPhysicsWorld setTimeStep:](v4, "setTimeStep:");
    -[SCNPhysicsWorld _didDecodeSCNPhysicsWorld:](v4, "_didDecodeSCNPhysicsWorld:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  c3dAether::~c3dAether(&self->_aether);
}

- (id).cxx_construct
{
  c3dAether::c3dAether(&self->_aether);
  return self;
}

- (void)convexSweepTestWithShape:(os_log_t)log fromTransform:toTransform:options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: convexSweep only works with convex shapes", v1, 2u);
}

@end
