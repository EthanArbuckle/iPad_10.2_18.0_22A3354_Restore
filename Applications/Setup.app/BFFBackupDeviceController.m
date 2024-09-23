@implementation BFFBackupDeviceController

- (BFFBackupDeviceController)initWithProximitySetupController:(id)a3
{
  id v3;
  BFFBackupDeviceController *v4;
  id v5;
  BFFBackupDeviceController *v6;
  objc_super v8;
  id location[2];
  id v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BFFBackupDeviceController;
  v4 = -[BFFBackupDeviceController init](&v8, "init");
  v10 = v4;
  objc_storeStrong(&v10, v4);
  if (v4)
  {
    objc_msgSend(v10, "setProximitySetupController:", location[0]);
    v5 = objc_msgSend(v10, "proximitySetupController");
    objc_msgSend(v5, "addObserver:", v10);

  }
  v6 = (BFFBackupDeviceController *)v10;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (void)dealloc
{
  ProximitySetupController *v2;
  objc_super v3;
  SEL v4;
  BFFBackupDeviceController *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BFFBackupDeviceController proximitySetupController](self, "proximitySetupController");
  -[ProximitySetupController removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BFFBackupDeviceController;
  -[BFFBackupDeviceController dealloc](&v3, "dealloc");
}

- (void)startBackupDevice:(id)a3 UUID:(id)a4
{
  _BOOL8 v5;
  NSObject *v6;
  os_log_type_t v7;
  ProximitySetupController *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSError *v13;
  BFFBackupDeviceControllerDelegate *v14;
  BFFBackupDeviceController *v15;
  NSError *v16;
  NSObject *v17;
  os_log_type_t v18;
  ProximitySetupController *v19;
  _WORD v20[3];
  os_log_type_t v21;
  os_log_t v22;
  uint8_t v23[15];
  os_log_type_t v24;
  os_log_t v25;
  int v26;
  uint8_t buf[7];
  os_log_type_t v28;
  os_log_t oslog;
  id v30;
  id location[2];
  BFFBackupDeviceController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v5 = -[BFFBackupDeviceController isBackingUp](v32, "isBackingUp");
  if (v5)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v28;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Remote device is already backing up; ignoring request to start...",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v26 = 1;
  }
  else
  {
    v8 = -[BFFBackupDeviceController proximitySetupController](v32, "proximitySetupController");
    v9 = -[ProximitySetupController hasConnection](v8, "hasConnection");

    if (v9)
    {
      v22 = (os_log_t)(id)_BYLoggingFacility(v10);
      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v22;
        v18 = v21;
        sub_100038C3C(v20);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Starting backup for remote device...", (uint8_t *)v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
      -[BFFBackupDeviceController setBackingUp:](v32, "setBackingUp:", 1);
      -[BFFBackupDeviceController setBackupFinished:](v32, "setBackupFinished:", 0);
      -[BFFBackupDeviceController setError:](v32, "setError:", 0);
      -[BFFBackupDeviceController setCompletionDate:](v32, "setCompletionDate:", 0);
      -[BFFBackupDeviceController setPercentComplete:](v32, "setPercentComplete:", 0.0);
      -[BFFBackupDeviceController setTimeRemaining:](v32, "setTimeRemaining:", 0.0);
      -[BFFBackupDeviceController setBackingUpDeviceName:](v32, "setBackingUpDeviceName:", location[0]);
      -[BFFBackupDeviceController setBackingUpDeviceUUID:](v32, "setBackingUpDeviceUUID:", v30);
      v19 = -[BFFBackupDeviceController proximitySetupController](v32, "proximitySetupController");
      -[ProximitySetupController startiCloudBackup](v19, "startiCloudBackup");

      v26 = 0;
    }
    else
    {
      v25 = (os_log_t)(id)_BYLoggingFacility(v10);
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v25;
        v12 = v24;
        sub_100038C3C(v23);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Unable to start backup on remote device; no proximity connection!",
          v23,
          2u);
      }
      objc_storeStrong((id *)&v25, 0);
      v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BFFBackupDeviceErrorDomain"), -1, 0);
      -[BFFBackupDeviceController setError:](v32, "setError:", v13);

      -[BFFBackupDeviceController setBackupFinished:](v32, "setBackupFinished:", 1);
      v14 = -[BFFBackupDeviceController delegate](v32, "delegate");
      v15 = v32;
      v16 = -[BFFBackupDeviceController error](v32, "error");
      -[BFFBackupDeviceControllerDelegate backupDeviceController:backupCompletedWithError:](v14, "backupDeviceController:backupCompletedWithError:", v15, v16);

      v26 = 1;
    }
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)retryBackup
{
  NSObject *v2;
  os_log_type_t v3;
  BFFBackupDeviceController *v4;
  NSString *v5;
  NSString *v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t oslog[2];
  BFFBackupDeviceController *v10;

  v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v8;
    sub_100038C3C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Reattempting backup for remote device...", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = v10;
  v5 = -[BFFBackupDeviceController backingUpDeviceName](v10, "backingUpDeviceName");
  v6 = -[BFFBackupDeviceController backingUpDeviceUUID](v10, "backingUpDeviceUUID");
  -[BFFBackupDeviceController startBackupDevice:UUID:](v4, "startBackupDevice:UUID:", v5, v6);

}

- (void)reset
{
  -[BFFBackupDeviceController setBackingUp:](self, "setBackingUp:", 0, a2);
  -[BFFBackupDeviceController setBackingUpDeviceName:](self, "setBackingUpDeviceName:", 0);
  -[BFFBackupDeviceController setBackingUpDeviceUUID:](self, "setBackingUpDeviceUUID:", 0);
  -[BFFBackupDeviceController setBackupFinished:](self, "setBackupFinished:", 0);
  -[BFFBackupDeviceController setError:](self, "setError:", 0);
  -[BFFBackupDeviceController setCompletionDate:](self, "setCompletionDate:", 0);
  -[BFFBackupDeviceController setPercentComplete:](self, "setPercentComplete:", 0.0);
  -[BFFBackupDeviceController setTimeRemaining:](self, "setTimeRemaining:", 0.0);
  -[BFFBackupDeviceController setBackupStateUnknown:](self, "setBackupStateUnknown:", 0);
}

- (void)receivedBackupAction:(id)a3
{
  id v3;
  id v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  ProximitySetupController *v9;
  NSString *v10;
  BFFBackupDeviceControllerDelegate *v11;
  BFFBackupDeviceController *v12;
  NSError *v13;
  id v14;
  BFFBackupDeviceControllerDelegate *v15;
  double v16;
  double v17;
  double v18;
  char v19;
  NSString *v20;
  char v21;
  NSError *v22;
  char v23;
  NSString *v24;
  char v25;
  NSError *v26;
  char v27;
  NSError *v28;
  char v29;
  NSString *v30;
  os_log_t oslog;
  uint8_t buf[15];
  os_log_type_t v33;
  id v34;
  id location[2];
  BFFBackupDeviceController *v36;
  uint8_t v37[24];

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "finishedBackup") & 1) != 0)
  {
    -[BFFBackupDeviceController setBackingUp:](v36, "setBackingUp:", 0);
    -[BFFBackupDeviceController setBackupFinished:](v36, "setBackupFinished:", 1);
    v3 = objc_msgSend(location[0], "completionDate");
    -[BFFBackupDeviceController setCompletionDate:](v36, "setCompletionDate:", v3);

    v4 = objc_msgSend(location[0], "error");
    -[BFFBackupDeviceController setError:](v36, "setError:", v4);

    v5 = -[BFFBackupDeviceController error](v36, "error");
    if (v5)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 0;
        v27 = 0;
        v25 = 0;
        v23 = 0;
        v21 = 0;
        v19 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v10 = -[BFFBackupDeviceController error](v36, "error");
          v30 = v10;
          v29 = 1;
        }
        else
        {
          v28 = -[BFFBackupDeviceController error](v36, "error");
          v27 = 1;
          if (v28)
          {
            v26 = -[BFFBackupDeviceController error](v36, "error");
            v25 = 1;
            v24 = -[NSError domain](v26, "domain");
            v23 = 1;
            v22 = -[BFFBackupDeviceController error](v36, "error");
            v21 = 1;
            v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v24, -[NSError code](v22, "code"));
            v20 = v10;
            v19 = 1;
          }
          else
          {
            v10 = 0;
          }
        }
        sub_100039500((uint64_t)v37, (uint64_t)v10);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Backup failed with error: %{public}@", v37, 0xCu);
        if ((v19 & 1) != 0)

        if ((v21 & 1) != 0)
        if ((v23 & 1) != 0)

        if ((v25 & 1) != 0)
        if ((v27 & 1) != 0)

        if ((v29 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      v34 = (id)_BYLoggingFacility(v6);
      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v34;
        v8 = v33;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Backup finished successfully!", buf, 2u);
      }
      objc_storeStrong(&v34, 0);
      v9 = -[BFFBackupDeviceController proximitySetupController](v36, "proximitySetupController");
      -[ProximitySetupController setupFinished](v9, "setupFinished");

    }
    v11 = -[BFFBackupDeviceController delegate](v36, "delegate");
    v12 = v36;
    v13 = -[BFFBackupDeviceController error](v36, "error");
    -[BFFBackupDeviceControllerDelegate backupDeviceController:backupCompletedWithError:](v11, "backupDeviceController:backupCompletedWithError:", v12, v13);

  }
  else
  {
    objc_msgSend(location[0], "percentComplete");
    -[BFFBackupDeviceController setPercentComplete:](v36, "setPercentComplete:");
    v14 = objc_msgSend(location[0], "timeRemaining");
    -[BFFBackupDeviceController setTimeRemaining:](v36, "setTimeRemaining:", (double)(unint64_t)v14);
    v15 = -[BFFBackupDeviceController delegate](v36, "delegate");
    -[BFFBackupDeviceController percentComplete](v36, "percentComplete");
    v17 = v16;
    -[BFFBackupDeviceController timeRemaining](v36, "timeRemaining");
    -[BFFBackupDeviceControllerDelegate backupProgress:estimatedTimeRemaining:](v15, "backupProgress:estimatedTimeRemaining:", (unint64_t)v18, v17);

  }
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  NSError *v2;
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  BFFBackupDeviceController *v10;

  v10 = self;
  v9[1] = (id)a2;
  if (-[BFFBackupDeviceController isBackingUp](self, "isBackingUp"))
  {
    -[BFFBackupDeviceController setBackingUp:](v10, "setBackingUp:", 0);
    -[BFFBackupDeviceController setBackupFinished:](v10, "setBackupFinished:", 1);
    -[BFFBackupDeviceController setBackupStateUnknown:](v10, "setBackupStateUnknown:", 1);
    v2 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BFFBackupDeviceErrorDomain"), -1, 0);
    -[BFFBackupDeviceController setError:](v10, "setError:", v2);

    v3 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_10019AB4C;
    v8 = &unk_100280730;
    v9[0] = v10;
    dispatch_async(v3, &block);

    objc_storeStrong(v9, 0);
  }
}

- (BFFBackupDeviceControllerDelegate)delegate
{
  return (BFFBackupDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isBackingUp
{
  return self->_backingUp;
}

- (void)setBackingUp:(BOOL)a3
{
  self->_backingUp = a3;
}

- (BOOL)backupFinished
{
  return self->_backupFinished;
}

- (void)setBackupFinished:(BOOL)a3
{
  self->_backupFinished = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSDate)completionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)backupStateUnknown
{
  return self->_backupStateUnknown;
}

- (void)setBackupStateUnknown:(BOOL)a3
{
  self->_backupStateUnknown = a3;
}

- (NSString)backingUpDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBackingUpDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)backingUpDeviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackingUpDeviceUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProximitySetupController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_backingUpDeviceUUID, 0);
  objc_storeStrong((id *)&self->_backingUpDeviceName, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
