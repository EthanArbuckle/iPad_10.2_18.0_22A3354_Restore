@implementation SUUICellLayoutView

- (void)layoutSubviews
{
  -[SUUICellLayout layoutSubviews](self->_layout, "layoutSubviews");
}

- (void)setBackgroundColor:(id)a3
{
  SUUICellLayout *layout;
  id v5;
  objc_super v6;

  layout = self->_layout;
  v5 = a3;
  -[SUUICellLayout setBackgroundColor:](layout, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUICellLayoutView;
  -[SUUICellLayoutView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (SUUICellLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
