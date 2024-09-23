@implementation GCMotion

- (GCMotion)initWithController:(id)a3
{
  id v4;
  char *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCMotion;
  v5 = -[GCMotion init](&v7, sel_init);
  if (v5)
  {
    v5[232] = objc_msgSend(v4, "isATVRemote");
    v5[233] = objc_msgSend(v4, "physicalDeviceUsesCompass");
    objc_storeWeak((id *)v5 + 32, v4);
    *((_QWORD *)v5 + 2) = 0;
    *((_QWORD *)v5 + 3) = 0;
    *((_QWORD *)v5 + 4) = 0xBFF0000000000000;
    *((_QWORD *)v5 + 5) = 0;
    *((_QWORD *)v5 + 6) = 0;
    *((_QWORD *)v5 + 7) = 0;
    *((_QWORD *)v5 + 11) = 0;
    *((_QWORD *)v5 + 12) = 0;
    *((_QWORD *)v5 + 13) = 0;
    *((_QWORD *)v5 + 14) = 0x3FF0000000000000;
    *((_QWORD *)v5 + 20) = 0;
    *((_QWORD *)v5 + 21) = 0;
    *((_QWORD *)v5 + 19) = 0;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
  }

  return (GCMotion *)v5;
}

- (GCMotion)initWithIdentifier:(id)a3
{
  id v5;
  GCMotion *v6;
  GCMotion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCMotion;
  v6 = -[GCMotion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_gravity.x = 0.0;
    v7->_gravity.y = 0.0;
    v7->_gravity.z = -1.0;
    v7->_userAcceleration.x = 0.0;
    v7->_userAcceleration.y = 0.0;
    v7->_userAcceleration.z = 0.0;
    v7->_attitude.x = 0.0;
    v7->_attitude.y = 0.0;
    v7->_attitude.z = 0.0;
    v7->_attitude.w = 1.0;
    v7->_eulerAngles.yaw = 0.0;
    v7->_eulerAngles.roll = 0.0;
    v7->_eulerAngles.pitch = 0.0;
    *(_OWORD *)&v7->_rotationRate.x = 0u;
    *(_OWORD *)&v7->_rotationRate.z = 0u;
  }

  return v7;
}

- (BOOL)sensorsRequireManualActivation
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setSensorsActive:(BOOL)sensorsActive
{
  _BOOL8 v3;
  GCController **p_controller;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = sensorsActive;
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v8, "motionConfigurableSensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSensorsActive:", v3);

  }
}

- (BOOL)sensorsActive
{
  GCController **p_controller;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  char v7;

  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  v5 = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(v5, "motionConfigurableSensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sensorsActive");

  return v7;
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void)_setMotionLite:(BOOL)a3
{
  self->_motionLite = a3;
}

- (BOOL)hasGravityAndUserAcceleration
{
  return 0;
}

- (GCAcceleration)gravity
{
  double x;
  double y;
  double z;
  GCAcceleration result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (GCAcceleration)userAcceleration
{
  double x;
  double y;
  double z;
  GCAcceleration result;

  x = self->_userAcceleration.x;
  y = self->_userAcceleration.y;
  z = self->_userAcceleration.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (GCAcceleration)acceleration
{
  double v3;
  double v4;
  double v5;
  double x;
  double v7;
  double v8;
  double v9;
  double y;
  double v11;
  double v12;
  double v13;
  double z;
  double v15;
  double v16;
  GCAcceleration result;

  if (-[GCMotion hasGravityAndUserAcceleration](self, "hasGravityAndUserAcceleration"))
  {
    -[GCMotion gravity](self, "gravity");
    v4 = v3;
    -[GCMotion userAcceleration](self, "userAcceleration");
    x = v4 + v5;
    -[GCMotion gravity](self, "gravity");
    v8 = v7;
    -[GCMotion userAcceleration](self, "userAcceleration");
    y = v8 + v9;
    -[GCMotion gravity](self, "gravity");
    v12 = v11;
    -[GCMotion userAcceleration](self, "userAcceleration");
    z = v12 + v13;
  }
  else
  {
    x = self->_acceleration.x;
    y = self->_acceleration.y;
    z = self->_acceleration.z;
  }
  v15 = x;
  v16 = y;
  result.z = z;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_setCompassEnabled:(BOOL)a3
{
  self->_compassEnabled = a3;
}

- (BOOL)hasAttitude
{
  return self->_hasAttitude || self->_compassEnabled;
}

- (void)_setHasAttitude:(BOOL)a3
{
  self->_hasAttitude = a3;
  if (!a3)
    -[GCMotion _setAttitude:](self, "_setAttitude:", 0.0, 0.0, 0.0, 0.0);
}

- (BOOL)hasRotationRate
{
  return self->_hasRotationRate || self->_compassEnabled;
}

- (void)_setHasRotationRate:(BOOL)a3
{
  self->_hasRotationRate = a3;
  if (!a3)
    -[GCMotion _setRotationRate:](self, "_setRotationRate:", 0.0, 0.0, 0.0);
}

- (BOOL)hasAttitudeAndRotationRate
{
  if (self->_compassEnabled)
    return 1;
  if (self->_hasAttitude)
    return self->_hasRotationRate;
  return 0;
}

- (GCQuaternion)attitude
{
  double x;
  double y;
  double z;
  double w;
  GCQuaternion result;

  x = self->_attitude.x;
  y = self->_attitude.y;
  z = self->_attitude.z;
  w = self->_attitude.w;
  result.w = w;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (GCRotationRate)rotationRate
{
  double x;
  double y;
  double z;
  GCRotationRate result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (float)_tip
{
  return self->_tip;
}

- (float)_tilt
{
  return self->_tilt;
}

- (GCMotionValueChangedHandler)valueChangedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_valueChangedHandler, a2);
}

- (void)setValueChangedHandler:(GCMotionValueChangedHandler)valueChangedHandler
{
  GCMotionValueChangedHandler v4;
  void *v5;
  NSObject *v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = valueChangedHandler;
  objc_initWeak(&location, self);
  -[GCMotion controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__GCMotion_setValueChangedHandler___block_invoke;
    block[3] = &unk_24D2B4828;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_async(v6, block);

    v5 = v11;
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__GCMotion_setValueChangedHandler___block_invoke_2;
    v8[3] = &unk_24D2B2C50;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);

  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

void __35__GCMotion_setValueChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)WeakRetained[30];
    WeakRetained[30] = v2;

  }
}

void __35__GCMotion_setValueChangedHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[30];
    WeakRetained[30] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)isEmulatedMicroGamepad
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[GCMotion controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GCMotion controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isForwarded");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setGravity:(id)a3
{
  self->_gravity = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setUserAcceleration:(id)a3
{
  self->_userAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAcceleration:(id)a3
{
  self->_acceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAttitude:(GCQuaternion)a3
{
  self->_attitude = a3;
}

- (void)_setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (BOOL)_isUpdatingDeviceMotion
{
  return 0;
}

- (void)setGravity:(GCAcceleration)gravity
{
  double z;
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  z = gravity.z;
  y = gravity.y;
  x = gravity.x;
  -[GCMotion controller](self, "controller");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[GCMotion controller](self, "controller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isSnapshot"),
        v9,
        v8,
        v10))
  {
    self->_gravity.x = x;
    self->_gravity.y = y;
    self->_gravity.z = z;
  }
}

- (void)setUserAcceleration:(GCAcceleration)userAcceleration
{
  double z;
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  z = userAcceleration.z;
  y = userAcceleration.y;
  x = userAcceleration.x;
  -[GCMotion controller](self, "controller");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[GCMotion controller](self, "controller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isSnapshot"),
        v9,
        v8,
        v10))
  {
    self->_userAcceleration.x = x;
    self->_userAcceleration.y = y;
    self->_userAcceleration.z = z;
  }
}

- (void)setAcceleration:(GCAcceleration)acceleration
{
  double z;
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  z = acceleration.z;
  y = acceleration.y;
  x = acceleration.x;
  -[GCMotion controller](self, "controller");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[GCMotion controller](self, "controller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isSnapshot"),
        v9,
        v8,
        v10))
  {
    self->_acceleration.x = x;
    self->_acceleration.y = y;
    self->_acceleration.z = z;
  }
}

- (void)setAttitude:(GCQuaternion)attitude
{
  double w;
  double z;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  w = attitude.w;
  z = attitude.z;
  y = attitude.y;
  x = attitude.x;
  -[GCMotion controller](self, "controller");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[GCMotion controller](self, "controller"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isSnapshot"),
        v10,
        v9,
        v11))
  {
    self->_attitude.x = x;
    self->_attitude.y = y;
    self->_attitude.z = z;
    self->_attitude.w = w;
  }
}

- (void)setRotationRate:(GCRotationRate)rotationRate
{
  double z;
  double y;
  double x;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  z = rotationRate.z;
  y = rotationRate.y;
  x = rotationRate.x;
  -[GCMotion controller](self, "controller");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[GCMotion controller](self, "controller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isSnapshot"),
        v9,
        v8,
        v10))
  {
    self->_rotationRate.x = x;
    self->_rotationRate.y = y;
    self->_rotationRate.z = z;
  }
}

- (void)setStateFromMotion:(GCMotion *)motion
{
  GCMotion *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = motion;
  -[GCMotion controller](self, "controller");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[GCMotion controller](self, "controller"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isSnapshot"),
        v7,
        v6,
        v8))
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(WeakRetained, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCMotion controller](v4, "controller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "debugName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "set %@ StateFromMotion %@", buf, 0x16u);

      }
    }
    -[GCMotion gravity](v4, "gravity");
    -[GCMotion setGravity:](self, "setGravity:");
    -[GCMotion userAcceleration](v4, "userAcceleration");
    -[GCMotion setUserAcceleration:](self, "setUserAcceleration:");
    -[GCMotion acceleration](v4, "acceleration");
    -[GCMotion setAcceleration:](self, "setAcceleration:");
    -[GCMotion attitude](v4, "attitude");
    -[GCMotion setAttitude:](self, "setAttitude:");
    -[GCMotion rotationRate](v4, "rotationRate");
    -[GCMotion setRotationRate:](self, "setRotationRate:");
    -[GCMotion controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handlerQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__GCMotion_setStateFromMotion___block_invoke;
    block[3] = &unk_24D2B2B20;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

void __31__GCMotion_setStateFromMotion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

- (GCController)controller
{
  return (GCController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (id)identifier
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong(&self->_valueChangedHandler, 0);
  objc_storeStrong(&self->_motionEventObservation, 0);
}

- (void)setMotionEventSource:(id)a3
{
  id motionEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  motionEventObservation = self->_motionEventObservation;
  self->_motionEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__GCMotion_PubSub__setMotionEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCMotionEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeMotionEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_motionEventObservation;
  self->_motionEventObservation = v6;

}

void __41__GCMotion_PubSub__setMotionEventSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v3, "hasGyro"))
    {
      objc_msgSend(v3, "gyroPitch");
      v6 = v5;
      objc_msgSend(v3, "gyroYaw");
      v8 = v7;
      objc_msgSend(v3, "gyroRoll");
      objc_msgSend(*(id *)(a1 + 32), "_setRotationRate:", v6, v8, v9);
    }
    if (objc_msgSend(v3, "hasAccelerometer") && (objc_msgSend(v3, "hasAttitude") & 1) == 0)
    {
      objc_msgSend(v3, "accelerometerX");
      v11 = v10;
      objc_msgSend(v3, "accelerometerY");
      v13 = v12;
      objc_msgSend(v3, "accelerometerZ");
      objc_msgSend(*(id *)(a1 + 32), "_setAcceleration:", v11, v13, v14);
    }
    if (objc_msgSend(v3, "hasAttitude"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_setUserAcceleration:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setAcceleration:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setGravity:", 0.0, 0.0, 0.0);
      objc_msgSend(*(id *)(a1 + 32), "_setAttitude:", 0.0, 0.0, 0.0, 0.0);
      +[NSException raise:format:](&off_254DEE1B8, "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Support for game controllers with attitude is not implemented."));
    }
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v15, "valueChangedHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handlerQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __41__GCMotion_PubSub__setMotionEventSource___block_invoke_2;
    v19[3] = &unk_24D2B2CA0;
    v19[4] = v15;
    v20 = v16;
    v18 = v16;
    dispatch_async(v17, v19);

  }
}

uint64_t __41__GCMotion_PubSub__setMotionEventSource___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCMotion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GCMotion *v7;

  v4 = a3;
  GCIPCObjectIdentifier_Classes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GCMotion initWithIdentifier:](self, "initWithIdentifier:", v6);
  if (v7)
  {
    v7->_hasAttitude = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAttitude"));
    v7->_hasRotationRate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRotationRate"));
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GCMotion identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[GCMotion hasAttitude](self, "hasAttitude"), CFSTR("hasAttitude"));
  objc_msgSend(v5, "encodeBool:forKey:", -[GCMotion hasRotationRate](self, "hasRotationRate"), CFSTR("hasRotationRate"));

}

@end
