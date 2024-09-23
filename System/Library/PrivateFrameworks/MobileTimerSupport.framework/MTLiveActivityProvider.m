@implementation MTLiveActivityProvider

- (MTLiveActivityProvider)init
{
  MTLiveActivityProvider *v2;
  uint64_t v3;
  _TtC18MobileTimerSupport22MTWatchActivityManager *manager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLiveActivityProvider;
  v2 = -[MTLiveActivityProvider init](&v6, sel_init);
  if (v2)
  {
    +[MTWatchActivityManager shared](_TtC18MobileTimerSupport22MTWatchActivityManager, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    manager = v2->_manager;
    v2->_manager = (_TtC18MobileTimerSupport22MTWatchActivityManager *)v3;

  }
  return v2;
}

- (void)startActivityForAlarmID:(id)a3 withFiringDate:(id)a4
{
  -[MTWatchActivityManager startActivityWithAlarmID:firingDate:](self->_manager, "startActivityWithAlarmID:firingDate:", a3, a4);
}

- (void)endActivityForAlarmID:(id)a3
{
  -[MTWatchActivityManager endActivityWithAlarmID:](self->_manager, "endActivityWithAlarmID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
