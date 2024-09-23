@implementation MTSleepModeManager

- (MTSleepModeManager)initWithDelegate:(id)a3
{
  return -[MTSleepModeManager initWithDelegate:isSynchronous:](self, "initWithDelegate:isSynchronous:", a3, 0);
}

- (MTSleepModeManager)initWithDelegate:(id)a3 isSynchronous:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTSleepModeManager;
  return -[MTSleepModeManager init](&v5, sel_init, a3, a4);
}

- (BOOL)isEnabled
{
  return 0;
}

@end
