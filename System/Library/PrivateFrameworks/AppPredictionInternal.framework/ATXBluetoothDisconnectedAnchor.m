@implementation ATXBluetoothDisconnectedAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 60.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)anchorType
{
  return 2;
}

+ (id)longDescription
{
  return CFSTR("Bluetooth device is disconnected.");
}

+ (double)secondsOfInfluence
{
  return 3600.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 0;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBluetoothDataDictionary");
}

+ (id)predicateForContextStoreRegistration
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "predicateForBluetoothConnectionStatus:", 0);
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "predicateForBluetoothConnectionStatus:", 1);
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotificationForDict");
}

+ (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v3 = objc_msgSend(v2, "bluetoothState") == 0;

  return v3;
}

+ (id)sampleEvent
{
  ATXBluetoothDuetEvent *v2;
  void *v3;
  void *v4;
  ATXBluetoothDuetEvent *v5;

  v2 = [ATXBluetoothDuetEvent alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -20.0);
  v4 = (void *)objc_opt_new();
  v5 = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:](v2, "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", 0, 1, CFSTR("Sample BT Device"), CFSTR("1:1:1:1:1"), v3, v4);

  return v5;
}

@end
