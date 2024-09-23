@implementation PKFakeUITapGestureForRequirements

- (BOOL)isEnabled
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  objc_super v8;

  -[PKFakeUITapGestureForRequirements delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKFakeUITapGestureForRequirements delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_scribbleInteractionIsEnabled:", 0);

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKFakeUITapGestureForRequirements;
    return -[PKFakeUITapGestureForRequirements isEnabled](&v8, sel_isEnabled);
  }
}

@end
