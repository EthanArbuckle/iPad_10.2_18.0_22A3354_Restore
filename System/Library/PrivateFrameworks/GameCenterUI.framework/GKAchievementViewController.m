@implementation GKAchievementViewController

- (GKAchievementViewController)init
{
  GKAchievementViewController *v2;
  GKAchievementViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKAchievementViewController;
  v2 = -[GKGameCenterViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKGameCenterViewController setViewState:](v2, "setViewState:", 1);
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearResourceCache");

  v4.receiver = self;
  v4.super_class = (Class)GKAchievementViewController;
  -[GKGameCenterViewController dealloc](&v4, sel_dealloc);
}

- (void)notifyDelegateOnWillFinish
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_achievementDelegate);
  -[GKGameCenterViewController gameCenterDelegate](self, "gameCenterDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = WeakRetained;
LABEL_7:
    objc_msgSend(v5, "achievementViewControllerDidFinish:", self);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GKAchievementViewController;
      -[GKGameCenterViewController notifyDelegateOnWillFinish](&v6, sel_notifyDelegateOnWillFinish);
      goto LABEL_8;
    }
    v5 = v4;
    goto LABEL_7;
  }
  objc_msgSend(WeakRetained, "gameCenterViewControllerDidFinish:", self);
LABEL_8:

}

- (id)achievementDelegate
{
  return objc_loadWeakRetained((id *)&self->_achievementDelegate);
}

- (void)setAchievementDelegate:(id)achievementDelegate
{
  objc_storeWeak((id *)&self->_achievementDelegate, achievementDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_achievementDelegate);
}

@end
