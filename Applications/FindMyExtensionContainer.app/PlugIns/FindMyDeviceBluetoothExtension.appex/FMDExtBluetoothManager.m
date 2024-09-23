@implementation FMDExtBluetoothManager

+ (BTAccessoryManagerImpl)getAccessoryManager
{
  char *v2;
  uint64_t v3;
  BTAccessoryManagerImpl *v4;

  v2 = (char *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager currentInstance](FMDExtBluetoothManager, "currentInstance"));
  v3 = objc_opt_class(BluetoothManager);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = *(BTAccessoryManagerImpl **)&v2[OBJC_IVAR___BluetoothManager__accessoryManager];
  else
    v4 = 0;

  return v4;
}

+ (id)currentInstance
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  int v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bluetoothManagerDelegateQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDBluetoothFrameworkBTManagingFactory bluetoothManagerWithQueue:delegate:](FMDBluetoothFrameworkBTManagingFactory, "bluetoothManagerWithQueue:delegate:", v2, 0));

  v4 = 0;
  while ((objc_msgSend(v3, "available") & 1) == 0)
  {
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.01);
    if (++v4 == 100)
      return v3;
  }
  v5 = sub_100007824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = (double)v4 * 0.01;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BluetoothManager available after %f", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

+ (id)bluetoothManagerDelegateQueue
{
  if (qword_10002D698 != -1)
    dispatch_once(&qword_10002D698, &stru_100021000);
  return (id)qword_10002D6A0;
}

+ (id)serialQueue
{
  if (qword_10002D6A8 != -1)
    dispatch_once(&qword_10002D6A8, &stru_100021020);
  return (id)qword_10002D6B0;
}

+ (id)pairedAppleAccessories
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager currentInstance](FMDExtBluetoothManager, "currentInstance"));
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100006218;
  v26 = sub_100006228;
  v27 = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager serialQueue](FMDExtBluetoothManager, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006230;
  block[3] = &unk_100021048;
  v21 = &v22;
  v5 = v2;
  v19 = v5;
  v6 = v3;
  v20 = v6;
  dispatch_async(v4, block);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (id)v23[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "vendorId", (_QWORD)v14) == 76
          && (objc_msgSend(v12, "isTemporaryPaired") & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
  return v7;
}

+ (id)pairedAccessoryWithID:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAppleAccessories](FMDExtBluetoothManager, "pairedAppleAccessories"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "address", (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v9));

        if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) != 0)
        {
          v5 = v8;

          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
