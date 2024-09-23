@implementation LPPlaceholderPlayButtonControl

- (LPPlaceholderPlayButtonControl)initWithStyle:(id)a3 theme:(id)a4
{
  id v6;
  id v7;
  LPPlaceholderPlayButtonControl *v8;
  LPPlaceholderPlayButtonControl *v9;
  LPPlaceholderPlayButtonControl *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPPlaceholderPlayButtonControl;
  v8 = -[LPPlayButtonControl initWithStyle:theme:](&v12, sel_initWithStyle_theme_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[LPPlaceholderPlayButtonControl setHidden:](v8, "setHidden:", 1);
    -[LPPlaceholderPlayButtonControl setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    v10 = v9;
  }

  return v9;
}

@end
