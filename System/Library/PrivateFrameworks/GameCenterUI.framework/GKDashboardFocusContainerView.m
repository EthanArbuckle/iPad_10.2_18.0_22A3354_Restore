@implementation GKDashboardFocusContainerView

- (BOOL)canBecomeFocused
{
  return -[UIView canBecomeFocused](self->_focusView, "canBecomeFocused");
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_focusView)
  {
    v4[0] = self->_focusView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
  self->_focusView = (UIView *)a3;
}

@end
