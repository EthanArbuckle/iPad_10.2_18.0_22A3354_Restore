@implementation GKLeaderboardViewController

- (GKLeaderboardViewController)init
{
  GKLeaderboardViewController *v2;
  GKLeaderboardViewController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardViewController;
  v2 = -[GKGameCenterViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GKGameCenterViewController setViewState:](v2, "setViewState:", 0);
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameCenterViewController setLeaderboardIdentifier:](v3, "setLeaderboardIdentifier:", v5);

  }
  return v3;
}

- (GKLeaderboardTimeScope)timeScope
{
  return 2;
}

- (void)notifyDelegateOnWillFinish
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_leaderboardDelegate);
  -[GKGameCenterViewController gameCenterDelegate](self, "gameCenterDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = WeakRetained;
LABEL_7:
    objc_msgSend(v5, "leaderboardViewControllerDidFinish:", self);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GKLeaderboardViewController;
      -[GKGameCenterViewController notifyDelegateOnWillFinish](&v6, sel_notifyDelegateOnWillFinish);
      goto LABEL_8;
    }
    v5 = v4;
    goto LABEL_7;
  }
  objc_msgSend(WeakRetained, "gameCenterViewControllerDidFinish:", self);
LABEL_8:

}

- (id)leaderboardDelegate
{
  return objc_loadWeakRetained((id *)&self->_leaderboardDelegate);
}

- (void)setLeaderboardDelegate:(id)leaderboardDelegate
{
  objc_storeWeak((id *)&self->_leaderboardDelegate, leaderboardDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_leaderboardDelegate);
}

@end
