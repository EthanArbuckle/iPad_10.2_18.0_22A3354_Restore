@implementation FeaturesDaemon

void __32__FeaturesDaemon_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (void)start
{
  id v2;

  -[FeaturesDaemon controller](self, "controller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (FeaturesDaemon)init
{
  FeaturesDaemon *v2;
  uint64_t v3;
  DaemonController *controller;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FeaturesDaemon;
  v2 = -[FeaturesDaemon init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    controller = v2->_controller;
    v2->_controller = (DaemonController *)v3;

  }
  return v2;
}

- (DaemonController)controller
{
  return self->_controller;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
