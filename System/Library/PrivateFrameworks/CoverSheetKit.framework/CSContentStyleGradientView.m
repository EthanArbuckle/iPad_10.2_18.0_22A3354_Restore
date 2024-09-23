@implementation CSContentStyleGradientView

- (CSContentStyleGradientView)initWithFrame:(CGRect)a3
{
  CSContentStyleGradientView *v3;
  CSContentStyleGradientView *v4;
  uint64_t v5;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v7;
  void *v8;
  void *v9;
  CAGradientLayer *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSContentStyleGradientView;
  v3 = -[CSContentStyleGradientView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CSContentStyleGradientView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v5 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v5;

    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.5, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 0.5, 1.0);
    v7 = v4->_gradientLayer;
    -[CSContentStyleGradientView bounds](v4, "bounds");
    -[CAGradientLayer setFrame:](v7, "setFrame:");
    -[CSContentStyleGradientView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v4->_gradientLayer);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", &unk_1E55F0848, CFSTR("inputRadius"));
    objc_msgSend(v9, "setName:", CFSTR("filters.gaussianBlur.inputRadius"));
    v10 = v4->_gradientLayer;
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setFilters:](v10, "setFilters:", v11);

  }
  return v4;
}

- (void)layoutSubviews
{
  CAGradientLayer *gradientLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSContentStyleGradientView;
  -[CSContentStyleGradientView layoutSubviews](&v4, sel_layoutSubviews);
  gradientLayer = self->_gradientLayer;
  -[CSContentStyleGradientView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
}

- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v10)
    -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v10);
  if (v8)
    -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v8);
  if (v9)
    -[CAGradientLayer setType:](self->_gradientLayer, "setType:", v9);

}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", a3.x, a3.y);
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", x, y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
