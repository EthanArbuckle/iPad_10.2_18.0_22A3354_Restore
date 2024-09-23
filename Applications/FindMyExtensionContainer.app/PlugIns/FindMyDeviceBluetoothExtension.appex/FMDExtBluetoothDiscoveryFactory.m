@implementation FMDExtBluetoothDiscoveryFactory

- (FMDExtBluetoothDiscoveryFactory)init
{
  FMDExtBluetoothDiscoveryFactory *v2;
  FMDExtBluetoothDiscoveryFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDExtBluetoothDiscoveryFactory;
  v2 = -[FMDExtBluetoothDiscoveryFactory init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMDExtBluetoothDiscoveryFactory setupDiscovery](v2, "setupDiscovery");
  return v3;
}

- (id)newDiscovery
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  v3 = objc_msgSend(v2, "newDiscovery");

  return v3;
}

- (BOOL)isDiscoveryActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  v3 = objc_msgSend(v2, "isDiscoveryActive");

  return v3;
}

- (void)setupDiscovery
{
  FMDBluetoothDiscoveryXPCProxy *v3;
  dispatch_queue_t v4;
  FMDBluetoothDiscoveryCoordinator *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  FMDBluetoothDiscoveryXPCProxy *v22;

  v3 = objc_alloc_init(FMDBluetoothDiscoveryXPCProxy);
  v4 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothdiscoveryqueue", 0);
  -[FMDExtBluetoothDiscoveryFactory setBluetoothDiscoveryQueue:](self, "setBluetoothDiscoveryQueue:", v4);

  v5 = -[FMDBluetoothDiscoveryCoordinator initWithDiscovery:]([FMDBluetoothDiscoveryCoordinator alloc], "initWithDiscovery:", v3);
  -[FMDExtBluetoothDiscoveryFactory setDiscoveryCoordinator:](self, "setDiscoveryCoordinator:", v5);

  objc_initWeak(&location, self);
  v6 = sub_100007824();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "starting up discovery %@", buf, 0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F8DC;
  v18[3] = &unk_1000215F8;
  objc_copyWeak(&v19, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v8, "setDidDiscoverDevice:", v18);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000FA2C;
  v16[3] = &unk_1000215F8;
  objc_copyWeak(&v17, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v9, "setDidLoseDevice:", v16);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000FB7C;
  v14[3] = &unk_100021620;
  objc_copyWeak(&v15, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v10, "setDidEndDiscovery:", v14);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FC70;
  v12[3] = &unk_100021570;
  objc_copyWeak(&v13, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory discoveryCoordinator](self, "discoveryCoordinator"));
  objc_msgSend(v11, "setDidStartDiscovery:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)setAllAudioChannelsActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _UNKNOWN **v6;
  Block_layout *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory accessoryId](self, "accessoryId"));
  if (v3)
  {
    v6 = &off_100024988;
    v7 = &stru_100021640;
  }
  else
  {
    v6 = &off_1000249B0;
    v7 = &stru_100021660;
  }
  objc_msgSend(v8, "availabilitydidChangeFor:status:withCompletion:", v5, v6, v7);

}

- (void)didDiscoverDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_MACAddressString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory address](self, "address"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_msgSend((id)objc_opt_class(self), "configurationDictWithBleDevice:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_100007824();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didDiscoverDevice = %@ %@", (uint8_t *)&v16, 0x16u);

    }
    if (v10)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory delegate](self, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory accessoryId](self, "accessoryId"));
      objc_msgSend(v14, "availabilitydidChangeFor:status:withCompletion:", v15, v10, &stru_100021680);

    }
  }

}

- (void)didLoseDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_MACAddressString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory address](self, "address"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_msgSend((id)objc_opt_class(self), "configurationDictWithBleDevice:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_100007824();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didLoseDevice = %@ %@", (uint8_t *)&v16, 0x16u);

    }
    if (v10)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory delegate](self, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtBluetoothDiscoveryFactory accessoryId](self, "accessoryId"));
      objc_msgSend(v14, "availabilitydidChangeFor:status:withCompletion:", v15, v10, &stru_1000216A0);

    }
  }

}

+ (id)configurationDictWithBleDevice:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  void *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  BOOL v22;
  int v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  __CFString *v28;
  id v29;
  void *v30;
  int v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  unsigned int v37;
  _QWORD v38[3];
  _QWORD v39[3];
  uint8_t buf[4];
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "advertisementFields"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aState")));
  v5 = (void *)v4;
  v6 = &off_1000249D8;
  if (v4)
    v6 = (_UNKNOWN **)v4;
  v7 = v6;

  v37 = objc_msgSend(v7, "isEqualToNumber:", &off_1000249F0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hsStatus")));
  v9 = objc_msgSend(v8, "unsignedIntValue");
  v10 = dword_10002D1FC & v9;
  v11 = dword_10002D1E0 & v9;
  v12 = dword_10002D1E4 & v9;
  v13 = dword_10002D1F0 & v9;
  v14 = dword_10002D1E8 & v9;
  v15 = dword_10002D1F4 & v9;
  v16 = dword_10002D200 & v9;
  v17 = sub_100007584();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110656;
    v41 = v10 != 0;
    v42 = 1024;
    v43 = v16 != 0;
    v44 = 1024;
    v45 = v11 != 0;
    v46 = 1024;
    v47 = v12 != 0;
    v48 = 1024;
    v49 = v13 != 0;
    v50 = 1024;
    v51 = v14 != 0;
    v52 = 1024;
    v53 = v15 != 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MainHSSTATUS L %i P %i U %i C %i OC %i E %i OE %i", buf, 0x2Cu);
  }

  if (v16)
  {
    if (v11)
      v19 = v14 == 0;
    else
      v19 = 0;
    v21 = v19 && v15 == 0;
    if (v12)
      v22 = v13 == 0;
    else
      v22 = 1;
    if (!v22 || (v12 | v13) == 0)
      v24 = v21;
    else
      v24 = 0;
    if (v10)
      v25 = CFSTR("right");
    else
      v25 = CFSTR("left");
    if (v10)
      v26 = CFSTR("left");
    else
      v26 = CFSTR("right");
    v27 = v25;
    v28 = v26;
    v29 = objc_alloc_init((Class)NSMutableArray);
    v30 = v29;
    if ((v24 & 1) != 0 || !v12)
      objc_msgSend(v29, "addObject:", v28);
    if (v13)
      v31 = v24;
    else
      v31 = 1;
    if (v11 && v31)
      objc_msgSend(v30, "addObject:", v27);
    if (v37)
      v32 = v30;
    else
      v32 = &__NSArray0__struct;
    v38[0] = CFSTR("components");
    v38[1] = CFSTR("playing");
    v39[0] = v30;
    v39[1] = v32;
    v38[2] = CFSTR("statusUpdateTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v39[2] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));

  }
  else
  {
    v33 = sub_100007824();
    v27 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "ignoring advertisement from non primary bud", buf, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (FMDExtAccessoryDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryId, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (FMDBluetoothDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryCoordinator, a3);
}

- (OS_dispatch_queue)bluetoothDiscoveryQueue
{
  return self->_bluetoothDiscoveryQueue;
}

- (void)setBluetoothDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
