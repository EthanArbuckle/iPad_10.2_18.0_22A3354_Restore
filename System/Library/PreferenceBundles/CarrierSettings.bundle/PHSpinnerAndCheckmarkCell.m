@implementation PHSpinnerAndCheckmarkCell

- (void)setReallyChecked:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHSpinnerAndCheckmarkCell;
  -[PSTableCell setChecked:](&v4, sel_setChecked_, a3);
  -[PHSpinnerAndCheckmarkCell setLoading:](self, "setLoading:", 0);
  -[PHSpinnerAndCheckmarkCell _removeSpinner](self, "_removeSpinner");
  -[PHSpinnerAndCheckmarkCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setLoading:(BOOL)a3
{
  char v3;
  char v5;
  UIActivityIndicatorView *spinner;
  PHSpinnerAndCheckmarkCell *v7;

  v3 = *((_BYTE *)self + 1208);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    v5 = v3 & 0xFE | a3;
    *((_BYTE *)self + 1208) = v5;
    if (a3)
    {
      spinner = self->_spinner;
      if (!spinner
        || (-[UIActivityIndicatorView superview](spinner, "superview"),
            v7 = (PHSpinnerAndCheckmarkCell *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7 != self))
      {
        -[PHSpinnerAndCheckmarkCell _addSpinner](self, "_addSpinner");
        return;
      }
      v5 = *((_BYTE *)self + 1208);
    }
    if ((v5 & 1) == 0)
      -[PHSpinnerAndCheckmarkCell _removeSpinner](self, "_removeSpinner");
  }
}

- (void)setRow:(int)a3
{
  self->_row = a3;
}

- (void)_addSpinner
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;

  spinner = self->_spinner;
  if (!spinner)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 4);
    v5 = self->_spinner;
    self->_spinner = v4;

    -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
    spinner = self->_spinner;
  }
  -[PHSpinnerAndCheckmarkCell accessoryView](self, "accessoryView");
  v6 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();

  if (spinner != v6)
  {
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[PHSpinnerAndCheckmarkCell setAccessoryView:](self, "setAccessoryView:", self->_spinner);
  }
}

- (void)_removeSpinner
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v4;

  spinner = self->_spinner;
  -[PHSpinnerAndCheckmarkCell accessoryView](self, "accessoryView");
  v4 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();

  if (spinner == v4)
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    -[PHSpinnerAndCheckmarkCell setAccessoryView:](self, "setAccessoryView:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
