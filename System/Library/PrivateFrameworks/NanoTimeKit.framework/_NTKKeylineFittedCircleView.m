@implementation _NTKKeylineFittedCircleView

- (_NTKKeylineFittedCircleView)initWithFrame:(CGRect)a3
{
  _NTKKeylineFittedCircleView *v3;
  _NTKKeylineFittedCircleView *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NTKKeylineFittedCircleView;
  v3 = -[CLKUIColoringImageView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_NTKKeylineFittedCircleView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", 1.5);

    objc_initWeak(&location, v4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45___NTKKeylineFittedCircleView_initWithFrame___block_invoke;
    v7[3] = &unk_1E6BD0F98;
    objc_copyWeak(&v8, &location);
    -[_NTKKeylineImageView setColorizationBlock:](v4, "setColorizationBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NTKKeylineFittedCircleView;
  -[_NTKKeylineFittedCircleView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_NTKKeylineFittedCircleView bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  -[_NTKKeylineFittedCircleView _setCornerRadius:](self, "_setCornerRadius:", v6 * 0.5);
}

@end
