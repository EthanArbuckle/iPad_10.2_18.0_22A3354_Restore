@implementation SCNPhysicsField

- (void)_commonInit
{
  self->_active = 1;
  self->_minimumDistance = 0.000001;
  *(int32x2_t *)&self->_halfExtent.x = vdup_n_s32(0x7F7FFFFFu);
  self->_halfExtent.z = 3.4028e38;
  self->_strength = 1.0;
  self->_direction.y = -1.0;
  self->_scope = 0;
  self->_categoryBitMask = -1;
}

- (SCNPhysicsField)init
{
  SCNPhysicsField *v2;
  SCNPhysicsField *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsField;
  v2 = -[SCNPhysicsField init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SCNPhysicsField _commonInit](v2, "_commonInit");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_field)
    -[SCNPhysicsField _removeOwner](self, "_removeOwner");
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsField;
  -[SCNPhysicsField dealloc](&v3, sel_dealloc);
}

+ (id)field
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (SCNPhysicsField)dragField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsDragField, "field");
}

+ (SCNPhysicsField)customFieldWithEvaluationBlock:(SCNFieldForceEvaluator)block
{
  SCNPhysicsField *v4;

  v4 = +[SCNPhysicsField field](SCNPhysicsCustomField, "field");
  -[SCNPhysicsField setBlock:](v4, "setBlock:", block);
  return v4;
}

+ (SCNPhysicsField)vortexField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsVortexField, "field");
}

+ (SCNPhysicsField)radialGravityField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsRadialGravityField, "field");
}

+ (SCNPhysicsField)linearGravityField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsLinearGravityField, "field");
}

+ (SCNPhysicsField)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  SCNPhysicsField *v6;

  v6 = +[SCNPhysicsField field](SCNPhysicsNoiseField, "field");
  -[SCNPhysicsField setSmoothness:](v6, "setSmoothness:", smoothness);
  -[SCNPhysicsField setAnimationSpeed:](v6, "setAnimationSpeed:", speed);
  return v6;
}

+ (SCNPhysicsField)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  SCNPhysicsField *v6;

  v6 = +[SCNPhysicsField field](SCNPhysicsTurbulenceField, "field");
  -[SCNPhysicsField setSmoothness:](v6, "setSmoothness:", smoothness);
  -[SCNPhysicsField setAnimationSpeed:](v6, "setAnimationSpeed:", speed);
  return v6;
}

+ (SCNPhysicsField)springField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsSpringField, "field");
}

+ (SCNPhysicsField)electricField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsElectricField, "field");
}

+ (SCNPhysicsField)magneticField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field](SCNPhysicsMagneticField, "field");
}

- (c3dPhysicsField)_createField
{
  c3dPhysicsField *result;

  result = (c3dPhysicsField *)-[SCNPhysicsField doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (void)_setupCommonProperties
{
  __int128 v2;
  c3dPhysicsField *field;
  c3dPhysicsField *v4;

  field = self->_field;
  if (field)
  {
    *(_QWORD *)&v2 = *(_QWORD *)&self->_halfExtent.x;
    DWORD2(v2) = LODWORD(self->_halfExtent.z);
    *(_OWORD *)&field[5].var5 = v2;
    v4 = self->_field;
    *(float *)&v2 = self->_strength;
    LODWORD(v4[5].var0) = v2;
    LOBYTE(v4[6].var4) = self->_active;
    BYTE2(v4[6].var4) = self->_exclusive;
    BYTE1(v4[6].var4) = self->_scope == 1;
    HIBYTE(v4[6].var4) = self->_usesEllipsoidalExtent;
    *(float *)&v2 = self->_minimumDistance;
    HIDWORD(v4[6].var0) = v2;
    *(_QWORD *)&v2 = *(_QWORD *)&self->_offset.x;
    DWORD2(v2) = LODWORD(self->_offset.z);
    *(_OWORD *)&v4[4].var5 = v2;
    LODWORD(self->_field[6].var3) = self->_categoryBitMask;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 0, 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchiveObjectWithData:", v3);
}

- (id)copy
{
  return -[SCNPhysicsField copyWithZone:](self, "copyWithZone:", 0);
}

- (CGFloat)strength
{
  return self->_strength;
}

- (void)setStrength:(CGFloat)strength
{
  void *v5;
  _QWORD v6[6];

  self->_strength = strength;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SCNPhysicsField_setStrength___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(CGFloat *)&v6[5] = strength;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

float __31__SCNPhysicsField_setStrength___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 160) = result;
  }
  return result;
}

- (NSUInteger)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  void *v5;
  _QWORD v6[6];

  self->_categoryBitMask = categoryBitMask;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setCategoryBitMask___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = categoryBitMask;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

uint64_t __38__SCNPhysicsField_setCategoryBitMask___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  if (v1)
    *(_DWORD *)(v1 + 200) = *(_QWORD *)(result + 40);
  return result;
}

- (CGFloat)falloffExponent
{
  return self->_falloffExponent;
}

- (void)setFalloffExponent:(CGFloat)falloffExponent
{
  void *v5;
  _QWORD v6[6];

  self->_falloffExponent = falloffExponent;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setFalloffExponent___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(CGFloat *)&v6[5] = falloffExponent;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

float __38__SCNPhysicsField_setFalloffExponent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 192) = result;
  }
  return result;
}

- (CGFloat)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(CGFloat)minimumDistance
{
  void *v5;
  _QWORD v6[6];

  self->_minimumDistance = minimumDistance;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setMinimumDistance___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(CGFloat *)&v6[5] = minimumDistance;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

float __38__SCNPhysicsField_setMinimumDistance___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 196) = result;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)active
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_active = active;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SCNPhysicsField_setActive___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = active;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

void __29__SCNPhysicsField_setActive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  c3dAether *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 120);
  if (v2)
  {
    *(_BYTE *)(v2 + 204) = *(_BYTE *)(a1 + 40);
    v1 = *(_QWORD *)(a1 + 32);
  }
  v3 = (c3dAether *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "scene"), "physicsWorld"), "_aetherHandle");
  if (v3)
    c3dAether::fieldsModeHaveChanged(v3);
}

- (SCNPhysicsFieldScope)scope
{
  return self->_scope;
}

- (void)setScope:(SCNPhysicsFieldScope)scope
{
  void *v4;
  _QWORD v5[5];

  self->_scope = scope;
  v4 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SCNPhysicsField_setScope___block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  objc_msgSend(v4, "_postCommandWithBlock:", v5);
}

uint64_t __28__SCNPhysicsField_setScope___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 120);
  if (v2)
    *(_BYTE *)(v2 + 205) = *(_QWORD *)(v1 + 56) == 1;
  return result;
}

- (SCNVector3)halfExtent
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_halfExtent.x;
  y = self->_halfExtent.y;
  z = self->_halfExtent.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setHalfExtent:(SCNVector3)halfExtent
{
  float z;
  float y;
  float x;
  void *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = halfExtent.z;
  y = halfExtent.y;
  x = halfExtent.x;
  self->_halfExtent = halfExtent;
  v7 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__SCNPhysicsField_setHalfExtent___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  objc_msgSend(v7, "_postCommandWithBlock:", v8);
}

__n128 __33__SCNPhysicsField_setHalfExtent___block_invoke(uint64_t a1, __n128 a2)
{
  __n128 *v2;
  __n128 result;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[11] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

- (BOOL)usesEllipsoidalExtent
{
  return self->_usesEllipsoidalExtent;
}

- (void)setUsesEllipsoidalExtent:(BOOL)usesEllipsoidalExtent
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_usesEllipsoidalExtent = usesEllipsoidalExtent;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNPhysicsField_setUsesEllipsoidalExtent___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = usesEllipsoidalExtent;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

uint64_t __44__SCNPhysicsField_setUsesEllipsoidalExtent___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  if (v1)
    *(_BYTE *)(v1 + 207) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)exclusive
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_exclusive = exclusive;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__SCNPhysicsField_setExclusive___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = exclusive;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

void __32__SCNPhysicsField_setExclusive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  c3dAether *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 120);
  if (v2)
  {
    *(_BYTE *)(v2 + 206) = *(_BYTE *)(a1 + 40);
    v1 = *(_QWORD *)(a1 + 32);
  }
  v3 = (c3dAether *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "scene"), "physicsWorld"), "_aetherHandle");
  if (v3)
    c3dAether::fieldsModeHaveChanged(v3);
}

- (SCNVector3)offset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_offset.x;
  y = self->_offset.y;
  z = self->_offset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(SCNVector3)offset
{
  float z;
  float y;
  float x;
  void *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = offset.z;
  y = offset.y;
  x = offset.x;
  self->_offset = offset;
  v7 = (void *)objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__SCNPhysicsField_setOffset___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  objc_msgSend(v7, "_postCommandWithBlock:", v8);
}

__n128 __29__SCNPhysicsField_setOffset___block_invoke(uint64_t a1, __n128 a2)
{
  __n128 *v2;
  __n128 result;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[9] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

- (SCNVector3)direction
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_direction.x;
  y = self->_direction.y;
  z = self->_direction.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDirection:(SCNVector3)direction
{
  self->_direction = direction;
}

- (BOOL)supportsDirection
{
  return 1;
}

- (BOOL)supportsOffset
{
  return 1;
}

+ (void)_setDisplayScaleFactor:(double)a3
{
  int v3;

  *(float *)&v3 = a3;
  _physicsFieldDisplayScaleFactor = v3;
}

+ (double)_displayScaleFactor
{
  return *(float *)&_physicsFieldDisplayScaleFactor;
}

- (void)_removeOwner
{
  SCNNode *node;
  SCNPhysicsWorld *world;
  c3dPhysicsField *field;

  node = self->_node;
  if (node)
  {
    C3DNodeSetHasPhysicsField((uint64_t)-[SCNNode nodeRef](node, "nodeRef"), 0);
    self->_node = 0;
  }
  world = self->_world;
  if (world)
  {
    -[SCNPhysicsWorld _removeFieldFromWorld:](world, "_removeFieldFromWorld:", self);
    self->_world = 0;
  }
  field = self->_field;
  if (field)
  {
    (*((void (**)(c3dPhysicsField *, SEL))field->var0 + 1))(field, a2);
    self->_field = 0;
  }
}

- (void)_willRemoveFromPhysicsWorld
{
  SCNPhysicsWorld *world;

  world = self->_world;
  if (world)
  {
    -[SCNPhysicsWorld _removeFieldFromWorld:](world, "_removeFieldFromWorld:", self);
    self->_world = 0;
  }
}

- (void)_setOwner:(id)a3
{
  SCNNode *node;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;

  node = self->_node;
  if (node)
    v6 = node == a3;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNPhysicsField _setOwner:].cold.2(v7);
    node = self->_node;
  }
  if (node)
  {
    if (self->_field)
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[SCNPhysicsField _setOwner:].cold.1(v8);
    }
  }
  self->_node = (SCNNode *)a3;
  if (!self->_field)
  {
    self->_field = -[SCNPhysicsField _createField](self, "_createField");
    -[SCNPhysicsField _setupCommonProperties](self, "_setupCommonProperties");
  }
  C3DNodeSetHasPhysicsField(objc_msgSend(a3, "nodeRef"), 1);
  v9 = (void *)objc_msgSend(a3, "scene");
  if (v9)
    objc_msgSend((id)objc_msgSend(v9, "physicsWorld"), "_addFieldToWorld:", self);
}

- (void)_setWorld:(id)a3
{
  self->_world = (SCNPhysicsWorld *)a3;
}

- (id)_owner
{
  return self->_node;
}

- (c3dPhysicsField)_handle
{
  return self->_field;
}

- (SCNVector3)evalAtLocation:(SCNVector3)a3
{
  float y;
  float z;
  __n128 v6;
  float v7;
  float v8;
  __n128 v9;
  SCNVector3 result;

  y = a3.y;
  z = a3.z;
  v9 = *(__n128 *)&a3.x;
  if (c3dPhysicsField::contains((float32x4_t *)self->_field, (float32x2_t *)&v9))
  {
    v6 = ((__n128 (*)(c3dPhysicsField *, __n128, __n128, float, float, float))*((_QWORD *)self->_field->var0
                                                                                         + 2))(self->_field, v9, (__n128)0, 1.0, 1.0, 0.016667);
    v7 = v6.n128_f32[2];
  }
  else
  {
    v6.n128_u64[0] = 0;
    v7 = 0.0;
  }
  v8 = v6.n128_f32[1];
  result.x = v6.n128_f32[0];
  result.z = v7;
  result.y = v8;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SCNEncodeVector3(a3, (uint64_t)CFSTR("halfExtent"), self->_halfExtent.x, self->_halfExtent.y, self->_halfExtent.z);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("strength"), self->_strength);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("falloffExponent"), self->_falloffExponent);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("minimumDistance"), self->_minimumDistance);
  objc_msgSend(a3, "encodeBool:forKey:", self->_active, CFSTR("active"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_usesEllipsoidalExtent, CFSTR("usesEllipsoidalExtent"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_exclusive, CFSTR("exclusive"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("offset"), self->_offset.x, self->_offset.y, self->_offset.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("direction"), self->_direction.x, self->_direction.y, self->_direction.z);
}

- (SCNPhysicsField)initWithCoder:(id)a3
{
  SCNPhysicsField *v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsField;
  v4 = -[SCNPhysicsField init](&v10, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNPhysicsField _commonInit](v4, "_commonInit");
    *(float *)&v6 = SCNDecodeVector3(a3, (uint64_t)CFSTR("halfExtent"));
    -[SCNPhysicsField setHalfExtent:](v4, "setHalfExtent:", v6);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("strength"));
    -[SCNPhysicsField setStrength:](v4, "setStrength:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("falloffExponent"));
    -[SCNPhysicsField setFalloffExponent:](v4, "setFalloffExponent:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("minimumDistance"));
    -[SCNPhysicsField setMinimumDistance:](v4, "setMinimumDistance:");
    -[SCNPhysicsField setActive:](v4, "setActive:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("active")));
    -[SCNPhysicsField setScope:](v4, "setScope:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("scope")));
    -[SCNPhysicsField setUsesEllipsoidalExtent:](v4, "setUsesEllipsoidalExtent:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesEllipsoidalExtent")));
    -[SCNPhysicsField setExclusive:](v4, "setExclusive:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("exclusive")));
    *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("offset"));
    -[SCNPhysicsField setOffset:](v4, "setOffset:", v7);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("direction")))
    {
      *(float *)&v8 = SCNDecodeVector3(a3, (uint64_t)CFSTR("direction"));
      -[SCNPhysicsField setDirection:](v4, "setDirection:", v8);
    }
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setOwner:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "!_node || _field == 0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. SCNPhysicsField is already attached to a SCNNode", (uint8_t *)&v1, 0xCu);
}

- (void)_setOwner:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: can't share a SCNPhysicsField is already attached to a SCNNode", v1, 2u);
}

@end
