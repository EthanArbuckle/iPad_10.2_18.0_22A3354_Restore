@implementation HUAssociatedServiceTypeOptionCell

- (void)prepareForReuse
{
  objc_super v3;

  -[HUAssociatedServiceTypeOptionCell setChecked:](self, "setChecked:", 0);
  -[HUAssociatedServiceTypeOptionCell setSuggestion:](self, "setSuggestion:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUAssociatedServiceTypeOptionCell;
  -[HUAssociatedServiceTypeOptionCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;

  self->_checked = a3;
  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[HUAssociatedServiceTypeOptionCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)setSuggestion:(BOOL)a3
{
  void *v4;
  id v5;

  self->_suggestion = a3;
  -[HUAssociatedServiceTypeOptionCell colorForCurrentState](self, "colorForCurrentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAssociatedServiceTypeOptionCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)setDisabled:(BOOL)a3
{
  void *v4;
  id v5;

  self->_disabled = a3;
  -[HUAssociatedServiceTypeOptionCell colorForCurrentState](self, "colorForCurrentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAssociatedServiceTypeOptionCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (id)colorForCurrentState
{
  void *v3;

  if (-[HUAssociatedServiceTypeOptionCell isDisabled](self, "isDisabled")
    || -[HUAssociatedServiceTypeOptionCell isSuggestion](self, "isSuggestion"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

@end
