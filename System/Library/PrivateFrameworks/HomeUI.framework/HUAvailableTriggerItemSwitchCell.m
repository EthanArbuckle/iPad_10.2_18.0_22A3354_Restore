@implementation HUAvailableTriggerItemSwitchCell

- (void)setSwitchHidden:(BOOL)a3
{
  double Width;
  void *v6;
  double MaxX;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  if (self->_switchHidden != a3)
  {
    self->_switchHidden = a3;
    -[HUAvailableTriggerItemSwitchCell frame](self, "frame");
    Width = CGRectGetWidth(v14);
    -[HUIconCell containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    MaxX = CGRectGetMaxX(v15);

    if (a3)
    {
      v8 = vabdd_f64(Width, MaxX);
      -[HUAvailableTriggerItemSwitchCell setAccessoryView:](self, "setAccessoryView:", 0);
      -[HUAvailableTriggerItemSwitchCell setAccessoryType:](self, "setAccessoryType:", 1);
      -[HUAvailableTriggerItemSwitchCell setNeedsLayout](self, "setNeedsLayout");
      -[HUAvailableTriggerItemSwitchCell layoutIfNeeded](self, "layoutIfNeeded");
      -[HUAvailableTriggerItemSwitchCell frame](self, "frame");
      v9 = CGRectGetWidth(v16);
      -[HUIconCell containerView](self, "containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v11 = vabdd_f64(v9, CGRectGetMaxX(v17));

      v12 = vabdd_f64(v8, v11);
    }
    else
    {
      -[HUIconSwitchCell switchView](self, "switchView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAvailableTriggerItemSwitchCell setAccessoryView:](self, "setAccessoryView:", v13);

      -[HUAvailableTriggerItemSwitchCell setAccessoryType:](self, "setAccessoryType:", 0);
      v12 = 0.0;
    }
    -[HUAvailableTriggerItemSwitchCell setReservedSwitchWidth:](self, "setReservedSwitchWidth:", v12);
    -[HUAvailableTriggerItemSwitchCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUAvailableTriggerItemSwitchCell;
  -[HUTitleDescriptionCell updateConstraints](&v9, sel_updateConstraints);
  -[HUAvailableTriggerItemSwitchCell reservedSwitchWidth](self, "reservedSwitchWidth");
  v4 = -v3;
  -[HUTitleDescriptionCell titleTrailingConstraint](self, "titleTrailingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[HUAvailableTriggerItemSwitchCell reservedSwitchWidth](self, "reservedSwitchWidth");
  v7 = -v6;
  -[HUTitleDescriptionCell descriptionTrailingConstraint](self, "descriptionTrailingConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (BOOL)switchIsHidden
{
  return self->_switchHidden;
}

- (double)reservedSwitchWidth
{
  return self->_reservedSwitchWidth;
}

- (void)setReservedSwitchWidth:(double)a3
{
  self->_reservedSwitchWidth = a3;
}

@end
