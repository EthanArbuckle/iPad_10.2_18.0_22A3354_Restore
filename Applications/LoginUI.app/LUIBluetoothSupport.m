@implementation LUIBluetoothSupport

+ (id)sharedInstance
{
  if (qword_100088F00 != -1)
    dispatch_once(&qword_100088F00, &stru_100069E58);
  return (id)qword_100088EF8;
}

- (LUIBluetoothSupport)init
{
  LUIBluetoothSupport *v2;
  uint64_t v3;
  BluetoothManager *btManager;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIBluetoothSupport;
  v2 = -[LUIBluetoothSupport init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    btManager = v2->btManager;
    v2->btManager = (BluetoothManager *)v3;

    v2->btStatus = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "availabilityChanged:", BluetoothAvailabilityChangedNotification, 0);

  }
  return v2;
}

- (void)availabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if ((-[BluetoothManager available](self->btManager, "available") & 1) != 0)
  {
    v5 = qword_100088F20;
    if (os_log_type_enabled((os_log_t)qword_100088F20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is available.", v10, 2u);
    }
    v6 = -[BluetoothManager powered](self->btManager, "powered");
    v7 = 2;
    if (v6)
      v7 = 3;
    self->btStatus = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("LUIBluetoothPowerStatusChangedNotification"), self, v9);

  }
  else
  {
    self->btStatus = 1;
  }

}

- (void)turnBluetoothOn
{
  -[BluetoothManager setEnabled:](self->btManager, "setEnabled:", 1);
  -[BluetoothManager setPowered:](self->btManager, "setPowered:", 1);
}

- (int64_t)bluetoothStatus
{
  switch(self->btStatus)
  {
    case 0:
      if (os_log_type_enabled((os_log_t)qword_100088F20, OS_LOG_TYPE_DEBUG))
        sub_10003CDA8();
      break;
    case 1:
      if (os_log_type_enabled((os_log_t)qword_100088F20, OS_LOG_TYPE_DEBUG))
        sub_10003CDD4();
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)qword_100088F20, OS_LOG_TYPE_DEBUG))
        sub_10003CE2C();
      break;
    case 3:
      if (os_log_type_enabled((os_log_t)qword_100088F20, OS_LOG_TYPE_DEBUG))
        sub_10003CE00();
      break;
    default:
      return self->btStatus;
  }
  return self->btStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->btManager, 0);
}

@end
