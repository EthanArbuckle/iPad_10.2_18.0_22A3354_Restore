@implementation FMDBluetoothFrameworkBTManagingFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_10002D7E0 != -1)
    dispatch_once(&qword_10002D7E0, &stru_100021458);
  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = byte_10002D7D8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAutomationBluetoothManager: isAutomationActive: %d", (uint8_t *)v5, 8u);
  }

  return byte_10002D7D8;
}

+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive](FMDBluetoothFrameworkBTManagingFactory, "isAutomationActive"))
  {
    if (qword_10002D7F8 != -1)
      dispatch_once(&qword_10002D7F8, &stru_1000214A0);
    objc_msgSend((id)qword_10002D7F0, "setBluetoothManager:", v6);
    v7 = (id)qword_10002D7F0;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009EF0;
    block[3] = &unk_100021480;
    v10 = v5;
    if (qword_10002D7E8 != -1)
      dispatch_once(&qword_10002D7E8, block);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));

  }
  return v7;
}

@end
