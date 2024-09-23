@implementation SSSOccludingCoveringView

- (SSSOccludingCoveringView)initWithFrame:(CGRect)a3
{
  SSSOccludingCoveringView *v3;
  UIView *v4;
  UIView *backgroundColorView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSOccludingCoveringView;
  v3 = -[SSSOccludingCoveringView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_opt_new(UIView);
  backgroundColorView = v3->_backgroundColorView;
  v3->_backgroundColorView = v4;

  -[SSSOccludingCoveringView addSubview:](v3, "addSubview:", v3->_backgroundColorView);
  return v3;
}

- (void)layoutSubviews
{
  id v3;

  -[SSSOccludingCoveringView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundColorView, "setFrame:");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.56));
  -[UIView setBackgroundColor:](self->_backgroundColorView, "setBackgroundColor:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
}

@end
