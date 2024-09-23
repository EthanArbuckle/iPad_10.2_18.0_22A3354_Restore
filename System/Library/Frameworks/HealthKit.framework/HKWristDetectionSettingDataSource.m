@implementation HKWristDetectionSettingDataSource

- (HKWristDetectionSettingDataSource)initWithWristDetectionSettingManager:(id)a3
{
  id v5;
  HKWristDetectionSettingDataSource *v6;
  HKWristDetectionSettingDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWristDetectionSettingDataSource;
  v6 = -[HKObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wristDetectionSettingManager, a3);

  return v7;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5;
  _HKWristDetectionSettingManagerObserverBridge *v6;

  v5 = a4;
  v6 = -[_HKWristDetectionSettingManagerObserverBridge initWithHandle:]([_HKWristDetectionSettingManagerObserverBridge alloc], "initWithHandle:", v5);

  -[HKWristDetectionSettingManager registerObserver:](self->_wristDetectionSettingManager, "registerObserver:", v6);
  return v6;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  -[HKWristDetectionSettingManager unregisterObserver:](self->_wristDetectionSettingManager, "unregisterObserver:", a3, a4);
}

- (HKWristDetectionSettingManager)wristDetectionSettingManager
{
  return self->_wristDetectionSettingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristDetectionSettingManager, 0);
}

@end
