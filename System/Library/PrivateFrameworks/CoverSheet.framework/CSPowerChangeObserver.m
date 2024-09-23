@implementation CSPowerChangeObserver

- (CSPowerChangeObserver)initWithStatusProvider:(id)a3 notificationName:(id)a4 updateBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSPowerChangeObserver *v12;
  CSPowerChangeObserver *v13;
  void *v14;
  CSPowerChangeObserver *v15;
  uint64_t v16;
  NSObject *notificationToken;
  _QWORD v19[4];
  CSPowerChangeObserver *v20;
  id v21;
  id location;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CSPowerChangeObserver;
  v12 = -[CSPowerChangeObserver init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CSPowerChangeObserver setBlock:](v12, "setBlock:", v11);
    objc_storeStrong((id *)&v13->_statusProvider, a3);
    v13->_connectedToPower = -[CSPowerStatusProviding isConnectedToExternalChargingSource](v13->_statusProvider, "isConnectedToExternalChargingSource");
    v13->_isConnectedToQiPower = -[CSPowerStatusProviding isConnectedToQiPower](v13->_statusProvider, "isConnectedToQiPower");
    v13->_isConnectedToWirelessInternalCharger = -[CSPowerStatusProviding isConnectedToWirelessInternalCharger](v13->_statusProvider, "isConnectedToWirelessInternalCharger");
    v13->_isConnectedToWirelessInternalChargingAccessory = -[CSPowerStatusProviding isConnectedToWirelessInternalChargingAccessory](v13->_statusProvider, "isConnectedToWirelessInternalChargingAccessory");
    objc_initWeak(&location, v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__CSPowerChangeObserver_initWithStatusProvider_notificationName_updateBlock___block_invoke;
    v19[3] = &unk_1E8E2DD58;
    objc_copyWeak(&v21, &location);
    v15 = v13;
    v20 = v15;
    objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    notificationToken = v15->_notificationToken;
    v15->_notificationToken = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __77__CSPowerChangeObserver_initWithStatusProvider_notificationName_updateBlock___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsConnectedToPower:", objc_msgSend(WeakRetained[2], "isConnectedToExternalChargingSource"));
  objc_msgSend(WeakRetained, "setIsConnectedToQiPower:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isConnectedToQiPower"));
  objc_msgSend(WeakRetained, "setIsConnectedToWirelessInternalCharger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isConnectedToWirelessInternalCharger"));
  objc_msgSend(WeakRetained, "setIsConnectedToWirelessInternalChargingAccessory:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isConnectedToWirelessInternalChargingAccessory"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)CSPowerChangeObserver;
  -[CSPowerChangeObserver dealloc](&v4, sel_dealloc);
}

- (void)update
{
  -[CSPowerChangeObserver setIsConnectedToPower:](self, "setIsConnectedToPower:", -[CSPowerStatusProviding isConnectedToExternalChargingSource](self->_statusProvider, "isConnectedToExternalChargingSource"));
  -[CSPowerChangeObserver setIsConnectedToWirelessInternalCharger:](self, "setIsConnectedToWirelessInternalCharger:", -[CSPowerStatusProviding isConnectedToWirelessInternalCharger](self->_statusProvider, "isConnectedToWirelessInternalCharger"));
  -[CSPowerChangeObserver setIsConnectedToWirelessInternalChargingAccessory:](self, "setIsConnectedToWirelessInternalChargingAccessory:", -[CSPowerStatusProviding isConnectedToWirelessInternalChargingAccessory](self->_statusProvider, "isConnectedToWirelessInternalChargingAccessory"));
  -[CSPowerChangeObserver setIsConnectedToQiPower:](self, "setIsConnectedToQiPower:", -[CSPowerStatusProviding isConnectedToQiPower](self->_statusProvider, "isConnectedToQiPower"));
}

- (void)setIsConnectedToPower:(BOOL)a3
{
  _BOOL8 v3;
  void (**v4)(id, _BOOL8);

  if (self->_connectedToPower != a3)
  {
    v3 = a3;
    self->_connectedToPower = a3;
    -[CSPowerChangeObserver block](self, "block");
    v4 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3);

  }
}

- (BOOL)isConnectedToPower
{
  return self->_connectedToPower;
}

- (void)setConnectedToPower:(BOOL)a3
{
  self->_connectedToPower = a3;
}

- (BOOL)isConnectedToQiPower
{
  return self->_isConnectedToQiPower;
}

- (void)setIsConnectedToQiPower:(BOOL)a3
{
  self->_isConnectedToQiPower = a3;
}

- (BOOL)isConnectedToWirelessInternalCharger
{
  return self->_isConnectedToWirelessInternalCharger;
}

- (void)setIsConnectedToWirelessInternalCharger:(BOOL)a3
{
  self->_isConnectedToWirelessInternalCharger = a3;
}

- (BOOL)isConnectedToWirelessInternalChargingAccessory
{
  return self->_isConnectedToWirelessInternalChargingAccessory;
}

- (void)setIsConnectedToWirelessInternalChargingAccessory:(BOOL)a3
{
  self->_isConnectedToWirelessInternalChargingAccessory = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_notificationToken, 0);
}

@end
