@implementation MUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setGradientColors:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_17);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColors:", v5);

}

uint64_t __37__MUIGradientView_setGradientColors___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (NSArray)gradientColors
{
  void *v2;
  void *v3;
  void *v4;

  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_map:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __33__MUIGradientView_gradientColors__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", a2);
}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocations:", v4);

}

- (NSArray)locations
{
  void *v2;
  void *v3;

  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartPoint:", x, y);

}

- (CGPoint)startPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndPoint:", x, y);

}

- (CGPoint)endPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MUIGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
