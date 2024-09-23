@implementation BuddyAppleIDLinkView

- (BuddyAppleIDLinkView)initWithFrame:(CGRect)a3
{
  UIButton *v3;
  void *v4;
  UIFont *v5;
  id v6;
  id v7;
  id v8;
  BuddyAppleIDLinkView *v9;
  objc_super v11;
  SEL v12;
  id location;
  CGRect v14;

  v14 = a3;
  v12 = a2;
  location = 0;
  v11.receiver = self;
  v11.super_class = (Class)BuddyAppleIDLinkView;
  location = -[BuddyAppleIDLinkView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v4 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v3;

    v5 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    v6 = objc_msgSend(*((id *)location + 1), "titleLabel");
    objc_msgSend(v6, "setFont:", v5);

    v7 = objc_msgSend(*((id *)location + 1), "titleLabel");
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = objc_msgSend(*((id *)location + 1), "titleLabel");
    objc_msgSend(v8, "setTextAlignment:", 1);

    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 1));
  }
  v9 = (BuddyAppleIDLinkView *)location;
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)layoutSubviews
{
  double v2;
  UILabel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[BuddyAppleIDLinkView bounds](self, "bounds");
  v11 = v2;
  v3 = -[UIButton titleLabel](self->_linkButton, "titleLabel");
  sub_100146A7C();
  -[UILabel sizeThatFits:](v3, "sizeThatFits:", v4, v5);
  v9 = v6;
  v10 = v7;

  -[UIButton frame](self->_linkButton, "frame");
  v8 = UIRoundToViewScale(0, (v11 - v9) / 2.0);
  -[UIButton setFrame:](self->_linkButton, "setFrame:", v8, self->_buttonTopPadding, v9, v10, *(_QWORD *)&v8, *(_QWORD *)&self->_buttonTopPadding, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v8, *(_QWORD *)&self->_buttonTopPadding, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v8, *(_QWORD *)&self->_buttonTopPadding);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UILabel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  CGSize result;

  v3 = -[UIButton titleLabel](self->_linkButton, "titleLabel");
  sub_100146A7C();
  -[UILabel sizeThatFits:](v3, "sizeThatFits:", v4, v5, *(_QWORD *)&v4, *(_QWORD *)&v5);
  v11 = v6;
  v12 = v7;

  v8 = v11;
  v9 = v12 + self->_buttonTopPadding;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (double)buttonTopPadding
{
  return self->_buttonTopPadding;
}

- (void)setButtonTopPadding:(double)a3
{
  self->_buttonTopPadding = a3;
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_sidePadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
