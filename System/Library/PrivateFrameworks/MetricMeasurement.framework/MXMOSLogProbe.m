@implementation MXMOSLogProbe

+ (MXMProbeableDevice)hostDevice
{
  void *v2;
  void *v3;

  +[MXMOSLogDeviceStore_Internal shared](MXMOSLogDeviceStore_Internal, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MXMProbeableDevice *)v3;
}

+ (NSArray)connectedDevices
{
  void *v2;
  void *v3;
  void *v4;

  +[MXMOSLogDeviceStore_Internal shared](MXMOSLogDeviceStore_Internal, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (MXMOSLogProbe)probeHostOSLog
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "hostDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTargetDevice:", v4);

  return (MXMOSLogProbe *)v5;
}

- (MXMOSLogProbe)initWithTargetDevice:(id)a3
{
  id v4;
  MXMOSLogProbe *v5;
  OSActivityStream *v6;
  OSActivityStream *activityStream;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMOSLogProbe;
  v5 = -[MXMProbe init](&v11, sel_init);
  if (v5)
  {
    v6 = (OSActivityStream *)objc_alloc_init(MEMORY[0x24BE60C58]);
    activityStream = v5->_activityStream;
    v5->_activityStream = v6;

    -[OSActivityStream setDelegate:](v5->_activityStream, "setDelegate:", v5);
    objc_msgSend((id)objc_opt_class(), "hostDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v8) & 1) != 0)
      goto LABEL_6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    objc_msgSend(v4, "rawDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "rawDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSActivityStream setDevice:](v5->_activityStream, "setDevice:", v8);
LABEL_6:

    }
  }

  return v5;
}

- (void)_beginUpdates
{
  -[OSActivityStream start](self->_activityStream, "start");
}

- (void)_stopUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMOSLogProbe;
  -[MXMProbe _stopUpdates](&v3, sel__stopUpdates);
  -[OSActivityStream stop](self->_activityStream, "stop");
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStream, 0);
}

@end
