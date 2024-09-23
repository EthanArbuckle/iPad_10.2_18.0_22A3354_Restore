@implementation DAProximityManager

+ (id)sharedInstance
{
  if (qword_1000BA0A0 != -1)
    dispatch_once(&qword_1000BA0A0, &stru_100080B60);
  return (id)qword_1000BA098;
}

- (DAProximityManager)init
{
  DAProximityManager *v2;
  uint64_t v3;
  DAProximityManager *v4;
  NSDictionary *sensorRegion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *v13;
  unsigned __int8 v15[8];
  objc_super v16;
  _QWORD v17[7];
  _QWORD v18[7];

  v16.receiver = self;
  v16.super_class = (Class)DAProximityManager;
  v2 = -[DAProximityManager init](&v16, "init");
  v4 = v2;
  if (v2)
  {
    v2->_deviceRef = (__MTDevice *)MTDeviceCreateDefault(v2, v3);
    v4->_updating = 0;
    *(_DWORD *)&v15[3] = 0;
    *(_DWORD *)v15 = 0;
    if (MTDeviceGetSensorRegionOfType())
    {
      sensorRegion = v4->_sensorRegion;
      v4->_sensorRegion = (NSDictionary *)&__NSDictionary0__struct;
    }
    else
    {
      v17[0] = CFSTR("sensorType");
      sensorRegion = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[0]));
      v18[0] = sensorRegion;
      v17[1] = CFSTR("startRow");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[1]));
      v18[1] = v6;
      v17[2] = CFSTR("rows");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[2]));
      v18[2] = v7;
      v17[3] = CFSTR("rowSkip");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[3]));
      v18[3] = v8;
      v17[4] = CFSTR("startCol");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[4]));
      v18[4] = v9;
      v17[5] = CFSTR("cols");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[5]));
      v18[5] = v10;
      v17[6] = CFSTR("hardwareColoffset");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[6]));
      v18[6] = v11;
      v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 7));
      v13 = v4->_sensorRegion;
      v4->_sensorRegion = (NSDictionary *)v12;

    }
  }
  return v4;
}

- (void)dealloc
{
  __MTDevice *deviceRef;
  objc_super v4;

  deviceRef = self->_deviceRef;
  if (deviceRef)
    CFRelease(deviceRef);
  v4.receiver = self;
  v4.super_class = (Class)DAProximityManager;
  -[DAProximityManager dealloc](&v4, "dealloc");
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  v5 = -[DAProximityManager updating](self, "updating");
  if ((v5 & 1) == 0)
  {
    -[DAProximityManager deviceStart](self, "deviceStart");
    -[DAProximityManager registerProximityChangedCallback](self, "registerProximityChangedCallback");
    -[DAProximityManager setHandler:](self, "setHandler:", v4);
    -[DAProximityManager setUpdating:](self, "setUpdating:", 1);
  }

  return v5 ^ 1;
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3;
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v3 = *(_QWORD *)&a3;
  v5 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue(-[DAProximityManager handler](self, "handler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5[2](v5, v3, v4);

}

- (BOOL)stopProximitySensorUpdates
{
  _BOOL4 v3;
  void *v4;

  v3 = -[DAProximityManager updating](self, "updating");
  if (v3)
  {
    -[DAProximityManager deviceStop](self, "deviceStop");
    -[DAProximityManager unregisterProximityChangedCallback](self, "unregisterProximityChangedCallback");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self);

    -[DAProximityManager setUpdating:](self, "setUpdating:", 0);
    -[DAProximityManager setHandler:](self, "setHandler:", 0);
  }
  return v3;
}

- (void)deviceStart
{
  MTDeviceStart(-[DAProximityManager deviceRef](self, "deviceRef"), 0x10000000);
  -[DAProximityManager deviceSetDataStream:](self, "deviceSetDataStream:", 1);
}

- (void)deviceStop
{
  MTDeviceStop(-[DAProximityManager deviceRef](self, "deviceRef"));
  -[DAProximityManager deviceSetDataStream:](self, "deviceSetDataStream:", 2);
}

- (void)registerProximityChangedCallback
{
  MTRegisterOpticalProximityChangedCallback(-[DAProximityManager deviceRef](self, "deviceRef"), sub_10002640C, 0);
}

- (void)unregisterProximityChangedCallback
{
  MTUnregisterOpticalProximityChangedCallback(-[DAProximityManager deviceRef](self, "deviceRef"), sub_10002640C);
}

- (void)deviceSetDataStream:(unsigned __int8)a3
{
  unsigned __int8 v3;

  v3 = a3;
  MTDeviceSetReport(-[DAProximityManager deviceRef](self, "deviceRef"), 172, &v3, 1);
}

- (NSDictionary)sensorRegion
{
  return self->_sensorRegion;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (__MTDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(__MTDevice *)a3
{
  self->_deviceRef = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_sensorRegion, 0);
}

@end
