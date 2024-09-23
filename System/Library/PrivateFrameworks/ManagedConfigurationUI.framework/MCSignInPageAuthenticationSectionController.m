@implementation MCSignInPageAuthenticationSectionController

- (void)registerCellClassWithTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  -[MCSignInPageAuthenticationSectionController inlineSignInViewController](self, "inlineSignInViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  -[MCSignInPageAuthenticationSectionController inlineSignInViewController](self, "inlineSignInViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[MCSignInPageAuthenticationSectionController setAuthSectionHeight:](self, "setAuthSectionHeight:", CGRectGetHeight(v8));

}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)titleForHeader
{
  return 0;
}

- (double)heightForHeader
{
  return 10.0;
}

- (MCSignInPageAuthenticationCell)cell
{
  MCSignInPageAuthenticationCell *cell;
  MCSignInPageAuthenticationCell *v4;
  void *v5;
  void *v6;
  MCSignInPageAuthenticationCell *v7;
  MCSignInPageAuthenticationCell *v8;

  cell = self->_cell;
  if (!cell)
  {
    v4 = [MCSignInPageAuthenticationCell alloc];
    -[MCSignInPageAuthenticationSectionController inlineSignInViewController](self, "inlineSignInViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCSignInPageAuthenticationCell initWithAuthView:](v4, "initWithAuthView:", v6);
    v8 = self->_cell;
    self->_cell = v7;

    cell = self->_cell;
  }
  return cell;
}

- (AKInlineSignInViewController)inlineSignInViewController
{
  AKInlineSignInViewController *inlineSignInViewController;
  void *v4;
  AKInlineSignInViewController *v5;

  inlineSignInViewController = self->_inlineSignInViewController;
  if (!inlineSignInViewController)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setWantsAuthenticationProgress:", 1);
    objc_msgSend(v4, "setSecondaryButtonTitle:", 0);
    objc_msgSend(v4, "setTertiaryButtonTitle:", 0);
    v5 = self->_inlineSignInViewController;
    self->_inlineSignInViewController = (AKInlineSignInViewController *)v4;

    inlineSignInViewController = self->_inlineSignInViewController;
  }
  return inlineSignInViewController;
}

- (void)setInlineSignInViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSignInViewController, a3);
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (double)authSectionHeight
{
  return self->_authSectionHeight;
}

- (void)setAuthSectionHeight:(double)a3
{
  self->_authSectionHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_inlineSignInViewController, 0);
}

@end
