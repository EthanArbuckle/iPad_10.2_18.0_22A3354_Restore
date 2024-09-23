@implementation ASDTDeviceInterest

- (id)initForObject:(id)a3 withInterests:(int)a4
{
  uint64_t v4;
  id v6;
  ASDTDeviceInterest *v7;
  ASDTDeviceInterest *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTDeviceInterest;
  v7 = -[ASDTDeviceInterest init](&v10, sel_init);
  if (v7)
  {
    if (!objc_msgSend(v6, "conformsToProtocol:", &unk_256453FD0))
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[ASDTDeviceInterest setInterested:](v7, "setInterested:", v6);
    -[ASDTDeviceInterest setInterests:](v7, "setInterests:", v4);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)createForObject:(id)a3 withInterests:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForObject:withInterests:", v6, v4);

  return v7;
}

- (void)notifyOfInterest:(int)a3 forDevice:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (v7 && (-[ASDTDeviceInterest interests](self, "interests") & v4) != 0)
  {
    -[ASDTDeviceInterest interested](self, "interested");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interestNotification:forDevice:", v4, v7);

  }
}

- (ASDTDeviceInterestProtocol)interested
{
  return (ASDTDeviceInterestProtocol *)objc_loadWeakRetained((id *)&self->_interested);
}

- (void)setInterested:(id)a3
{
  objc_storeWeak((id *)&self->_interested, a3);
}

- (int)interests
{
  return self->_interests;
}

- (void)setInterests:(int)a3
{
  self->_interests = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interested);
}

@end
