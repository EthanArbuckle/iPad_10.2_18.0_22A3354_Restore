@implementation OSLogDevice

- (OSLogDevice)init
{
  OSLogDevice *v2;
  OSLogDevice *v3;
  SimDevice *simDev;
  NSString *uid;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OSLogDevice;
  v2 = -[OSLogDevice init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_devType = 0;
    v2->_mobileDeviceRef = 0;
    simDev = v2->_simDev;
    v2->_simDev = 0;

    uid = v3->_uid;
    v3->_uid = 0;

  }
  return v3;
}

- (id)description
{
  int64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v3 = -[OSLogDevice devType](self, "devType");
  if (v3 == 2)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogDevice simDev](self, "simDev");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogDevice uid](self, "uid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@(Simulated): %@, %@"), v6, v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (v3 == 1)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[OSLogDevice mobileDeviceRef](self, "mobileDeviceRef");
      -[OSLogDevice uid](self, "uid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(Mobile): %p, %@"), v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[OSLogDevice mobileDeviceRef](self, "mobileDeviceRef");
      -[OSLogDevice simDev](self, "simDev");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSLogDevice uid](self, "uid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(Unknown): %p, %@, %@"), v6, v14, v8, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (OSLogDevice)initWithMobileDevice:(void *)a3 andUDID:(id)a4
{
  NSString *v6;
  OSLogDevice *v7;
  void *v8;
  SimDevice *simDev;
  NSString *uid;

  v6 = (NSString *)a4;
  v7 = -[OSLogDevice init](self, "init");
  v7->_devType = 1;
  if (a3)
    v8 = (void *)CFRetain(a3);
  else
    v8 = 0;
  simDev = v7->_simDev;
  v7->_mobileDeviceRef = v8;
  v7->_simDev = 0;

  uid = v7->_uid;
  v7->_uid = v6;

  return v7;
}

- (OSLogDevice)initWithSimualatedDevice:(id)a3
{
  SimDevice *v4;
  OSLogDevice *v5;
  SimDevice *simDev;
  SimDevice *v7;
  void *v8;
  uint64_t v9;
  NSString *uid;

  v4 = (SimDevice *)a3;
  v5 = -[OSLogDevice init](self, "init");
  v5->_devType = 2;
  v5->_mobileDeviceRef = 0;
  simDev = v5->_simDev;
  v5->_simDev = v4;
  v7 = v4;

  -[SimDevice UDID](v7, "UDID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  uid = v5->_uid;
  v5->_uid = (NSString *)v9;

  return v5;
}

- (void)dealloc
{
  void *mobileDeviceRef;
  objc_super v4;

  mobileDeviceRef = self->_mobileDeviceRef;
  if (mobileDeviceRef)
    CFRelease(mobileDeviceRef);
  v4.receiver = self;
  v4.super_class = (Class)OSLogDevice;
  -[OSLogDevice dealloc](&v4, sel_dealloc);
}

- (int64_t)devType
{
  return self->_devType;
}

- (void)setDevType:(int64_t)a3
{
  self->_devType = a3;
}

- (void)mobileDeviceRef
{
  return self->_mobileDeviceRef;
}

- (void)setMobileDeviceRef:(void *)a3
{
  self->_mobileDeviceRef = a3;
}

- (SimDevice)simDev
{
  return self->_simDev;
}

- (void)setSimDev:(id)a3
{
  objc_storeStrong((id *)&self->_simDev, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_simDev, 0);
}

@end
