@implementation CPSButton

- (CPSButton)initWithFrame:(CGRect)a3
{
  CPSButton *v4;
  objc_super v5;
  SEL v6;
  CPSButton *v7;
  CGRect v8;

  v8 = a3;
  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSButton;
  v7 = -[CPSButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
    -[CPUIButton setCpui_delegate:](v7, "setCpui_delegate:", v7);
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  CPSButtonDelegate *v4;
  CPSUtilities *v6;
  CPSButtonDelegate *v7;
  char v8;
  id location[2];
  CPSButton *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = +[CPSUtilities sharedInstance](CPSUtilities, "sharedInstance");
  -[CPSUtilities setLastButtonPressInteractionModel:](v6, "setLastButtonPressInteractionModel:", a4);

  v7 = -[CPSButton delegate](v10, "delegate");
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v4 = -[CPSButton delegate](v10, "delegate");
    -[CPSButtonDelegate didSelectButton:](v4, "didSelectButton:", v10);

  }
  objc_storeStrong(location, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CPSButtonDelegate)delegate
{
  return (CPSButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
