@implementation HUControlPanelCell

- (NSSet)allControlViews
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUControlPanelCell.m"), 25, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUControlPanelCell allControlViews]", objc_opt_class());

  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  -[HUControlPanelCell minHeightConstraint](self, "minHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUControlPanelCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUControlPanelCell setMinHeightConstraint:](self, "setMinHeightConstraint:", v6);

    -[HUControlPanelCell minHeightConstraint](self, "minHeightConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1148829696;
    objc_msgSend(v7, "setPriority:", v8);

    -[HUControlPanelCell minHeightConstraint](self, "minHeightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

  }
  v10.receiver = self;
  v10.super_class = (Class)HUControlPanelCell;
  -[HUControlPanelCell updateConstraints](&v10, sel_updateConstraints);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSLayoutConstraint)minHeightConstraint
{
  return self->_minHeightConstraint;
}

- (void)setMinHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
