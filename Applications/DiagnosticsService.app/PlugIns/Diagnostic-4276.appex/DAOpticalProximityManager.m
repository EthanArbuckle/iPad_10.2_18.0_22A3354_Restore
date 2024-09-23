@implementation DAOpticalProximityManager

+ (id)sharedInstance
{
  if (qword_100011C88 != -1)
    dispatch_once(&qword_100011C88, &stru_10000C410);
  return (id)qword_100011C80;
}

- (DAOpticalProximityManager)init
{
  DAOpticalProximityManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAOpticalProximityManager;
  v2 = -[DAOpticalProximityManager init](&v4, "init");
  if (v2)
  {
    v2->_deviceRef = (__MTDevice *)MTDeviceCreateDefault();
    v2->_updating = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[DAOpticalProximityManager deviceRef](self, "deviceRef"))
    CFRelease(-[DAOpticalProximityManager deviceRef](self, "deviceRef"));
  v3.receiver = self;
  v3.super_class = (Class)DAOpticalProximityManager;
  -[DAOpticalProximityManager dealloc](&v3, "dealloc");
}

- (BOOL)opticalSensorPresent
{
  _DWORD v3[2];

  *(_DWORD *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return MTDeviceGetSensorRegionOfType(self->_deviceRef, v3, 3) == 0;
}

- (id)sensorData
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12[8];
  _QWORD v13[7];
  _QWORD v14[7];

  if (!-[DAOpticalProximityManager deviceRef](self, "deviceRef"))
    return 0;
  *(_DWORD *)&v12[3] = 0;
  *(_DWORD *)v12 = 0;
  if (MTDeviceGetSensorRegionOfType(self->_deviceRef, v12, 3))
    return 0;
  v13[0] = CFSTR("sensorType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[0]));
  v14[0] = v4;
  v13[1] = CFSTR("startRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[1]));
  v14[1] = v5;
  v13[2] = CFSTR("rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[2]));
  v14[2] = v6;
  v13[3] = CFSTR("rowSkip");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[3]));
  v14[3] = v7;
  v13[4] = CFSTR("startCol");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[4]));
  v14[4] = v8;
  v13[5] = CFSTR("cols");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[5]));
  v14[5] = v9;
  v13[6] = CFSTR("hardwareColoffset");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12[6]));
  v14[6] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 7));

  return v11;
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  v5 = -[DAOpticalProximityManager isUpdating](self, "isUpdating");
  if ((v5 & 1) == 0)
  {
    -[DAOpticalProximityManager deviceStart](self, "deviceStart");
    -[DAOpticalProximityManager registerProximityChangedCallback](self, "registerProximityChangedCallback");
    -[DAOpticalProximityManager setUpdating:](self, "setUpdating:", 1);
    -[DAOpticalProximityManager setHandler:](self, "setHandler:", v4);
  }

  return v5 ^ 1;
}

- (BOOL)stopProximitySensorUpdates
{
  _BOOL4 v3;

  v3 = -[DAOpticalProximityManager isUpdating](self, "isUpdating");
  if (v3)
  {
    -[DAOpticalProximityManager deviceStop](self, "deviceStop");
    -[DAOpticalProximityManager unregisterProximityChangedCallback](self, "unregisterProximityChangedCallback");
    -[DAOpticalProximityManager setUpdating:](self, "setUpdating:", 0);
    -[DAOpticalProximityManager setHandler:](self, "setHandler:", 0);
  }
  return v3;
}

- (void)deviceStart
{
  MTDeviceStart(-[DAOpticalProximityManager deviceRef](self, "deviceRef"), 0x10000000);
  -[DAOpticalProximityManager deviceSetDataStream:](self, "deviceSetDataStream:", 1);
}

- (void)deviceStop
{
  MTDeviceStop(-[DAOpticalProximityManager deviceRef](self, "deviceRef"));
  -[DAOpticalProximityManager deviceSetDataStream:](self, "deviceSetDataStream:", 2);
}

- (void)deviceSetDataStream:(unsigned __int8)a3
{
  unsigned __int8 v3;

  v3 = a3;
  MTDeviceSetReport(-[DAOpticalProximityManager deviceRef](self, "deviceRef"), 172, &v3, 1);
}

- (void)registerProximityChangedCallback
{
  MTRegisterOpticalProximityChangedCallback(-[DAOpticalProximityManager deviceRef](self, "deviceRef"), MTProximityChangedCallbackFunc, 0);
}

- (void)unregisterProximityChangedCallback
{
  MTUnregisterOpticalProximityChangedCallback(-[DAOpticalProximityManager deviceRef](self, "deviceRef"), MTProximityChangedCallbackFunc);
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3;
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v3 = *(_QWORD *)&a3;
  v5 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue(-[DAOpticalProximityManager handler](self, "handler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5[2](v5, v3, v4);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
