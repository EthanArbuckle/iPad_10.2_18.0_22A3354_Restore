@implementation SKPhysicsBody

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (SKPhysicsBody)initWithCoder:(id)a3
{

  return 0;
}

- (NSArray)allContactedBodies
{
  return 0;
}

+ (SKPhysicsBody)allocWithZone:(_NSZone *)a3
{
  PKPhysicsBody *v3;

  v3 = (PKPhysicsBody *)objc_msgSend(MEMORY[0x1E0D7D290], "allocWithZone:", a3);
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (id)copyWithZone:(_NSZone *)a3
{
  PKPhysicsBody *v3;

  v3 = (PKPhysicsBody *)objc_msgSend(MEMORY[0x1E0D7D290], "copyWithZone:", a3);
  setSKPhysicsDefaults(v3);
  return v3;
}

+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithCircleOfRadius:", r);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r center:(CGPoint)center
{
  PKPhysicsBody *v4;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithCircleOfRadius:center:", r, center.x, center.y);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);
  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithRectangleOfSize:edgeRadius:", s.width, s.height, 0.001);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s center:(CGPoint)center
{
  PKPhysicsBody *v4;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithRectangleOfSize:center:edgeRadius:", s.width, s.height, center.x, center.y, 0.001);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);
  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithPolygonFromPath:(CGPathRef)path
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithPolygonFromPath:", path);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeFromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
  PKPhysicsBody *v4;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithEdgeFromPoint:toPoint:", p1.x, p1.y, p2.x, p2.y);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);
  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithEdgeChainFromPath:(CGPathRef)path
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithEdgeChainFromPath:", path);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeLoopFromPath:(CGPathRef)path
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithEdgeLoopFromPath:", path);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeLoopFromRect:(CGRect)rect
{
  const CGPath *v3;
  PKPhysicsBody *v4;

  v3 = CGPathCreateWithRect(rect, 0);
  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithEdgeLoopFromPath:", v3);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v3);
  setSKPhysicsDefaults(v4);
  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v6;
  double v7;
  SKTexture *v8;
  SKTexture *v9;
  id v10;
  _QWORD v12[4];
  SKTexture *v13;
  uint64_t *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  height = size.height;
  width = size.width;
  v6 = texture;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5;
    v21 = __Block_byref_object_dispose__5;
    v22 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__SKPhysicsBody_bodyWithTexture_size___block_invoke;
    v12[3] = &unk_1EA500C50;
    v14 = &v17;
    v9 = v8;
    v13 = v9;
    v15 = width;
    v16 = height;
    -[SKTexture modifyPixelDataWithBlock:](v9, "modifyPixelDataWithBlock:", v12);
    setSKPhysicsDefaults((PKPhysicsBody *)v18[5]);
    v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    LODWORD(v7) = 1028443341;
    +[SKPhysicsBody bodyWithTexture:alphaThreshold:size:](SKPhysicsBody, "bodyWithTexture:alphaThreshold:size:", v6, v7, width, height);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (SKPhysicsBody *)v10;
}

void __38__SKPhysicsBody_bodyWithTexture_size___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0D7D2F8];
  objc_msgSend(*(id *)(a1 + 32), "size");
  v6 = (int)v5;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v4, "gridFromOccupancyArray:bytePitch:width:height:", a2, 4, v6, (int)v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "physicsBodyFromLVS0:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture alphaThreshold:(float)alphaThreshold size:(CGSize)size
{
  double height;
  double width;
  void *v7;
  PKPhysicsBody *v8;

  height = size.height;
  width = size.width;
  +[SKPhysicsGrid gridFromTexture:alphaThreshold:accuracy:](SKPhysicsGrid, "gridFromTexture:alphaThreshold:accuracy:", texture);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "physicsBodyFromSmoothedOutline:size:", 1.0, width, height);
  v8 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v8);

  return (SKPhysicsBody *)v8;
}

+ (SKPhysicsBody)bodyWithTexture:(id)a3 alphaThreshold:(float)a4 size:(CGSize)a5 accuracy:(float)a6
{
  double height;
  double width;
  void *v8;
  PKPhysicsBody *v9;

  height = a5.height;
  width = a5.width;
  +[SKPhysicsGrid gridFromTexture:alphaThreshold:accuracy:](SKPhysicsGrid, "gridFromTexture:alphaThreshold:accuracy:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "physicsBodyFromSmoothedOutline:size:", 1.0, width, height);
  v9 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v9);

  return (SKPhysicsBody *)v9;
}

+ (SKPhysicsBody)bodyWithBodies:(NSArray *)bodies
{
  PKPhysicsBody *v3;

  objc_msgSend(MEMORY[0x1E0D7D290], "bodyWithBodies:", bodies);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (void)setDynamic:(BOOL)dynamic
{
  self->_dynamic = dynamic;
}

- (BOOL)usesPreciseCollisionDetection
{
  return self->_usesPreciseCollisionDetection;
}

- (void)setUsesPreciseCollisionDetection:(BOOL)usesPreciseCollisionDetection
{
  self->_usesPreciseCollisionDetection = usesPreciseCollisionDetection;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  self->_allowsRotation = allowsRotation;
}

- (BOOL)pinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)pinned
{
  self->_pinned = pinned;
}

- (BOOL)isResting
{
  return self->_resting;
}

- (void)setResting:(BOOL)resting
{
  self->_resting = resting;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (void)setFriction:(CGFloat)friction
{
  self->_friction = friction;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (void)setCharge:(CGFloat)charge
{
  self->_charge = charge;
}

- (CGFloat)restitution
{
  return self->_restitution;
}

- (void)setRestitution:(CGFloat)restitution
{
  self->_restitution = restitution;
}

- (CGFloat)linearDamping
{
  return self->_linearDamping;
}

- (void)setLinearDamping:(CGFloat)linearDamping
{
  self->_linearDamping = linearDamping;
}

- (CGFloat)angularDamping
{
  return self->_angularDamping;
}

- (void)setAngularDamping:(CGFloat)angularDamping
{
  self->_angularDamping = angularDamping;
}

- (CGFloat)density
{
  return self->_density;
}

- (void)setDensity:(CGFloat)density
{
  self->_density = density;
}

- (CGFloat)mass
{
  return self->_mass;
}

- (void)setMass:(CGFloat)mass
{
  self->_mass = mass;
}

- (CGFloat)area
{
  return self->_area;
}

- (BOOL)affectedByGravity
{
  return self->_affectedByGravity;
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  self->_affectedByGravity = affectedByGravity;
}

- (uint32_t)fieldBitMask
{
  return self->_fieldBitMask;
}

- (void)setFieldBitMask:(uint32_t)fieldBitMask
{
  self->_fieldBitMask = fieldBitMask;
}

- (uint32_t)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
  self->_categoryBitMask = categoryBitMask;
}

- (uint32_t)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(uint32_t)collisionBitMask
{
  self->_collisionBitMask = collisionBitMask;
}

- (uint32_t)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(uint32_t)contactTestBitMask
{
  self->_contactTestBitMask = contactTestBitMask;
}

- (NSArray)joints
{
  return self->_joints;
}

- (SKNode)node
{
  return (SKNode *)objc_loadWeakRetained((id *)&self->_node);
}

- (CGVector)velocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_velocity.dx;
  dy = self->_velocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setVelocity:(CGVector)velocity
{
  self->_velocity = velocity;
}

- (CGFloat)angularVelocity
{
  return self->_angularVelocity;
}

- (void)setAngularVelocity:(CGFloat)angularVelocity
{
  self->_angularVelocity = angularVelocity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_node);
  objc_storeStrong((id *)&self->_joints, 0);
}

@end
