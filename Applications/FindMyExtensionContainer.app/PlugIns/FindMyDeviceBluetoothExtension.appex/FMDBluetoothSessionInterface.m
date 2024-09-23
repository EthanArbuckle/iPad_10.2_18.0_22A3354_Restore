@implementation FMDBluetoothSessionInterface

- (FMDBluetoothSessionInterface)init
{
  FMDBluetoothSessionInterface *v2;
  dispatch_queue_t v3;
  dispatch_queue_t v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMDBluetoothSessionInterface;
  v2 = -[FMDBluetoothSessionInterface init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBluetoothSessionInterface", 0);
    -[FMDBluetoothSessionInterface setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBluetoothSessionInterface.BTSession", 0);
    -[FMDBluetoothSessionInterface setBluetoothSessionQueue:](v2, "setBluetoothSessionQueue:", v4);

    v5 = sub_1000077B4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initialized FMDBluetoothSessionInterface", v8, 2u);
    }

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FMDBluetoothSessionInterface detachFromSession](self, "detachFromSession");
  v3.receiver = self;
  v3.super_class = (Class)FMDBluetoothSessionInterface;
  -[FMDBluetoothSessionInterface dealloc](&v3, "dealloc");
}

- (void)startSession
{
  -[FMDBluetoothSessionInterface performWithActiveSession:](self, "performWithActiveSession:", &stru_100021308);
}

- (int)listeningModeForAccessory:(id)a3 timeout:(double)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _BYTE *v21;
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[16];
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  dispatch_semaphore_t v32;

  v6 = a3;
  v7 = sub_1000077B4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingIdentifier"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retrieving listening mode for accessory address: %@ | timeout: %f", buf, 0x16u);

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v11 = dispatch_time(0, 1000000000 * objc_msgSend(v10, "unsignedIntValue"));

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = sub_100008080;
  v31 = sub_100008090;
  v32 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008098;
  v18[3] = &unk_100021330;
  objc_copyWeak(&v22, &location);
  v12 = v6;
  v19 = v12;
  v20 = &v24;
  v21 = buf;
  -[FMDBluetoothSessionInterface performWithActiveSession:](self, "performWithActiveSession:", v18);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), v11))
  {
    v13 = sub_1000077B4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "audioRoutingIdentifier"));
      sub_100012708(v15, (uint64_t)v28, v14);
    }

    v16 = 0;
  }
  else
  {
    v16 = *((_DWORD *)v25 + 6);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)updateListeningMode:(int)a3 accessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int v14;
  uint8_t buf[4];
  void *v16;

  v6 = a4;
  v7 = sub_1000077B4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioRoutingIdentifier"));
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to set listening mode for accessory address: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000083B0;
  v11[3] = &unk_100021358;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v6;
  v12 = v10;
  v14 = a3;
  -[FMDBluetoothSessionInterface performWithActiveSession:](self, "performWithActiveSession:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)performWithActiveSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008610;
  v8[3] = &unk_1000213D0;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BTDeviceImpl)deviceWithAddress:(id)a3
{
  id v4;
  NSObject *v5;
  BTSessionImpl *v6;
  BTSessionImpl *v7;
  id v8;
  NSObject *v9;
  BTDeviceImpl *v10;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  BTDeviceImpl *v20;
  uint8_t buf[4];
  id v22;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v20 = 0;
  v6 = -[FMDBluetoothSessionInterface session](self, "session");
  if (!v4 || (v7 = v6, objc_msgSend(v4, "isEqualToString:", &stru_100023E70)))
  {
    v8 = sub_1000077B4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000129C8();
LABEL_5:

    v10 = 0;
    goto LABEL_6;
  }
  if (!v7)
  {
    v15 = sub_1000077B4();
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000129F4();
    goto LABEL_5;
  }
  WORD2(v19) = 0;
  LODWORD(v19) = 0;
  v12 = objc_retainAutorelease(v4);
  if (BTDeviceAddressFromString(objc_msgSend(v12, "UTF8String", v19), &v19))
  {
    v13 = sub_1000077B4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100012AB8();
  }
  else
  {
    v16 = BTDeviceFromAddress(v7, &v19, &v20);
    v17 = sub_1000077B4();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v14 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100012A58();
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found BTDevice at address %@", buf, 0xCu);
    }
  }

  v10 = v20;
LABEL_6:

  return v10;
}

- (void)sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  int v25;
  BTSessionImpl *v26;
  __int16 v27;
  int v28;

  v4 = *(_QWORD *)&a4;
  v7 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v7);

  if ((_DWORD)v4)
  {
    v8 = sub_1000077B4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100012B18(v4, v9, v10, v11, v12, v13, v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface futureSession](self, "futureSession"));
    v17 = 0;
    goto LABEL_16;
  }
  -[FMDBluetoothSessionInterface detachFromSession](self, "detachFromSession");
  v18 = sub_1000077B4();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 134218240;
    v26 = a3;
    v27 = 1024;
    v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Session attached %p, result: %d.", (uint8_t *)&v25, 0x12u);
  }

  -[FMDBluetoothSessionInterface setSession:](self, "setSession:", a3);
  if (a3)
  {
    BTServiceAddCallbacks(a3, sub_100008C98, self);
    v20 = sub_1000077B4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 134217984;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Registered session callbacks %p", (uint8_t *)&v25, 0xCu);
    }

  }
  if (!-[FMDBluetoothSessionInterface setUpLocalDevice](self, "setUpLocalDevice"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface futureSession](self, "futureSession"));
    v17 = 1;
LABEL_16:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDBluetoothSessionInterfaceErrorDomain"), v17, 0));
    objc_msgSend(v16, "finishWithError:", v24);

    goto LABEL_17;
  }
  v22 = -[FMDBluetoothSessionInterface setUpAccessoryManager](self, "setUpAccessoryManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface futureSession](self, "futureSession"));
  v16 = v23;
  if ((v22 & 1) == 0)
  {
    v17 = 2;
    goto LABEL_16;
  }
  objc_msgSend(v23, "finishWithNoResult");
LABEL_17:

}

- (void)sessionDetached:(BTSessionImpl *)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  BTSessionImpl *v11;

  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000077B4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session detached %p", (uint8_t *)&v10, 0xCu);
  }

  if (-[FMDBluetoothSessionInterface session](self, "session") == a3)
  {
    -[FMDBluetoothSessionInterface detachFromSession](self, "detachFromSession");
  }
  else
  {
    v8 = sub_1000077B4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100012B7C();

  }
}

- (void)sessionTerminated:(BTSessionImpl *)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  BTSessionImpl *v11;

  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000077B4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session terminated %p", (uint8_t *)&v10, 0xCu);
  }

  if (-[FMDBluetoothSessionInterface session](self, "session") == a3)
  {
    -[FMDBluetoothSessionInterface detachFromSession](self, "detachFromSession");
    -[FMDBluetoothSessionInterface attachToSession](self, "attachToSession");
  }
  else
  {
    v8 = sub_1000077B4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100012BA8();

  }
}

- (void)attachToSession
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  FMFuture *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint8_t buf[2];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface futureSession](self, "futureSession"));
  if (v4)
  {
    v5 = sub_1000077B4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Already attaching to session. Ignoring new request.";
      v8 = buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    -[FMDBluetoothSessionInterface detachFromSession](self, "detachFromSession");
    v9 = objc_opt_new(FMFuture);
    -[FMDBluetoothSessionInterface setFutureSession:](self, "setFutureSession:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface bluetoothSessionQueue](self, "bluetoothSessionQueue"));
    v11 = BTSessionAttachWithQueue("ADMobileBluetoothDeviceDataSource", off_1000213F0, self, v10);

    v12 = sub_1000077B4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v6 = v13;
    if (!(_DWORD)v11)
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v20 = 0;
      v7 = "Attaching to session...";
      v8 = (uint8_t *)&v20;
      goto LABEL_4;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100012BD4(v11, v6, v14, v15, v16, v17, v18, v19);
  }
LABEL_10:

}

- (void)detachFromSession
{
  BTSessionImpl *v3;
  BTSessionImpl *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  BTSessionImpl *v9;
  uint8_t buf[4];
  BTSessionImpl *v11;

  -[FMDBluetoothSessionInterface tearDownAccessoryManager](self, "tearDownAccessoryManager");
  -[FMDBluetoothSessionInterface tearDownLocalDevice](self, "tearDownLocalDevice");
  v3 = -[FMDBluetoothSessionInterface session](self, "session");
  v9 = v3;
  if (v3)
  {
    v4 = v3;
    BTServiceRemoveCallbacks(v3, sub_100008C98);
    v5 = sub_1000077B4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Detaching from session %p", buf, 0xCu);
    }

    BTSessionDetachWithQueue(&v9);
    -[FMDBluetoothSessionInterface setSession:](self, "setSession:", 0);
    -[FMDBluetoothSessionInterface setFutureSession:](self, "setFutureSession:", 0);
  }
  else
  {
    v7 = sub_1000077B4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session requested detach, but we had no session. Nothing to do.", buf, 2u);
    }

  }
}

- (BOOL)setUpAccessoryManager
{
  NSObject *v3;
  BTSessionImpl *v4;
  BTSessionImpl *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  BTAccessoryManagerImpl *v15;
  __int16 v16;
  BTSessionImpl *v17;
  __int16 v18;
  int v19;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  -[FMDBluetoothSessionInterface tearDownAccessoryManager](self, "tearDownAccessoryManager");
  v4 = -[FMDBluetoothSessionInterface session](self, "session");
  if (!v4)
  {
    v8 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100012C38();
    goto LABEL_10;
  }
  v5 = v4;
  if (BTAccessoryManagerGetDefault(v4, &self->_accessoryManager))
  {
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100012C64();
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v9 = BTAccessoryManagerAddCallbacks(-[FMDBluetoothSessionInterface accessoryManager](self, "accessoryManager"), &off_1000213F8, self);
  v10 = sub_1000077B4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v7 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218496;
      v15 = -[FMDBluetoothSessionInterface accessoryManager](self, "accessoryManager");
      v16 = 2048;
      v17 = v5;
      v18 = 1024;
      v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed adding callbacks to accessory manager %p from session: %p, result: %d", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = -[FMDBluetoothSessionInterface accessoryManager](self, "accessoryManager");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finished setup of accessory manager %p", (uint8_t *)&v14, 0xCu);
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)tearDownAccessoryManager
{
  NSObject *v3;
  BTAccessoryManagerImpl *v4;
  BTAccessoryManagerImpl *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  int v12;
  BTAccessoryManagerImpl *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[FMDBluetoothSessionInterface accessoryManager](self, "accessoryManager");
  if (v4)
  {
    v5 = v4;
    BTAccessoryManagerRemoveCallbacks(v4, &off_1000213F8);
    -[FMDBluetoothSessionInterface setAccessoryManager:](self, "setAccessoryManager:", 0);
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v5;
      v8 = "Tear-down finished for accessory manager: %p";
      v9 = v7;
      v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    v11 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "No accessory manager to tear-down.";
      v9 = v7;
      v10 = 2;
      goto LABEL_6;
    }
  }

}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  NSObject *v10;
  id v11;
  NSObject *v12;
  int v13;
  BTAccessoryManagerImpl *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  BTDeviceImpl *v18;
  __int16 v19;
  int v20;

  v10 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = sub_1000077B4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218752;
    v14 = a3;
    v15 = 1024;
    v16 = a4;
    v17 = 2048;
    v18 = a5;
    v19 = 1024;
    v20 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d", (uint8_t *)&v13, 0x22u);
  }

}

- (BOOL)setUpLocalDevice
{
  NSObject *v3;
  BTSessionImpl *v4;
  BTSessionImpl *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  BTLocalDeviceImpl *v15;
  __int16 v16;
  BTSessionImpl *v17;
  __int16 v18;
  int v19;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  -[FMDBluetoothSessionInterface tearDownLocalDevice](self, "tearDownLocalDevice");
  v4 = -[FMDBluetoothSessionInterface session](self, "session");
  if (!v4)
  {
    v8 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100012CC4();
    goto LABEL_10;
  }
  v5 = v4;
  if (BTLocalDeviceGetDefault(v4, &self->_localDevice))
  {
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100012CF0();
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v9 = BTLocalDeviceAddCallbacks(-[FMDBluetoothSessionInterface localDevice](self, "localDevice"), &off_100021418, self);
  v10 = sub_1000077B4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v7 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218496;
      v15 = -[FMDBluetoothSessionInterface localDevice](self, "localDevice");
      v16 = 2048;
      v17 = v5;
      v18 = 1024;
      v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed adding callbacks to local device %p from session %p. Result: %d.", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local device set up.", (uint8_t *)&v14, 2u);
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)tearDownLocalDevice
{
  NSObject *v3;
  BTLocalDeviceImpl *v4;
  BTLocalDeviceImpl *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  int v12;
  BTLocalDeviceImpl *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothSessionInterface serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[FMDBluetoothSessionInterface localDevice](self, "localDevice");
  if (v4)
  {
    v5 = v4;
    BTLocalDeviceRemoveCallbacks(v4, &off_100021418);
    -[FMDBluetoothSessionInterface setLocalDevice:](self, "setLocalDevice:", 0);
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v5;
      v8 = "Tear-down finished for local device: %p";
      v9 = v7;
      v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    v11 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "No local device to tear-down.";
      v9 = v7;
      v10 = 2;
      goto LABEL_6;
    }
  }

}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BTLocalDeviceImpl *)a3
{
  self->_localDevice = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)bluetoothSessionQueue
{
  return self->_bluetoothSessionQueue;
}

- (void)setBluetoothSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothSessionQueue, a3);
}

- (FMFuture)futureSession
{
  return self->_futureSession;
}

- (void)setFutureSession:(id)a3
{
  objc_storeStrong((id *)&self->_futureSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureSession, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
