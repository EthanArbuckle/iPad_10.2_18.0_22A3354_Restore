@implementation HDHeartDaemonExtension

- (HDHeartDaemonExtension)initWithHealthDaemon:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  id v6;
  id v7;
  HDHeartDaemonExtension *v8;
  HDHeartDaemonExtension *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHeartDaemonExtension;
  v8 = -[HDHeartDaemonExtension init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_healthDaemon, v6);
    objc_storeStrong((id *)&v9->_heartNotificationsUserDefaults, a4);
    objc_msgSend(v6, "registerDaemonReadyObserver:queue:", v9, 0);
  }

  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "postInstallUpdateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerUpdateTaskHandler:queue:", self, 0);

}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  id v4;

  HDMigrateHeartRateNotificationsUserDefaultsIfNecessary(self->_heartNotificationsUserDefaults);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    HKSynchronizeNanoPreferencesUserDefaults();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_destroyWeak((id *)&self->_healthDaemon);
}

@end
