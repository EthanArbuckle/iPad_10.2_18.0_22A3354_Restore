@implementation _GCAppleTVRemoteMotionProfile

- (_GCAppleTVRemoteMotionProfile)initWithController:(id)a3
{
  id v4;
  _GCAppleTVRemoteMotionProfile *v5;
  _GCAppleTVRemoteMotionProfile *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCAppleTVRemoteMotionProfile;
  v5 = -[_GCAppleTVRemoteMotionProfile init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_linkedOnOrAfterCompassFeature = 0;
    dyld_get_active_platform();
    v6->_linkedOnOrAfterCompassFeature = dyld_program_sdk_at_least();
    v6->_motionLite = objc_msgSend(v4, "isATVRemote");
    if (v6->_linkedOnOrAfterCompassFeature)
      v6->_compassEnabled = objc_msgSend(v4, "physicalDeviceUsesCompass");
    objc_storeWeak((id *)&v6->_controller, v4);
    v6->_gravity.x = 0.0;
    v6->_gravity.y = 0.0;
    v6->_gravity.z = -1.0;
    v6->_prevGravity.x = 0.0;
    v6->_prevGravity.y = 0.0;
    v6->_prevGravity.z = -1.0;
    v6->_userAcceleration.y = 0.0;
    v6->_userAcceleration.z = 0.0;
    v6->_userAcceleration.x = 0.0;
    v6->_attitude.x = 0.0;
    v6->_attitude.y = 0.0;
    v6->_attitude.z = 0.0;
    v6->_attitude.w = 1.0;
    v6->_eulerAngles.yaw = 0.0;
    v6->_eulerAngles.roll = 0.0;
    v6->_eulerAngles.pitch = 0.0;
    v6->_rotationRate.y = 0.0;
    v6->_rotationRate.z = 0.0;
    v6->_rotationRate.x = 0.0;
    v6->_tip = 0.0;
    v6->_tilt = 0.0;
    v6->_motionUpdatedEnabled = 0;
    v6->_paused = 0;
  }

  return v6;
}

- (void)_setMotionLite:(BOOL)a3
{
  self->_motionLite = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_userAcceleration.x;
  y = self->_userAcceleration.y;
  z = self->_userAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (BOOL)hasGravityAndUserAcceleration
{
  return 1;
}

- (void)_setCompassEnabled:(BOOL)a3
{
  self->_compassEnabled = a3;
}

- (BOOL)hasAttitudeAndRotationRate
{
  return self->_compassEnabled;
}

- (BOOL)hasAttitude
{
  return self->_compassEnabled;
}

- (BOOL)hasRotationRate
{
  return self->_compassEnabled;
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

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
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

- (id)valueChangedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_valueChangedHandler, a2);
}

- (void)setValueChangedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_GCAppleTVRemoteMotionProfile controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke;
    block[3] = &unk_24D2B6658;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    v11 = v4;
    dispatch_async(v6, block);

    v5 = v11;
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke_2;
    v8[3] = &unk_24D2B4268;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    dispatch_async(v6, v8);

  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

- (id)internalValueChangedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_internalValueChangedHandler, a2);
}

- (void)setInternalValueChangedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_GCAppleTVRemoteMotionProfile controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke;
    block[3] = &unk_24D2B6658;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    v11 = v4;
    dispatch_async(v6, block);

    v5 = v11;
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke_2;
    v8[3] = &unk_24D2B4268;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    dispatch_async(v6, v8);

  }
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

- (BOOL)isEmulatedMicroGamepad
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_GCAppleTVRemoteMotionProfile controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_GCAppleTVRemoteMotionProfile controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isForwarded");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_motionLiteFusedHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke;
  v4[3] = &unk_24D2B66A0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x2199DEBB0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)_isUpdatingDeviceMotion
{
  return self->_motionMgr != 0;
}

- (void)_setGravity:(id)a3
{
  self->_gravity = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setUserAcceleration:(id)a3
{
  self->_userAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (void)_setAttitude:(GCQuaternion)a3
{
  self->_attitude = a3;
}

- (void)_setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (id)controller
{
  return objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong(&self->_internalValueChangedHandler, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
  objc_storeStrong((id *)&self->_motionMgr, 0);
}

@end
