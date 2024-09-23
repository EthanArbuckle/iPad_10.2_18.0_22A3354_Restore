@implementation NTKEmptyModuleView

- (NTKEmptyModuleView)initWithFrame:(CGRect)a3
{
  NTKEmptyModuleView *v3;
  NTKEmptyModuleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKEmptyModuleView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKEmptyModuleView setHidden:](v3, "setHidden:", 1);
  return v4;
}

@end
