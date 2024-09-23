@implementation SCNPhysicsVehicleWheel

- (SCNPhysicsVehicleWheel)init
{
  SCNPhysicsVehicleWheel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVehicleWheel;
  result = -[SCNPhysicsVehicleWheel init](&v3, sel_init);
  if (result)
  {
    result->_suspensionRestLength = 1.6;
    *(_OWORD *)&result->_suspensionStiffness = xmmword_1DD02ADD0;
    *(_OWORD *)&result->_suspensionDamping = xmmword_1DD02ADE0;
    *(_OWORD *)&result->_frictionSlip = xmmword_1DD02ADF0;
    result->_axle.y = 0.0;
    result->_axle.z = 0.0;
    *(_OWORD *)&result->_steeringAxis.x = xmmword_1DD02AE00;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVehicleWheel;
  -[SCNPhysicsVehicleWheel dealloc](&v3, sel_dealloc);
}

- (void)setNode:(id)a3
{
  SCNNode *node;

  node = self->_node;
  if (node != a3)
  {

    self->_node = (SCNNode *)a3;
  }
}

- (void)_setVehicle:(id)a3
{
  SCNPhysicsVehicle *vehicle;
  BOOL v6;
  NSObject *v7;

  if (a3)
  {
    vehicle = self->_vehicle;
    if (vehicle)
      v6 = vehicle == a3;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SCNPhysicsVehicleWheel _setVehicle:].cold.1(v7);
    }
  }
  self->_vehicle = (SCNPhysicsVehicle *)a3;
}

- (void)_setWheelIndex:(int)a3
{
  self->_wheelIndex = a3;
}

+ (SCNPhysicsVehicleWheel)wheelWithNode:(SCNNode *)node
{
  SCNPhysicsVehicleWheel *v4;
  float32x2_t v5;
  float v6;
  float32x2_t v8;
  uint64_t v9;
  float32x2_t v10;
  float v11;

  v4 = objc_alloc_init(SCNPhysicsVehicleWheel);
  -[SCNPhysicsVehicleWheel setNode:](v4, "setNode:", node);
  -[SCNNode position](node, "position");
  -[SCNPhysicsVehicleWheel setConnectionPosition:](v4, "setConnectionPosition:");
  -[SCNNode getBoundingBoxMin:max:](node, "getBoundingBoxMin:max:", &v10, &v8);
  v5 = vsub_f32(v8, v10);
  v8 = v5;
  v6 = *(float *)&v9 - v11;
  *(float *)&v9 = *(float *)&v9 - v11;
  if (v5.f32[0] < v5.f32[1])
    v5.f32[0] = v5.f32[1];
  if (v5.f32[0] < v6)
    v5.f32[0] = v6;
  -[SCNPhysicsVehicleWheel setRadius:](v4, "setRadius:", (float)(v5.f32[0] * 0.5), *(_QWORD *)&v8, v9);
  return v4;
}

- (SCNNode)node
{
  return self->_node;
}

- (CGFloat)suspensionStiffness
{
  return self->_suspensionStiffness;
}

- (void)setSuspensionStiffness:(CGFloat)suspensionStiffness
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_suspensionStiffness = suspensionStiffness;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SCNPhysicsVehicleWheel_setSuspensionStiffness___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionStiffness;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __49__SCNPhysicsVehicleWheel_setSuspensionStiffness___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 236) = result;
  return result;
}

- (CGFloat)suspensionCompression
{
  return self->_suspensionCompression;
}

- (void)setSuspensionCompression:(CGFloat)suspensionCompression
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_suspensionCompression = suspensionCompression;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SCNPhysicsVehicleWheel_setSuspensionCompression___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionCompression;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __51__SCNPhysicsVehicleWheel_setSuspensionCompression___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 240) = result;
  return result;
}

- (CGFloat)suspensionDamping
{
  return self->_suspensionDamping;
}

- (void)setSuspensionDamping:(CGFloat)suspensionDamping
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_suspensionDamping = suspensionDamping;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SCNPhysicsVehicleWheel_setSuspensionDamping___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionDamping;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __47__SCNPhysicsVehicleWheel_setSuspensionDamping___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 244) = result;
  return result;
}

- (CGFloat)maximumSuspensionTravel
{
  return self->_maximumSuspensionTravel;
}

- (void)setMaximumSuspensionTravel:(CGFloat)maximumSuspensionTravel
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_maximumSuspensionTravel = maximumSuspensionTravel;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__SCNPhysicsVehicleWheel_setMaximumSuspensionTravel___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumSuspensionTravel;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __53__SCNPhysicsVehicleWheel_setMaximumSuspensionTravel___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 228) = result;
  return result;
}

- (CGFloat)frictionSlip
{
  return self->_frictionSlip;
}

- (void)setFrictionSlip:(CGFloat)frictionSlip
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_frictionSlip = frictionSlip;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SCNPhysicsVehicleWheel_setFrictionSlip___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = frictionSlip;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __42__SCNPhysicsVehicleWheel_setFrictionSlip___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40) * 10.5;
  *(float *)(WheelInfo + 248) = result;
  return result;
}

- (CGFloat)maximumSuspensionForce
{
  return self->_maximumSuspensionForce;
}

- (void)setMaximumSuspensionForce:(CGFloat)maximumSuspensionForce
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_maximumSuspensionForce = maximumSuspensionForce;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SCNPhysicsVehicleWheel_setMaximumSuspensionForce___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumSuspensionForce;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __52__SCNPhysicsVehicleWheel_setMaximumSuspensionForce___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 268) = result;
  return result;
}

- (SCNVector3)connectionPosition
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_connectionPosition.x;
  y = self->_connectionPosition.y;
  z = self->_connectionPosition.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setConnectionPosition:(SCNVector3)connectionPosition
{
  SCNPhysicsVehicle *vehicle;
  float z;
  float y;
  float x;
  id v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  self->_connectionPosition = connectionPosition;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    z = connectionPosition.z;
    y = connectionPosition.y;
    x = connectionPosition.x;
    v8 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__SCNPhysicsVehicleWheel_setConnectionPosition___block_invoke;
    v9[3] = &unk_1EA59E4C8;
    v9[4] = self;
    v10 = x;
    v11 = y;
    v12 = z;
    objc_msgSend(v8, "_postCommandWithBlock:", v9);
  }
}

float __48__SCNPhysicsVehicleWheel_setConnectionPosition___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  __int128 v3;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)&v3 = *(_QWORD *)(a1 + 40);
  *((_QWORD *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 176) = v3;
  return *(float *)&v3;
}

- (SCNVector3)steeringAxis
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_steeringAxis.x;
  y = self->_steeringAxis.y;
  z = self->_steeringAxis.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSteeringAxis:(SCNVector3)steeringAxis
{
  SCNPhysicsVehicle *vehicle;
  float z;
  float y;
  float x;
  id v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  self->_steeringAxis = steeringAxis;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    z = steeringAxis.z;
    y = steeringAxis.y;
    x = steeringAxis.x;
    v8 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__SCNPhysicsVehicleWheel_setSteeringAxis___block_invoke;
    v9[3] = &unk_1EA59E4C8;
    v9[4] = self;
    v10 = x;
    v11 = y;
    v12 = z;
    objc_msgSend(v8, "_postCommandWithBlock:", v9);
  }
}

float __42__SCNPhysicsVehicleWheel_setSteeringAxis___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  __int128 v3;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)&v3 = *(_QWORD *)(a1 + 40);
  *((_QWORD *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 192) = v3;
  return *(float *)&v3;
}

- (SCNVector3)axle
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_axle.x;
  y = self->_axle.y;
  z = self->_axle.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAxle:(SCNVector3)axle
{
  SCNPhysicsVehicle *vehicle;
  float z;
  float y;
  float x;
  id v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  self->_axle = axle;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    z = axle.z;
    y = axle.y;
    x = axle.x;
    v8 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__SCNPhysicsVehicleWheel_setAxle___block_invoke;
    v9[3] = &unk_1EA59E4C8;
    v9[4] = self;
    v10 = x;
    v11 = y;
    v12 = z;
    objc_msgSend(v8, "_postCommandWithBlock:", v9);
  }
}

float __34__SCNPhysicsVehicleWheel_setAxle___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  __int128 v3;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)&v3 = *(_QWORD *)(a1 + 40);
  *((_QWORD *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 208) = v3;
  return *(float *)&v3;
}

- (CGFloat)radius
{
  return self->_radius;
}

- (void)setRadius:(CGFloat)radius
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_radius = radius;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPhysicsVehicleWheel_setRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = radius;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __36__SCNPhysicsVehicleWheel_setRadius___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 232) = result;
  return result;
}

- (CGFloat)suspensionRestLength
{
  return self->_suspensionRestLength;
}

- (void)setSuspensionRestLength:(CGFloat)suspensionRestLength
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[6];

  self->_suspensionRestLength = suspensionRestLength;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNPhysicsVehicleWheel_setSuspensionRestLength___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionRestLength;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

float __50__SCNPhysicsVehicleWheel_setSuspensionRestLength___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo;
  float result;

  WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 224) = result;
  return result;
}

- (BOOL)isFront
{
  return self->_isFront;
}

- (void)setIsFront:(BOOL)a3
{
  SCNPhysicsVehicle *vehicle;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  self->_isFront = a3;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    v6 = -[SCNPhysicsVehicle physicsWorld](vehicle, "physicsWorld");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNPhysicsVehicleWheel_setIsFront___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = a3;
    objc_msgSend(v6, "_postCommandWithBlock:", v7);
  }
}

uint64_t __37__SCNPhysicsVehicleWheel_setIsFront___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "btVehicle"), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(result + 280) = *(_BYTE *)(a1 + 40);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNPhysicsVehicleWheel *v5;

  v5 = +[SCNPhysicsVehicleWheel wheelWithNode:](SCNPhysicsVehicleWheel, "wheelWithNode:", self->_node);
  -[SCNPhysicsVehicleWheel suspensionStiffness](self, "suspensionStiffness");
  -[SCNPhysicsVehicleWheel setSuspensionStiffness:](v5, "setSuspensionStiffness:");
  -[SCNPhysicsVehicleWheel suspensionCompression](self, "suspensionCompression");
  -[SCNPhysicsVehicleWheel setSuspensionCompression:](v5, "setSuspensionCompression:");
  -[SCNPhysicsVehicleWheel suspensionDamping](self, "suspensionDamping");
  -[SCNPhysicsVehicleWheel setSuspensionDamping:](v5, "setSuspensionDamping:");
  -[SCNPhysicsVehicleWheel maximumSuspensionTravel](self, "maximumSuspensionTravel");
  -[SCNPhysicsVehicleWheel setMaximumSuspensionTravel:](v5, "setMaximumSuspensionTravel:");
  -[SCNPhysicsVehicleWheel frictionSlip](self, "frictionSlip");
  -[SCNPhysicsVehicleWheel setFrictionSlip:](v5, "setFrictionSlip:");
  -[SCNPhysicsVehicleWheel maximumSuspensionForce](self, "maximumSuspensionForce");
  -[SCNPhysicsVehicleWheel setMaximumSuspensionForce:](v5, "setMaximumSuspensionForce:");
  -[SCNPhysicsVehicleWheel connectionPosition](self, "connectionPosition");
  -[SCNPhysicsVehicleWheel setConnectionPosition:](v5, "setConnectionPosition:");
  -[SCNPhysicsVehicleWheel steeringAxis](self, "steeringAxis");
  -[SCNPhysicsVehicleWheel setSteeringAxis:](v5, "setSteeringAxis:");
  -[SCNPhysicsVehicleWheel axle](self, "axle");
  -[SCNPhysicsVehicleWheel setAxle:](v5, "setAxle:");
  -[SCNPhysicsVehicleWheel radius](self, "radius");
  -[SCNPhysicsVehicleWheel setRadius:](v5, "setRadius:");
  -[SCNPhysicsVehicleWheel suspensionRestLength](self, "suspensionRestLength");
  -[SCNPhysicsVehicleWheel setSuspensionRestLength:](v5, "setSuspensionRestLength:");
  -[SCNPhysicsVehicleWheel setIsFront:](v5, "setIsFront:", -[SCNPhysicsVehicleWheel isFront](self, "isFront"));
  return v5;
}

- (id)copy
{
  return -[SCNPhysicsVehicleWheel copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  SCNNode *node;
  SCNPhysicsVehicle *vehicle;

  node = self->_node;
  if (node)
    objc_msgSend(a3, "encodeObject:forKey:", node, CFSTR("node"));
  vehicle = self->_vehicle;
  if (vehicle)
    objc_msgSend(a3, "encodeObject:forKey:", vehicle, CFSTR("vehicle"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_wheelIndex, CFSTR("wheelIndex"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("suspensionStiffness"), self->_suspensionStiffness);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("suspensionCompression"), self->_suspensionCompression);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("suspensionDamping"), self->_suspensionDamping);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("maximumSuspensionTravel"), self->_maximumSuspensionTravel);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frictionSlip"), self->_frictionSlip);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("maximumSuspensionForce"), self->_maximumSuspensionForce);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("connectionPosition"), self->_connectionPosition.x, self->_connectionPosition.y, self->_connectionPosition.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("steeringAxis"), self->_steeringAxis.x, self->_steeringAxis.y, self->_steeringAxis.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("axle"), self->_axle.x, self->_axle.y, self->_axle.z);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("radius"), self->_radius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("suspensionRestLength"), self->_suspensionRestLength);
  objc_msgSend(a3, "encodeBool:forKey:", self->_isFront, CFSTR("isFront"));
}

- (SCNPhysicsVehicleWheel)initWithCoder:(id)a3
{
  SCNPhysicsVehicleWheel *v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsVehicleWheel;
  v4 = -[SCNPhysicsVehicleWheel init](&v10, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNPhysicsVehicleWheel setNode:](v4, "setNode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("node")));
    v4->_vehicle = (SCNPhysicsVehicle *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicle"));
    v4->_wheelIndex = objc_msgSend(a3, "decodeIntForKey:", CFSTR("wheelIndex"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("suspensionStiffness"));
    -[SCNPhysicsVehicleWheel setSuspensionStiffness:](v4, "setSuspensionStiffness:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("suspensionCompression"));
    -[SCNPhysicsVehicleWheel setSuspensionCompression:](v4, "setSuspensionCompression:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("suspensionDamping"));
    -[SCNPhysicsVehicleWheel setSuspensionDamping:](v4, "setSuspensionDamping:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("maximumSuspensionTravel"));
    -[SCNPhysicsVehicleWheel setMaximumSuspensionTravel:](v4, "setMaximumSuspensionTravel:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frictionSlip"));
    -[SCNPhysicsVehicleWheel setFrictionSlip:](v4, "setFrictionSlip:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("maximumSuspensionForce"));
    -[SCNPhysicsVehicleWheel setMaximumSuspensionForce:](v4, "setMaximumSuspensionForce:");
    *(float *)&v6 = SCNDecodeVector3(a3, (uint64_t)CFSTR("connectionPosition"));
    -[SCNPhysicsVehicleWheel setConnectionPosition:](v4, "setConnectionPosition:", v6);
    *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("steeringAxis"));
    -[SCNPhysicsVehicleWheel setSteeringAxis:](v4, "setSteeringAxis:", v7);
    *(float *)&v8 = SCNDecodeVector3(a3, (uint64_t)CFSTR("axle"));
    -[SCNPhysicsVehicleWheel setAxle:](v4, "setAxle:", v8);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("radius"));
    -[SCNPhysicsVehicleWheel setRadius:](v4, "setRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("suspensionRestLength"));
    -[SCNPhysicsVehicleWheel setSuspensionRestLength:](v4, "setSuspensionRestLength:");
    -[SCNPhysicsVehicleWheel setIsFront:](v4, "setIsFront:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isFront")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setVehicle:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: attaching a single wheel to multiple vehicle is not supported", v1, 2u);
}

@end
