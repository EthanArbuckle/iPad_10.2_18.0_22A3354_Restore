@implementation LPInertTextView

- (LPInertTextView)init
{
  LPInertTextView *v2;
  LPInertTextView *v3;
  LPInertTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPInertTextView;
  v2 = -[LPInertTextView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[LPInertTextView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    v4 = v3;
  }

  return v3;
}

@end
