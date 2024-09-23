@implementation DADeviceObserverEnclosure

- (DADeviceObserverEnclosure)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  DADeviceObserverEnclosure *v9;
  DADeviceObserverEnclosure *v10;
  uint64_t v11;
  NSSet *devices;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DADeviceObserverEnclosure;
  v9 = -[DADeviceObserverEnclosure init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    devices = v10->_devices;
    v10->_devices = (NSSet *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)begin
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10001F0F4;
    v9 = &unk_1001337A0;
    objc_copyWeak(&v10, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beginDiscoveringDevicesWithHandler:", &v6));
    -[DADeviceObserverEnclosure setIdentifier:](self, "setIdentifier:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)end
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));
    objc_msgSend(v4, "endDiscoveringDevicesWithIdentifier:", v5);

    -[DADeviceObserverEnclosure setIdentifier:](self, "setIdentifier:", 0);
  }
}

- (void)oneshotWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F354;
  v7[3] = &unk_1001337C8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "discoverAllDevicesWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (DADeviceObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (DADeviceObserverEnclosureDelegate)delegate
{
  return (DADeviceObserverEnclosureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
