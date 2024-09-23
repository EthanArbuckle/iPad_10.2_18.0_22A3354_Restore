@implementation GKLeaderboardAddFriendsCell

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKLeaderboardAddFriendsCell;
  -[GKLeaderboardAddFriendsCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (CGSize)preferredLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  GKLeaderboardAddFriendsCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  -[GKLeaderboardAddFriendsCell frame](v5, "frame");
  -[GKLeaderboardAddFriendsCell setFrame:](v5, "setFrame:");
  -[GKLeaderboardAddFriendsCell setNeedsLayout](v5, "setNeedsLayout");
  -[GKLeaderboardAddFriendsCell layoutIfNeeded](v5, "layoutIfNeeded");
  -[GKLeaderboardAddFriendsCell container](v5, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  -[GKLeaderboardAddFriendsCell container](v5, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_6:
      v12 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
  }
  objc_msgSend(v10, "measurementsWithFitting:in:", v5, width, height);
  v12 = v11;
  v14 = v13;

LABEL_7:
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)configureAddFriendsLockupWithMetricsPageId:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  _TtC12GameCenterUI22GKAddFriendsLockupView *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC12GameCenterUI22GKAddFriendsLockupView *v14;

  v6 = a4;
  v7 = a3;
  -[GKLeaderboardAddFriendsCell topLine](self, "topLine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[GKLeaderboardAddFriendsCell clearContainer](self, "clearContainer");
  v9 = -[GKLeaderboardAddFriendsCell friendCount](self, "friendCount") < 1;
  v10 = [_TtC12GameCenterUI22GKAddFriendsLockupView alloc];
  v14 = -[GKAddFriendsLockupView initWithFrame:friendState:metricsPageId:metricsPageType:](v10, "initWithFrame:friendState:metricsPageId:metricsPageType:", v9, v7, CFSTR("leaderboard"), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[GKAddFriendsLockupView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKLeaderboardAddFriendsCell container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v14);

  v12 = (void *)MEMORY[0x1E0CB3718];
  -[GKLeaderboardAddFriendsCell container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v14, v13);

  -[GKAddFriendsLockupView setAddFriendsHandler:](v14, "setAddFriendsHandler:", v6);
}

- (void)configureNoFriendsViewWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[GKLeaderboardAddFriendsCell topLine](self, "topLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[GKLeaderboardAddFriendsCell clearContainer](self, "clearContainer");
  if (-[GKLeaderboardAddFriendsCell friendCount](self, "friendCount") <= 0)
    +[EmptyStateView addFriendsEmptyStateView](_TtC12GameCenterUI14EmptyStateView, "addFriendsEmptyStateView");
  else
    +[EmptyStateView addAdditionalFriendsEmptyStateView](_TtC12GameCenterUI14EmptyStateView, "addAdditionalFriendsEmptyStateView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKLeaderboardAddFriendsCell container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v9);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[GKLeaderboardAddFriendsCell container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v9, v8);

  objc_msgSend(v9, "setButtonActionBlock:", v4);
}

- (void)clearContainer
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardAddFriendsCell container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeFromSuperview", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setLineVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[GKLeaderboardAddFriendsCell topLine](self, "topLine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)lineVisible
{
  void *v2;
  char v3;

  -[GKLeaderboardAddFriendsCell topLine](self, "topLine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (int64_t)friendCount
{
  return self->_friendCount;
}

- (void)setFriendCount:(int64_t)a3
{
  self->_friendCount = a3;
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)addFriendsLockupView
{
  return (_TtC12GameCenterUI22GKAddFriendsLockupView *)objc_loadWeakRetained((id *)&self->_addFriendsLockupView);
}

- (void)setAddFriendsLockupView:(id)a3
{
  objc_storeWeak((id *)&self->_addFriendsLockupView, a3);
}

- (_TtC12GameCenterUI14EmptyStateView)noFriendsView
{
  return (_TtC12GameCenterUI14EmptyStateView *)objc_loadWeakRetained((id *)&self->_noFriendsView);
}

- (void)setNoFriendsView:(id)a3
{
  objc_storeWeak((id *)&self->_noFriendsView, a3);
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
  objc_storeStrong((id *)&self->_topLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_destroyWeak((id *)&self->_noFriendsView);
  objc_destroyWeak((id *)&self->_addFriendsLockupView);
}

@end
