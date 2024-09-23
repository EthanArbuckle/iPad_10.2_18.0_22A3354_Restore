@implementation _GCNintendoFusedJoyConHapticDriver

- (_GCNintendoFusedJoyConHapticDriver)initWithDevice:(id)a3
{
  id v4;
  _GCNintendoFusedJoyConHapticDriver *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _GCDriverClientInterface *leftDriver;
  void *v10;
  void *v11;
  uint64_t v12;
  _GCDriverClientInterface *rightDriver;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCNintendoFusedJoyConHapticDriver;
  v5 = -[_GCNintendoFusedJoyConHapticDriver init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "leftDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "driverConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteProxy");
    v8 = objc_claimAutoreleasedReturnValue();
    leftDriver = v5->_leftDriver;
    v5->_leftDriver = (_GCDriverClientInterface *)v8;

    objc_msgSend(v4, "rightDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "driverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteProxy");
    v12 = objc_claimAutoreleasedReturnValue();
    rightDriver = v5->_rightDriver;
    v5->_rightDriver = (_GCDriverClientInterface *)v12;

  }
  return v5;
}

- (id)getDriver:(unint64_t)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3 < 2)
    v3 = 8;
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)enableHaptics
{
  -[_GCDriverClientInterface enableHaptics](self->_leftDriver, "enableHaptics");
  -[_GCDriverClientInterface enableHaptics](self->_rightDriver, "enableHaptics");
}

- (void)enqueueTransient:(id)a3 hapticMotor:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_GCNintendoFusedJoyConHapticDriver getDriver:](self, "getDriver:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueTransient:hapticMotor:", v6, a4);

}

- (void)setHapticMotor:(unint64_t)a3 frequency:(float)a4 amplitude:(float)a5
{
  double v8;
  double v9;
  id v10;

  -[_GCNintendoFusedJoyConHapticDriver getDriver:](self, "getDriver:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  *(float *)&v9 = a5;
  objc_msgSend(v10, "setHapticMotor:frequency:amplitude:", a3, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDriver, 0);
  objc_storeStrong((id *)&self->_leftDriver, 0);
}

@end
