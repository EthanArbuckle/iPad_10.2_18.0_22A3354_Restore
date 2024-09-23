@implementation GKChallengeListViewSectionHeader

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKChallengeListViewSectionHeader;
  -[GKChallengeListViewSectionHeader awakeFromNib](&v5, sel_awakeFromNib);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_secondaryLabelTapped_);
  -[GKChallengeListViewSectionHeader setSecondaryLabelTapGesture:](self, "setSecondaryLabelTapGesture:", v3);
  -[GKChallengeListViewSectionHeader secondaryLabel](self, "secondaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)secondaryLabelTapped:(id)a3
{
  void (**v3)(void);

  -[GKChallengeListViewSectionHeader secondaryLabelTapHandler](self, "secondaryLabelTapHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_trailingConstraint);
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_leadingConstraint);
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_leadingConstraint, a3);
}

- (BOOL)wantsSecondaryLabel
{
  return self->_wantsSecondaryLabel;
}

- (void)setWantsSecondaryLabel:(BOOL)a3
{
  self->_wantsSecondaryLabel = a3;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (id)secondaryLabelTapHandler
{
  return self->_secondaryLabelTapHandler;
}

- (void)setSecondaryLabelTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (UITapGestureRecognizer)secondaryLabelTapGesture
{
  return self->_secondaryLabelTapGesture;
}

- (void)setSecondaryLabelTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelTapGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelTapGesture, 0);
  objc_storeStrong(&self->_secondaryLabelTapHandler, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_destroyWeak((id *)&self->_leadingConstraint);
  objc_destroyWeak((id *)&self->_trailingConstraint);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
