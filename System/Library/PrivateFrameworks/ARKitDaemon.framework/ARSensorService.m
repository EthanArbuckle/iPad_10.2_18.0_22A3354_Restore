@implementation ARSensorService

- (ARSensorService)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ARSensorService *v7;
  uint64_t v8;
  ARRemoteSensorClient *clientProxy;
  objc_super v11;

  v4 = a3;
  ARRemoteSensorServiceInterfaceWithProtocol();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ARRemoteSensorClientInterfaceWithProtocol();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ARSensorService;
  v7 = -[ARDaemonService initWithConnection:exportedInterface:remoteObjectInterface:](&v11, sel_initWithConnection_exportedInterface_remoteObjectInterface_, v4, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "remoteObjectProxy");
    v8 = objc_claimAutoreleasedReturnValue();
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (ARRemoteSensorClient *)v8;

  }
  return v7;
}

- (void)providedDataTypesWithReply:(id)a3
{
  ARSensor *sensor;
  void (**v4)(id, uint64_t, _QWORD);

  sensor = self->_sensor;
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v4[2](v4, -[ARSensor providedDataTypes](sensor, "providedDataTypes"), 0);

}

- (void)start
{
  -[ARSensor start](self->_sensor, "start");
}

- (void)stop
{
  -[ARSensor stop](self->_sensor, "stop");
}

- (void)sensor:(id)a3 didFailWithError:(id)a4
{
  -[ARRemoteSensorClient sensorDidFailWithError:](self->_clientProxy, "sensorDidFailWithError:", a4);
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
  -[ARRemoteSensorClient sensorDidOutputSensorData:](self->_clientProxy, "sensorDidOutputSensorData:", a4);
}

- (void)sensorDidPause:(id)a3
{
  -[ARRemoteSensorClient sensorDidPause](self->_clientProxy, "sensorDidPause", a3);
}

- (void)sensorDidRestart:(id)a3
{
  -[ARRemoteSensorClient sensorDidRestart](self->_clientProxy, "sensorDidRestart", a3);
}

- (void)sensorDidStart:(id)a3
{
  -[ARRemoteSensorClient sensorDidStart](self->_clientProxy, "sensorDidStart", a3);
}

+ (BOOL)isSupported
{
  return 0;
}

- (ARRemoteSensorClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (ARSensor)sensor
{
  return self->_sensor;
}

- (void)setSensor:(id)a3
{
  objc_storeStrong((id *)&self->_sensor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensor, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end
