@implementation HFWiFiExecutionEnvironmentObserver

- (HFWiFiExecutionEnvironmentObserver)initWithExecutionEnvironment:(id)a3 dispatcher:(id)a4
{
  id v6;
  id v7;
  HFWiFiExecutionEnvironmentObserver *v8;
  HFWiFiExecutionEnvironmentObserver *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFWiFiExecutionEnvironmentObserver;
  v8 = -[HFWiFiExecutionEnvironmentObserver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeWeak((id *)&v9->_dispatcher, v7);
    -[HFWiFiExecutionEnvironmentObserver _updateState](v9, "_updateState");
    objc_msgSend(v6, "addObserver:", v9);
    objc_msgSend(v7, "addHomeManagerObserver:", v9);
  }

  return v9;
}

- (void)_updateState
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  -[HFWiFiExecutionEnvironmentObserver dispatcher](self, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13
    || (-[HFWiFiExecutionEnvironmentObserver lastKnownHome](self, "lastKnownHome"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[HFWiFiExecutionEnvironmentObserver lastKnownHome](self, "lastKnownHome");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = -[HFWiFiExecutionEnvironmentObserver lastKnownRunningState](self, "lastKnownRunningState");
    -[HFWiFiExecutionEnvironmentObserver environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "runningState");

    if (v13 == v5)
    {
      if (v6 == v8)
        goto LABEL_11;
    }
    else
    {
      -[HFWiFiExecutionEnvironmentObserver lastKnownHome](self, "lastKnownHome");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopDiscoveringSymptomsForNearbyDevices");

      -[HFWiFiExecutionEnvironmentObserver setLastKnownHome:](self, "setLastKnownHome:", v13);
    }
    -[HFWiFiExecutionEnvironmentObserver environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWiFiExecutionEnvironmentObserver setLastKnownRunningState:](self, "setLastKnownRunningState:", objc_msgSend(v10, "runningState"));

    v11 = -[HFWiFiExecutionEnvironmentObserver lastKnownRunningState](self, "lastKnownRunningState");
    if (!v11)
    {
      -[HFWiFiExecutionEnvironmentObserver lastKnownHome](self, "lastKnownHome");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startDiscoveringSymptomsForNearbyDevices");
      goto LABEL_10;
    }
    if (v11 == 1)
    {
      -[HFWiFiExecutionEnvironmentObserver lastKnownHome](self, "lastKnownHome");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopDiscoveringSymptomsForNearbyDevices");
LABEL_10:

    }
  }
LABEL_11:

}

- (HMHome)lastKnownHome
{
  return self->_lastKnownHome;
}

- (unint64_t)lastKnownRunningState
{
  return self->_lastKnownRunningState;
}

- (HFExecutionEnvironment)environment
{
  return (HFExecutionEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HFHomeKitDispatcher)dispatcher
{
  return (HFHomeKitDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (void)setLastKnownRunningState:(unint64_t)a3
{
  self->_lastKnownRunningState = a3;
}

- (void)setLastKnownHome:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownHome, a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HFWiFiExecutionEnvironmentObserver dispatcher](self, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeManagerObserver:", self);

  -[HFWiFiExecutionEnvironmentObserver environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HFWiFiExecutionEnvironmentObserver;
  -[HFWiFiExecutionEnvironmentObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownHome, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_destroyWeak((id *)&self->_environment);
}

@end
