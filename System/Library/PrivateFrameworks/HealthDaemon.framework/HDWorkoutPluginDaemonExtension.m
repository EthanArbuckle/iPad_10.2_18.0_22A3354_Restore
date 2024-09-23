@implementation HDWorkoutPluginDaemonExtension

- (HDWorkoutPluginDaemonExtension)initWithDaemon:(id)a3
{
  id v4;
  HDWorkoutPluginDaemonExtension *v5;
  HDWorkoutPluginDaemonExtension *v6;
  HDAlertSuppressor *v7;
  HDAlertSuppressor *alertSuppressor;
  HDAppLauncher *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HDAppLauncher *appLauncher;
  HDBackgroundWorkoutRunner *v14;
  HDBackgroundWorkoutRunner *backgroundWorkoutRunner;
  HDCarouselServicesManager *v16;
  HDCarouselServicesManager *carouselServicesManager;
  HDCoreMotionWorkoutInterface *v18;
  HDCoreMotionWorkoutInterface *coreMotionWorkoutInterface;
  HDHeartRateRecoveryManager *v20;
  HDHeartRateRecoveryManager *heartRateRecoveryManager;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HDWorkoutPluginDaemonExtension;
  v5 = -[HDWorkoutPluginDaemonExtension init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = -[HDAlertSuppressor initWithDaemon:]([HDAlertSuppressor alloc], "initWithDaemon:", v4);
    alertSuppressor = v6->_alertSuppressor;
    v6->_alertSuppressor = v7;

    v9 = [HDAppLauncher alloc];
    objc_msgSend(v4, "processStateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23170], "hd_defaultService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HDAppLauncher initWithProcessStateManager:openApplicationService:](v9, "initWithProcessStateManager:openApplicationService:", v10, v11);
    appLauncher = v6->_appLauncher;
    v6->_appLauncher = (HDAppLauncher *)v12;

    v14 = -[HDBackgroundWorkoutRunner initWithDaemon:]([HDBackgroundWorkoutRunner alloc], "initWithDaemon:", v4);
    backgroundWorkoutRunner = v6->_backgroundWorkoutRunner;
    v6->_backgroundWorkoutRunner = v14;

    v16 = objc_alloc_init(HDCarouselServicesManager);
    carouselServicesManager = v6->_carouselServicesManager;
    v6->_carouselServicesManager = v16;

    v18 = objc_alloc_init(HDCoreMotionWorkoutInterface);
    coreMotionWorkoutInterface = v6->_coreMotionWorkoutInterface;
    v6->_coreMotionWorkoutInterface = v18;

    v20 = objc_alloc_init(HDHeartRateRecoveryManager);
    heartRateRecoveryManager = v6->_heartRateRecoveryManager;
    v6->_heartRateRecoveryManager = v20;

  }
  return v6;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HDAlertSuppressor)alertSuppressor
{
  return self->_alertSuppressor;
}

- (HDAppLauncher)appLauncher
{
  return self->_appLauncher;
}

- (HDBackgroundWorkoutRunner)backgroundWorkoutRunner
{
  return self->_backgroundWorkoutRunner;
}

- (HDCarouselServicesManager)carouselServicesManager
{
  return self->_carouselServicesManager;
}

- (HDCoreMotionWorkoutInterface)coreMotionWorkoutInterface
{
  return self->_coreMotionWorkoutInterface;
}

- (HDHeartRateRecoveryManager)heartRateRecoveryManager
{
  return self->_heartRateRecoveryManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateRecoveryManager, 0);
  objc_storeStrong((id *)&self->_coreMotionWorkoutInterface, 0);
  objc_storeStrong((id *)&self->_carouselServicesManager, 0);
  objc_storeStrong((id *)&self->_backgroundWorkoutRunner, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_alertSuppressor, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
