@implementation DOCAddTagViewTextField

- (DOCAddTagViewTextField)initWithFrame:(CGRect)a3
{
  DOCAddTagViewTextField *v3;
  DOCAddTagViewTextField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCAddTagViewTextField;
  v3 = -[DOCAddTagViewTextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DOCAddTagViewTextField setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  -[DOCAddTagViewTextField setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  v4.receiver = self;
  v4.super_class = (Class)DOCAddTagViewTextField;
  return -[DOCAddTagViewTextField becomeFirstResponder](&v4, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCAddTagViewTextField;
  v3 = -[DOCAddTagViewTextField resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3)
    -[DOCAddTagViewTextField setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  return v3;
}

@end
