@implementation SCNPhysicsVehicle

- (void)_initializeWheelsArray
{
  NSArray *wheels;
  _QWORD v3[5];

  wheels = self->_wheels;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SCNPhysicsVehicle__initializeWheelsArray__block_invoke;
  v3[3] = &unk_1EA5A4F68;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](wheels, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __43__SCNPhysicsVehicle__initializeWheelsArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "_setVehicle:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(a2, "_setWheelIndex:", a3);
}

- (SCNPhysicsVehicle)initWithChassisBody:(id)a3 wheels:(id)a4
{
  SCNPhysicsVehicle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsVehicle;
  v6 = -[SCNPhysicsVehicle init](&v8, sel_init);
  if (v6)
  {
    v6->_chassisBody = (SCNPhysicsBody *)a3;
    v6->_wheels = (NSArray *)objc_msgSend(a4, "copy");
    -[SCNPhysicsVehicle _initializeWheelsArray](v6, "_initializeWheelsArray");
  }
  return v6;
}

+ (SCNPhysicsVehicle)vehicleWithChassisBody:(SCNPhysicsBody *)chassisBody wheels:(NSArray *)wheels
{
  return (SCNPhysicsVehicle *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithChassisBody:wheels:", chassisBody, wheels);
}

- (void)dealloc
{
  NSArray *wheels;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  wheels = self->_wheels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](wheels, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(wheels);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_setVehicle:", 0);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](wheels, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsVehicle;
  -[SCNPhysicsVehicle dealloc](&v8, sel_dealloc);
}

- (SCNPhysicsBody)chassisBody
{
  return self->_chassisBody;
}

- (NSArray)wheels
{
  return (NSArray *)(id)-[NSArray copy](self->_wheels, "copy");
}

- (void)btVehicle
{
  return self->_vehicle;
}

- (id)physicsWorld
{
  return self->_world;
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  SCNPhysicsWorld *world;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  world = self->_world;
  if (world)
    v7 = world == a3;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNPhysicsVehicle _addToPhysicsWorld:definition:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  self->_world = (SCNPhysicsWorld *)a3;
  -[SCNPhysicsVehicle _handleCreateIfNeeded:](self, "_handleCreateIfNeeded:", 1);
  v16 = -[SCNPhysicsWorld _handle](self->_world, "_handle");
  if (self->_vehicle)
    v17 = v16 == 0;
  else
    v17 = 1;
  if (!v17)
    (*(void (**)(void *))(*(_QWORD *)v16 + 248))(v16);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  uint64_t v4;
  void *vehicle;

  if (self->_vehicle)
  {
    v4 = objc_msgSend(a3, "_handle");
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v4 + 256))(v4, self->_vehicle);
    vehicle = self->_vehicle;
    if (vehicle)
      (*(void (**)(void *))(*(_QWORD *)vehicle + 8))(vehicle);
    self->_vehicle = 0;
  }
}

- (void)setSteeringAngle:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  SCNPhysicsWorld *world;
  _QWORD v5[7];

  world = self->_world;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SCNPhysicsVehicle_setSteeringAngle_forWheelAtIndex___block_invoke;
  v5[3] = &unk_1EA5A15E8;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v5);
}

uint64_t __54__SCNPhysicsVehicle_setSteeringAngle_forWheelAtIndex___block_invoke(uint64_t result)
{
  float v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = *(double *)(result + 40);
    return btRaycastVehicle::setSteeringValue(*(_QWORD *)(*(_QWORD *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)applyEngineForce:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  SCNPhysicsWorld *world;
  _QWORD v5[7];

  world = self->_world;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SCNPhysicsVehicle_applyEngineForce_forWheelAtIndex___block_invoke;
  v5[3] = &unk_1EA5A15E8;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v5);
}

uint64_t __54__SCNPhysicsVehicle_applyEngineForce_forWheelAtIndex___block_invoke(uint64_t result)
{
  float v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = *(double *)(result + 40);
    return btRaycastVehicle::applyEngineForce(*(_QWORD *)(*(_QWORD *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)applyBrakingForce:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  SCNPhysicsWorld *world;
  _QWORD v5[7];

  world = self->_world;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SCNPhysicsVehicle_applyBrakingForce_forWheelAtIndex___block_invoke;
  v5[3] = &unk_1EA5A15E8;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  -[SCNPhysicsWorld _postCommandWithBlock:](world, "_postCommandWithBlock:", v5);
}

uint64_t __55__SCNPhysicsVehicle_applyBrakingForce_forWheelAtIndex___block_invoke(uint64_t result)
{
  float v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = *(double *)(result + 40);
    return btRaycastVehicle::setBrake(*(_QWORD *)(*(_QWORD *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)_createWheel:(id)a3
{
  void *vehicle;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  double v26;
  float v27;
  double v28;
  float v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;

  vehicle = self->_vehicle;
  objc_msgSend(a3, "suspensionStiffness");
  *(float *)&v5 = v5;
  LODWORD(v34) = LODWORD(v5);
  objc_msgSend(a3, "suspensionCompression");
  *(float *)&v6 = v6;
  HIDWORD(v34) = LODWORD(v6);
  objc_msgSend(a3, "suspensionDamping");
  *(float *)&v7 = v7;
  v35 = LODWORD(v7);
  objc_msgSend(a3, "frictionSlip");
  *(float *)&v8 = v8 * 10.5;
  v37 = LODWORD(v8);
  objc_msgSend(a3, "maximumSuspensionForce");
  *(float *)&v9 = v9;
  v38 = LODWORD(v9);
  objc_msgSend(a3, "maximumSuspensionTravel");
  *(float *)&v10 = v10;
  v36 = LODWORD(v10);
  objc_msgSend(a3, "steeringAxis");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(a3, "axle");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(a3, "connectionPosition");
  objc_msgSend(a3, "suspensionRestLength", __PAIR64__(v20, v18), v22, __PAIR64__(v14, v12), v16, __PAIR64__(v25, v24), v23);
  v27 = v26;
  objc_msgSend(a3, "radius");
  v29 = v28;
  v30 = btRaycastVehicle::addWheel((uint64_t)vehicle, &v33, &v32, &v31, &v34, objc_msgSend(a3, "isFront"), v27, v29);
  *(_QWORD *)(v30 + 288) = objc_msgSend((id)objc_msgSend(a3, "node"), "nodeRef");
}

- (void)_handleCreateIfNeeded:(BOOL)a3
{
  btCollisionObject *v4;
  btCollisionObject *v5;
  btVehicleRaycaster *v6;
  void *v7;
  NSArray *wheels;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_vehicle)
  {
    if (-[SCNPhysicsBody sceneRef](self->_chassisBody, "sceneRef"))
    {
      v4 = -[SCNPhysicsBody _handle](self->_chassisBody, "_handle");
      if (v4)
      {
        v5 = v4;
        btCollisionObject::setActivationState(v4, 4);
        v6 = -[SCNPhysicsWorld _defaultVehicleRayCaster](self->_world, "_defaultVehicleRayCaster");
        *(_OWORD *)buf = xmmword_1DD02C630;
        v26 = 0x45BB800041280000;
        v7 = (void *)operator new();
        btRaycastVehicle::btRaycastVehicle(v7, buf, v5, v6);
        self->_vehicle = v7;
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v7 + 48))(v7, 0, 1, 2);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        wheels = self->_wheels;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](wheels, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(wheels);
              -[SCNPhysicsVehicle _createWheel:](self, "_createWheel:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](wheels, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
          }
          while (v9);
        }
      }
      else
      {
        v20 = scn_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCB8000, v20, OS_LOG_TYPE_DEFAULT, "Warning: Chassis should already have a body", buf, 2u);
        }
      }
    }
    else
    {
      v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SCNPhysicsVehicle _handleCreateIfNeeded:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_update
{
  float *vehicle;
  int v4;
  int i;
  uint64_t WheelInfo;
  float32x4_t *v7;
  float32x4_t *Parent;
  simd_float4x4 *WorldMatrix;
  int32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  __int128 v13;
  int8x16_t v14;
  __int128 v15;
  _OWORD v16[4];
  _OWORD v17[3];
  uint64_t v18;
  int v19;
  int v20;
  simd_float4x4 v21;

  vehicle = (float *)self->_vehicle;
  if (vehicle)
  {
    v4 = *((_DWORD *)vehicle + 51);
    if (v4 >= 1)
    {
      for (i = 0; i != v4; ++i)
      {
        btRaycastVehicle::updateWheelTransform((btRaycastVehicle *)self->_vehicle, i, 1);
        WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)self->_vehicle, i);
        v7 = *(float32x4_t **)(WheelInfo + 288);
        Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)v7);
        if (Parent)
        {
          WorldMatrix = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
          C3DMatrix4x4Invert(WorldMatrix, &v21);
          v10 = *(int32x4_t *)(WheelInfo + 112);
          v11 = *(int32x4_t *)(WheelInfo + 128);
          v12 = *(int8x16_t *)(WheelInfo + 144);
          v13 = *(_OWORD *)(WheelInfo + 160);
          v14 = (int8x16_t)vtrn1q_s32(v10, v11);
          *(_QWORD *)&v15 = vextq_s8(v14, v14, 8uLL).u64[0];
          v14.i64[1] = v12.u32[0];
          *(int32x2_t *)v10.i8 = vzip2_s32(*(int32x2_t *)v10.i8, *(int32x2_t *)v11.i8);
          v10.u64[1] = (unint64_t)vzip2_s32(*(int32x2_t *)v12.i8, 0);
          *((_QWORD *)&v15 + 1) = vextq_s8(v12, v12, 8uLL).u32[0];
          v17[0] = v14;
          v17[1] = v10;
          v17[2] = v15;
          v18 = v13;
          v19 = DWORD2(v13);
          v20 = 1065353216;
          C3DMatrix4x4Mult((uint64_t)v17, (float32x4_t *)&v21, v16);
          C3DNodeSetMatrix(v7, (uint64_t)v16);
        }
      }
      vehicle = (float *)self->_vehicle;
    }
    self->_speedKmHour = vehicle[42];
  }
}

- (CGFloat)speedInKilometersPerHour
{
  return self->_speedKmHour;
}

- (BOOL)hasReferenceToPhysicsBody:(id)a3
{
  return -[SCNPhysicsVehicle chassisBody](self, "chassisBody") == a3;
}

- (id)wheelAtIndex:(unint64_t)a3
{
  if (-[NSArray count](self->_wheels, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](self->_wheels, "objectAtIndex:", a3);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v7;
  objc_super v8;
  uint64_t v9;
  id v10;

  if (objc_msgSend(a4, "hasPrefix:", CFSTR("wheel")))
  {
    v9 = 0;
    v10 = 0;
    SCNKitSplitKVCPath(a4, &v10, &v9);
    if (v9)
    {
      v7 = -[SCNPhysicsVehicle wheelAtIndex:](self, "wheelAtIndex:", (int)objc_msgSend((id)objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("wheel"), "length")), "intValue"));
      objc_msgSend(v7, "setValue:forKey:", a3, v9);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SCNPhysicsVehicle;
    -[SCNPhysicsVehicle setValue:forKeyPath:](&v8, sel_setValue_forKeyPath_, a3, a4);
  }
}

- (id)valueForKeyPath:(id)a3
{
  id v5;
  objc_super v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(a3, "hasPrefix:", CFSTR("wheel")))
  {
    v8 = 0;
    v9 = 0;
    SCNKitSplitKVCPath(a3, &v9, &v8);
    if (v8)
    {
      v5 = -[SCNPhysicsVehicle wheelAtIndex:](self, "wheelAtIndex:", (int)objc_msgSend((id)objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("wheel"), "length")), "intValue"));
      return (id)objc_msgSend(v5, "valueForKey:", v8);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNPhysicsVehicle;
    return -[SCNPhysicsVehicle valueForKeyPath:](&v7, sel_valueForKeyPath_, a3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  SCNPhysicsBody *chassisBody;
  NSArray *wheels;

  chassisBody = self->_chassisBody;
  if (chassisBody)
    objc_msgSend(a3, "encodeObject:forKey:", chassisBody, CFSTR("chassisBody"));
  wheels = self->_wheels;
  if (wheels)
    objc_msgSend(a3, "encodeObject:forKey:", wheels, CFSTR("wheels"));
}

- (SCNPhysicsVehicle)initWithCoder:(id)a3
{
  SCNPhysicsVehicle *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsVehicle;
  v4 = -[SCNPhysicsBehavior initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNPhysicsVehicle _customDecodingOfSCNPhysicsVehicle:](v4, "_customDecodingOfSCNPhysicsVehicle:", a3);
    v4->_chassisBody = (SCNPhysicsBody *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chassisBody"));
    v4->_wheels = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("wheels"));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_addToPhysicsWorld:(uint64_t)a3 definition:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: didAddToPhysicsWorld - can't share a physics behavior to multiple world", a5, a6, a7, a8, 0);
}

- (void)_handleCreateIfNeeded:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Can't create a vehicle with this chassis because it is not in the scene yet", a5, a6, a7, a8, 0);
}

@end
