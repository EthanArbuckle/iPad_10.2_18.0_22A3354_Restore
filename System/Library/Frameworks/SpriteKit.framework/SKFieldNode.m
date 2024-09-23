@implementation SKFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPhysicsField:(id)a3
{
  id v5;
  void *v6;
  PKPhysicsField **p_field;
  PKPhysicsField *field;
  void *v9;
  double v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = a3;
  -[SKNode scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_field = &self->_field;
  field = self->_field;
  if (field)
  {
    -[PKPhysicsField setRepresentedObject:](field, "setRepresentedObject:", 0);
    if (v6)
    {
      objc_msgSend(v6, "physicsWorld");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeField:", *p_field);

    }
  }
  objc_storeStrong((id *)&self->_field, a3);
  if (v5)
  {
    objc_msgSend(v5, "setRepresentedObject:", self);
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    SKCNode::resolveWorldPositionRotationAndScale((_OWORD *)self->super._skcNode, &v14, &v13, &v12);
    -[PKPhysicsField setPosition:](*p_field, "setPosition:", *(double *)&v14);
    LODWORD(v10) = DWORD2(v13);
    -[PKPhysicsField setRotation:](*p_field, "setRotation:", v10);
    -[PKPhysicsField setScale:](*p_field, "setScale:", *(double *)&v12);
    if (v6)
    {
      objc_msgSend(v6, "physicsWorld");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addField:", v5);

    }
  }

}

- (id)field
{
  return self->_field;
}

- (uint32_t)categoryBitMask
{
  return -[PKPhysicsField categoryBitMask](self->_field, "categoryBitMask");
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
  -[PKPhysicsField setCategoryBitMask:](self->_field, "setCategoryBitMask:", *(_QWORD *)&categoryBitMask);
}

- (vector_float3)direction
{
  uint64_t v2;
  uint64_t v3;
  vector_float3 result;

  v2 = -[PKPhysicsField direction](self->_field, "direction");
  result.i64[1] = v3;
  result.i64[0] = v2;
  return result;
}

- (void)setDirection:(vector_float3)direction
{
  -[PKPhysicsField setDirection:](self->_field, "setDirection:", direction.i64[0], direction.i64[1]);
}

- (float)smoothness
{
  float result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return self->_smoothness;
  -[PKPhysicsField smoothness](self->_field, "smoothness");
  return result;
}

- (void)setSmoothness:(float)smoothness
{
  double v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v5 = smoothness;
    -[PKPhysicsField setSmoothness:](self->_field, "setSmoothness:", v5);
  }
  else
  {
    self->_smoothness = smoothness;
  }
}

- (float)animationSpeed
{
  float result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return self->_animationSpeed;
  -[PKPhysicsField animationSpeed](self->_field, "animationSpeed");
  return result;
}

- (void)setAnimationSpeed:(float)animationSpeed
{
  double v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v5 = animationSpeed;
    -[PKPhysicsField setAnimationSpeed:](self->_field, "setAnimationSpeed:", v5);
  }
  else
  {
    self->_animationSpeed = animationSpeed;
  }
}

- (SKTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(SKTexture *)texture
{
  PKPhysicsField *v4;
  double v5;
  void *v6;
  SKTexture *v7;
  SKTexture *v8;

  v8 = texture;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = self->_field;
    LODWORD(v5) = 1.0;
    +[SKPhysicsGrid vectorGridFromTexture:accuracy:](SKPhysicsGrid, "vectorGridFromTexture:accuracy:", v8, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicsField setGrid:](v4, "setGrid:", v6);

  }
  else
  {
    v7 = v8;
    v4 = (PKPhysicsField *)self->_texture;
    self->_texture = v7;
  }

}

- (SKFieldNode)init
{
  SKFieldNode *v2;
  double v3;
  SKFieldNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKFieldNode;
  v2 = -[SKNode init](&v6, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    -[SKFieldNode setStrength:](v2, "setStrength:", v3);
  }
  return v4;
}

- (id)_descriptionClassName
{
  return CFSTR("SKFieldNode");
}

- (SKFieldNode)initWithCoder:(id)a3
{
  id v4;
  SKFieldNode *v5;
  void *v6;
  NSData *v7;
  void *v8;
  PKPhysicsField *v9;
  double v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKFieldNode;
  v5 = -[SKNode initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_region"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFieldNode setRegion:](v5, "setRegion:", v6);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_strength"));
    -[SKFieldNode setStrength:](v5, "setStrength:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_falloff"));
    -[SKFieldNode setFalloff:](v5, "setFalloff:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_minimumRadius"));
    -[SKFieldNode setMinimumRadius:](v5, "setMinimumRadius:");
    -[SKFieldNode setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_active")));
    -[SKFieldNode setExclusive:](v5, "setExclusive:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_exclusive")));
    -[SKFieldNode setCategoryBitMask:](v5, "setCategoryBitMask:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_categoryBitMask")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_direction"));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    -[SKFieldNode setDirection:](v5, "setDirection:", createV3fFromData(v7).n128_f64[0]);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_smoothness"));
    -[SKFieldNode setSmoothness:](v5, "setSmoothness:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_animationSpeed"));
    -[SKFieldNode setAnimationSpeed:](v5, "setAnimationSpeed:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_texture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = v5->_field;
      LODWORD(v10) = 1.0;
      +[SKPhysicsGrid vectorGridFromTexture:accuracy:](SKPhysicsGrid, "vectorGridFromTexture:accuracy:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPhysicsField setGrid:](v9, "setGrid:", v11);

    }
  }

  return v5;
}

- (SKFieldNode)initWithCoder:(id)a3 field:(id)a4
{
  id v6;
  id v7;
  SKFieldNode *v8;
  SKFieldNode *v9;
  id *p_field;
  void *v11;
  NSData *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKFieldNode;
  v8 = -[SKNode initWithCoder:](&v18, sel_initWithCoder_, v6);
  v9 = v8;
  if (v8)
  {
    p_field = (id *)&v8->_field;
    objc_storeStrong((id *)&v8->_field, a4);
    -[SKFieldNode setPhysicsField:](v9, "setPhysicsField:", *p_field);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_region"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFieldNode setRegion:](v9, "setRegion:", v11);

    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("_strength"));
    -[SKFieldNode setStrength:](v9, "setStrength:");
    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("_falloff"));
    -[SKFieldNode setFalloff:](v9, "setFalloff:");
    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("_minimumRadius"));
    -[SKFieldNode setMinimumRadius:](v9, "setMinimumRadius:");
    -[SKFieldNode setEnabled:](v9, "setEnabled:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("_active")));
    -[SKFieldNode setExclusive:](v9, "setExclusive:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("_exclusive")));
    -[SKFieldNode setCategoryBitMask:](v9, "setCategoryBitMask:", objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("_categoryBitMask")));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_direction"));
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    -[SKFieldNode setDirection:](v9, "setDirection:", createV3fFromData(v12).n128_f64[0]);

    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("_smoothness"));
    -[SKFieldNode setSmoothness:](v9, "setSmoothness:");
    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("_animationSpeed"));
    -[SKFieldNode setAnimationSpeed:](v9, "setAnimationSpeed:");
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_texture"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = *p_field;
      LODWORD(v15) = 1.0;
      +[SKPhysicsGrid vectorGridFromTexture:accuracy:](SKPhysicsGrid, "vectorGridFromTexture:accuracy:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setGrid:", v16);

    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  int i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  unsigned int v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKFieldNode;
  -[SKNode encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  -[SKFieldNode region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKFieldNode region](self, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_region"));

  }
  -[SKFieldNode strength](self, "strength");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_strength"));
  -[SKFieldNode falloff](self, "falloff");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_falloff"));
  -[SKFieldNode minimumRadius](self, "minimumRadius");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_minimumRadius"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKFieldNode isEnabled](self, "isEnabled"), CFSTR("_active"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKFieldNode isExclusive](self, "isExclusive"), CFSTR("_exclusive"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKFieldNode categoryBitMask](self, "categoryBitMask"), CFSTR("_categoryBitMask"));
  -[SKFieldNode direction](self, "direction");
  v12 = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 12);
  for (i = 0; i != 3; ++i)
  {
    v13 = v12;
    v15 = bswap32(*(_DWORD *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))));
    objc_msgSend(v8, "appendBytes:length:", &v15, 4, v12, v12);
  }
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_direction"));

  -[SKFieldNode smoothness](self, "smoothness");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_smoothness"));
  -[SKFieldNode animationSpeed](self, "animationSpeed");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_animationSpeed"));
  -[SKFieldNode texture](self, "texture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKFieldNode texture](self, "texture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_texture"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKFieldNode;
  v4 = -[SKNode copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SKFieldNode region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRegion:", v5);

  -[SKFieldNode strength](self, "strength");
  objc_msgSend(v4, "setStrength:");
  -[SKFieldNode falloff](self, "falloff");
  objc_msgSend(v4, "setFalloff:");
  -[SKFieldNode minimumRadius](self, "minimumRadius");
  objc_msgSend(v4, "setMinimumRadius:");
  objc_msgSend(v4, "setEnabled:", -[SKFieldNode isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setExclusive:", -[SKFieldNode isExclusive](self, "isExclusive"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SKFieldNode categoryBitMask](self, "categoryBitMask"));
  -[SKFieldNode direction](self, "direction");
  objc_msgSend(v4, "setDirection:");
  -[SKFieldNode smoothness](self, "smoothness");
  objc_msgSend(v4, "setSmoothness:");
  -[SKFieldNode animationSpeed](self, "animationSpeed");
  objc_msgSend(v4, "setAnimationSpeed:");
  return v4;
}

- (void)setStrength:(float)strength
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    -[PKPhysicsField setStrength:](field, "setStrength:");
}

- (float)strength
{
  PKPhysicsField *field;
  float result;

  field = self->_field;
  if (!field)
    return 0.0;
  -[PKPhysicsField strength](field, "strength");
  return result;
}

- (void)setMinimumRadius:(float)minimumRadius
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    -[PKPhysicsField setMinimumRadius:](field, "setMinimumRadius:");
}

- (float)minimumRadius
{
  PKPhysicsField *field;
  float result;

  field = self->_field;
  if (!field)
    return 0.000030518;
  -[PKPhysicsField minimumRadius](field, "minimumRadius");
  return result;
}

- (float)falloff
{
  PKPhysicsField *field;
  float result;

  field = self->_field;
  if (!field)
    return 0.0;
  -[PKPhysicsField falloff](field, "falloff");
  return result;
}

- (void)setFalloff:(float)falloff
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    -[PKPhysicsField setFalloff:](field, "setFalloff:");
}

- (void)setEnabled:(BOOL)enabled
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    -[PKPhysicsField setEnabled:](field, "setEnabled:", enabled);
}

- (BOOL)isEnabled
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    LOBYTE(field) = -[PKPhysicsField isEnabled](field, "isEnabled");
  return (char)field;
}

- (void)setExclusive:(BOOL)exclusive
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    -[PKPhysicsField setOverride:](field, "setOverride:", exclusive);
}

- (BOOL)isExclusive
{
  PKPhysicsField *field;

  field = self->_field;
  if (field)
    LOBYTE(field) = -[PKPhysicsField isOverride](field, "isOverride");
  return (char)field;
}

- (SKRegion)region
{
  return self->_region;
}

- (void)setRegion:(SKRegion *)region
{
  SKRegion *v5;

  objc_storeStrong((id *)&self->_region, region);
  v5 = region;
  -[PKPhysicsField setRegion:](self->_field, "setRegion:");

}

- (BOOL)isEqualToNode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SKFieldNode *v8;
  SKFieldNode *v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;
  void *v19;
  void *v20;
  int v21;
  uint32_t v22;
  _BOOL4 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v8 = (SKFieldNode *)a3;
  if (self == v8)
  {
    v17 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  v32.receiver = self;
  v32.super_class = (Class)SKFieldNode;
  if (-[SKNode isEqualToNode:](&v32, sel_isEqualToNode_, v9))
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      -[SKFieldNode animationSpeed](self, "animationSpeed");
      v12 = v11;
      -[SKFieldNode animationSpeed](v9, "animationSpeed");
      if ((COERCE_UNSIGNED_INT(v12 - v13) & 0x60000000) == 0)
      {
        -[SKFieldNode smoothness](self, "smoothness");
        v15 = v14;
        -[SKFieldNode smoothness](v9, "smoothness");
        if ((COERCE_UNSIGNED_INT(v15 - v16) & 0x60000000) == 0)
        {
          -[SKFieldNode texture](self, "texture");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "imageNameOrPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20
            || (-[SKFieldNode texture](v9, "texture"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v29, "imageNameOrPath"),
                (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[SKFieldNode texture](self, "texture");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "imageNameOrPath");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKFieldNode texture](v9, "texture");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "imageNameOrPath");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v5, "isEqualToString:", v3))
            {
              v17 = 0;
              goto LABEL_22;
            }
            v31 = v19;
            v21 = 1;
          }
          else
          {
            v30 = 0;
            v31 = v19;
            v21 = 0;
          }
          v22 = -[SKFieldNode categoryBitMask](self, "categoryBitMask");
          if (v22 == -[SKFieldNode categoryBitMask](v9, "categoryBitMask")
            && (v23 = -[SKFieldNode isEnabled](self, "isEnabled"), v23 == -[SKFieldNode isEnabled](v9, "isEnabled")))
          {
            -[SKFieldNode direction](self, "direction");
            v28 = v24;
            -[SKFieldNode direction](v9, "direction");
            v26 = vsubq_f32(v28, v25);
            v27 = vmulq_f32(v26, v26);
            v17 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]) == 0.0;
            if ((v21 & 1) != 0)
              goto LABEL_21;
          }
          else
          {
            v17 = 0;
            if (v21)
            {
LABEL_21:
              v19 = v31;
LABEL_22:

              if (v20)
              {
LABEL_24:

                goto LABEL_8;
              }
LABEL_23:

              goto LABEL_24;
            }
          }
          v19 = v31;
          if (v20)
            goto LABEL_24;
          goto LABEL_23;
        }
      }
    }
  }
  v17 = 0;
LABEL_8:

LABEL_11:
  return v17;
}

+ (SKFieldNode)dragField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)vortexField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)radialGravityField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)linearGravityFieldWithVector:(vector_float3)direction
{
  double v3;
  void *v4;
  double v6;

  v6 = v3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDirection:", v6);
  return (SKFieldNode *)v4;
}

+ (SKFieldNode)velocityFieldWithVector:(vector_float3)direction
{
  double v3;
  void *v4;
  double v6;

  v6 = v3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDirection:", v6);
  return (SKFieldNode *)v4;
}

+ (SKFieldNode)velocityFieldWithTexture:(SKTexture *)velocityTexture
{
  SKTexture *v3;
  void *v4;

  v3 = velocityTexture;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTexture:", v3);

  return (SKFieldNode *)v4;
}

+ (SKFieldNode)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  void *v6;
  double v7;
  double v8;

  v6 = (void *)objc_opt_new();
  *(float *)&v7 = smoothness;
  objc_msgSend(v6, "setSmoothness:", v7);
  *(float *)&v8 = speed;
  objc_msgSend(v6, "setAnimationSpeed:", v8);
  return (SKFieldNode *)v6;
}

+ (SKFieldNode)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  void *v6;
  double v7;
  double v8;

  v6 = (void *)objc_opt_new();
  *(float *)&v7 = smoothness;
  objc_msgSend(v6, "setSmoothness:", v7);
  *(float *)&v8 = speed;
  objc_msgSend(v6, "setAnimationSpeed:", v8);
  return (SKFieldNode *)v6;
}

+ (SKFieldNode)springField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)electricField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)magneticField
{
  return (SKFieldNode *)(id)objc_opt_new();
}

+ (SKFieldNode)customFieldWithEvaluationBlock:(SKFieldForceEvaluator)block
{
  SKFieldForceEvaluator v3;
  void *v4;

  v3 = block;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBlock:", v3);

  return (SKFieldNode *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
