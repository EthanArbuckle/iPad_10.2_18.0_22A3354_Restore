@implementation GKPickerSearchTextField

- (BOOL)becomeFirstResponder
{
  BOOL v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKPickerSearchTextField;
  v3 = -[GKPickerSearchTextField becomeFirstResponder](&v8, sel_becomeFirstResponder);
  -[GKPickerSearchTextField delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[GKPickerSearchTextField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchTextFieldDidBecomeFirstResponder:", self);

  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  BOOL v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKPickerSearchTextField;
  v3 = -[GKPickerSearchTextField resignFirstResponder](&v8, sel_resignFirstResponder);
  -[GKPickerSearchTextField delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[GKPickerSearchTextField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchTextFieldDidResignFirstResponder:", self);

  }
  return v3;
}

@end
