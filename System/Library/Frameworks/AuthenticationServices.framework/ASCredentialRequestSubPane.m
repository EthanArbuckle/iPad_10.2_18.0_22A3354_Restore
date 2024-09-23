@implementation ASCredentialRequestSubPane

- (ASCredentialRequestSubPane)initWithView:(id)a3
{
  id v5;
  ASCredentialRequestSubPane *v6;
  ASCredentialRequestSubPane *v7;
  ASCredentialRequestSubPane *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestSubPane;
  v6 = -[ASCredentialRequestSubPane init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = v7;
  }

  return v7;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  objc_msgSend(a3, "addArrangedSubview:", self->_view, a5);
  -[ASCredentialRequestSubPane setCustomSpacingAfter:](self, "setCustomSpacingAfter:", a4);
}

- (void)setCustomSpacingAfter:(double)a3
{
  id v5;

  if (self->_customSpacingAfter != a3)
  {
    self->_customSpacingAfter = a3;
    -[UIView superview](self->_view, "superview");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setCustomSpacing:afterView:", self->_view, a3);

  }
}

- (UIView)view
{
  return self->_view;
}

- (double)customSpacingAfter
{
  return self->_customSpacingAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
