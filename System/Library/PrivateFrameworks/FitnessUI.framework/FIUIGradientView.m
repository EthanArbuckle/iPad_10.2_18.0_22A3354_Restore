@implementation FIUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (FIUIGradientView)init
{
  FIUIGradientView *v2;
  FIUIShapeView *v3;
  FIUIShapeView *maskView;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUIGradientView;
  v2 = -[FIUIGradientView init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FIUIShapeView);
    maskView = v2->_maskView;
    v2->_maskView = v3;

    -[FIUIGradientView gradientLayer](v2, "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIShapeView layer](v2->_maskView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", v6);

  }
  return v2;
}

- (void)layoutSubviews
{
  FIUIShapeView *maskView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIGradientView;
  -[FIUIGradientView layoutSubviews](&v4, sel_layoutSubviews);
  maskView = self->_maskView;
  -[FIUIGradientView bounds](self, "bounds");
  -[FIUIShapeView setFrame:](maskView, "setFrame:");
}

- (void)setMask:(id)a3
{
  -[FIUIShapeView setPath:](self->_maskView, "setPath:", a3);
}

- (void)setColors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FIUIGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColors:", v4);

}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FIUIGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocations:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
}

@end
