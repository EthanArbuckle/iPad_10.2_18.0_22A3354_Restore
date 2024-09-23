@implementation BuddyProximityAutomatedDeviceEnrollmentController

- (BuddyProximityAutomatedDeviceEnrollmentController)init
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v2;
  void *v3;
  id v4;
  void *v5;
  BuddyProximityAutomatedDeviceEnrollmentController *v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentController;
  location = -[BuddyProximityAutomatedDeviceEnrollmentController init](&v8, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_opt_new(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient);
    v3 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v2;

    objc_msgSend(*((id *)location + 4), "setDelegate:", location);
    v4 = +[BuddyNonInteractiveDeviceActivator activatorUsingWiFi](BuddyNonInteractiveDeviceActivator, "activatorUsingWiFi");
    v5 = (void *)*((_QWORD *)location + 5);
    *((_QWORD *)location + 5) = v4;

  }
  v6 = (BuddyProximityAutomatedDeviceEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)beginAdvertising
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v2;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentController daemonClient](self, "daemonClient", a2, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient beginAdvertisingProximityAutomatedDeviceEnrollment](v2, "beginAdvertisingProximityAutomatedDeviceEnrollment");

}

- (void)endAdvertising
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v2;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentController daemonClient](self, "daemonClient", a2, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient endAdvertisingProximityAutomatedDeviceEnrollment](v2, "endAdvertisingProximityAutomatedDeviceEnrollment");

}

- (void)shutdownButtonTapped
{
  BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *v2;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentController daemonClient](self, "daemonClient", a2, self);
  -[BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient shutdown](v2, "shutdown");

}

- (void)dismissProximityPinCodeWithError:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyProximityAutomatedDeviceEnrollmentController *v9;
  id v10;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100175630;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)displayProximityPinCode:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyProximityAutomatedDeviceEnrollmentController *v9;
  id v10;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001758B8;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)configuratorPairingSuccessfulWithViewModel:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyProximityAutomatedDeviceEnrollmentController *v9;
  id v10;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100175B40;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyProximityAutomatedDeviceEnrollmentController *v9;
  id v10;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100175DD4;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchActivationStateWithCompletion:(id)a3
{
  void (**v3)(id, unint64_t);
  BuddyNonInteractiveDeviceActivator *v4;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, unint64_t))location[0];
  v4 = -[BuddyProximityAutomatedDeviceEnrollmentController wifiActivator](v6, "wifiActivator");
  v3[2](v3, -[BuddyNonInteractiveDeviceActivator isActivated](v4, "isActivated"));

  objc_storeStrong(location, 0);
}

- (void)activateUsingWiFiWithCompletion:(id)a3
{
  BuddyNonInteractiveDeviceActivator *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentController wifiActivator](v11, "wifiActivator");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001760BC;
  v8 = &unk_100282410;
  v9 = location[0];
  -[BuddyNonInteractiveDeviceActivator activateWithCompletion:](v3, "activateWithCompletion:", &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)enrollmentCompleteWithViewModel:(id)a3
{
  void *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyProximityAutomatedDeviceEnrollmentController *v9;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyProximityAutomatedDeviceEnrollmentController setCompletionViewModel:](v11, "setCompletionViewModel:", location[0]);
  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001761F4;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)displayShutdownUI
{
  void *v2;
  void **block;
  int v4;
  int v5;
  void (*v6);
  void *v7;
  id v8[2];
  BuddyProximityAutomatedDeviceEnrollmentController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100176434;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (NSString)deviceClass
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
}

- (void)pairingEndedByUser
{
  id location;
  os_log_type_t v3;
  os_log_t oslog;
  SEL aSelector;
  BuddyProximityAutomatedDeviceEnrollmentController *v6;
  uint8_t buf[24];

  v6 = self;
  aSelector = a2;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v3 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    location = NSStringFromSelector(aSelector);
    sub_100039500((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "%{public}@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyProximityAutomatedDeviceEnrollmentController endAdvertising](v6, "endAdvertising");
}

- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)delegate
{
  return (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMTEnrollmentStatusViewModel)currentEnrollmentStatusViewModel
{
  return self->_currentEnrollmentStatusViewModel;
}

- (void)setCurrentEnrollmentStatusViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentEnrollmentStatusViewModel, a3);
}

- (DMTEnrollmentCompletionViewModel)completionViewModel
{
  return self->_completionViewModel;
}

- (void)setCompletionViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_completionViewModel, a3);
}

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)daemonClient
{
  return self->_daemonClient;
}

- (BuddyNonInteractiveDeviceActivator)wifiActivator
{
  return self->_wifiActivator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiActivator, 0);
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_completionViewModel, 0);
  objc_storeStrong((id *)&self->_currentEnrollmentStatusViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
