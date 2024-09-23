@implementation HKObserverBridgeHandle

- (HKObserverBridgeHandle)initWithBridge:(id)a3
{
  id v4;
  HKObserverBridgeHandle *v5;
  HKObserverBridgeHandle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKObserverBridgeHandle;
  v5 = -[HKObserverBridgeHandle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_bridge, v4);

  return v6;
}

- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4
{
  HKObserverBridge **p_bridge;
  id v6;
  id v7;
  id WeakRetained;
  char v9;

  p_bridge = &self->_bridge;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bridge);
  v9 = objc_msgSend(WeakRetained, "notifyObserversOfChangeForKey:newValue:", v7, v6);

  return v9;
}

- (HKObserverBridge)bridge
{
  return (HKObserverBridge *)objc_loadWeakRetained((id *)&self->_bridge);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bridge);
}

@end
