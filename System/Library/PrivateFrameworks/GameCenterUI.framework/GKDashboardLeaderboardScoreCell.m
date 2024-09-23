@implementation GKDashboardLeaderboardScoreCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 58.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (id)lowRankNib
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkNibWithBaseName:", CFSTR("GKDashboardLeaderboardScoreLowRankCell"));
}

+ (id)highRankNib
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkNibWithBaseName:", CFSTR("GKDashboardLeaderboardScoreHighRankCell"));
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardLeaderboardScoreCell;
  -[GKRectShadowCell awakeFromNib](&v3, sel_awakeFromNib);
  -[GKDashboardPlayerPhotoView setUseDarkerPlaceholder:](self->_playerView, "setUseDarkerPlaceholder:", 1);
  -[GKDashboardPlayerPhotoView setAvatarSize:](self->_playerView, "setAvatarSize:", 0x10000);
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_playerView;
}

- (void)setScore:(id)a3
{
  GKScore *v5;

  v5 = (GKScore *)a3;
  if (self->_score != v5)
  {
    objc_storeStrong((id *)&self->_score, a3);
    -[GKDashboardLeaderboardScoreCell setupForScore:](self, "setupForScore:", v5);
  }

}

- (void)setupForScore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "player");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_monogramColorView, "setHidden:", 0);
  -[GKDashboardPlayerPhotoView setPlayer:](self->_playerView, "setPlayer:", v8);
  objc_msgSend(v8, "displayNameWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v5);

  objc_msgSend(v4, "rank");
  GKFormattedStringWithGroupingFromInteger();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_rankLabel, "setText:", v6);

  objc_msgSend(v4, "formattedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_scoreLabel, "setText:", v7);
}

- (void)setLinesVisible:(BOOL)a3
{
  _BOOL8 v4;

  v4 = !a3;
  -[UIView setHidden:](self->_topLine, "setHidden:", v4);
  -[UIView setHidden:](self->_bottomLine, "setHidden:", v4);
}

- (BOOL)linesVisible
{
  if (-[UIView isHidden](self->_topLine, "isHidden"))
    return 0;
  else
    return !-[UIView isHidden](self->_bottomLine, "isHidden");
}

- (GKScore)score
{
  return self->_score;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerPhotoView *)a3;
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, a3);
}

- (UILabel)rankLabel
{
  return self->_rankLabel;
}

- (void)setRankLabel:(id)a3
{
  self->_rankLabel = (UILabel *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)scoreLabel
{
  return self->_scoreLabel;
}

- (void)setScoreLabel:(id)a3
{
  self->_scoreLabel = (UILabel *)a3;
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
  self->_topLine = (UIView *)a3;
}

- (UIView)bottomLine
{
  return self->_bottomLine;
}

- (void)setBottomLine:(id)a3
{
  self->_bottomLine = (UIView *)a3;
}

- (UIView)monogramColorView
{
  return self->_monogramColorView;
}

- (void)setMonogramColorView:(id)a3
{
  self->_monogramColorView = (UIView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

@end
