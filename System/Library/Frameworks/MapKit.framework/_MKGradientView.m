@implementation _MKGradientView

- (_MKGradientView)initWithFrame:(CGRect)a3
{
  _MKGradientView *v3;
  _MKGradientView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKGradientView;
  v3 = -[_MKGradientView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_MKGradientView _setup](v3, "_setup");
  return v4;
}

- (_MKGradientView)initWithCoder:(id)a3
{
  _MKGradientView *v3;
  _MKGradientView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKGradientView;
  v3 = -[_MKGradientView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_MKGradientView _setup](v3, "_setup");
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setup
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__transparencyStatusDidChange, *MEMORY[0x1E0CEB098], 0);

  self->_shouldReduceTransparency = UIAccessibilityIsReduceTransparencyEnabled();
  -[_MKGradientView gradientLayer](self, "gradientLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPoint");
  self->_startPoint.x = v5;
  self->_startPoint.y = v6;

  -[_MKGradientView gradientLayer](self, "gradientLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endPoint");
  self->_endPoint.x = v8;
  self->_endPoint.y = v9;

  -[_MKGradientView _update](self, "_update");
}

- (void)setShouldReduceTransparency:(BOOL)a3
{
  if (self->_shouldReduceTransparency != a3)
  {
    self->_shouldReduceTransparency = a3;
    -[_MKGradientView _update](self, "_update");
  }
}

- (UIColor)accessibilityColor
{
  UIColor *accessibilityColor;
  UIColor *v4;
  UIColor *v5;

  accessibilityColor = self->_accessibilityColor;
  if (!accessibilityColor)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accessibilityColor;
    self->_accessibilityColor = v4;

    accessibilityColor = self->_accessibilityColor;
  }
  return accessibilityColor;
}

- (void)setAccessibilityColor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  UIColor *v8;
  UIColor *accessibilityColor;
  _BOOL4 v10;
  id v11;

  v4 = a3;
  v5 = self->_accessibilityColor;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v11 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)objc_msgSend(v11, "copy");
      accessibilityColor = self->_accessibilityColor;
      self->_accessibilityColor = v8;

      v10 = -[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency");
      v6 = (unint64_t)v11;
      if (v10)
      {
        -[_MKGradientView _update](self, "_update");
        v6 = (unint64_t)v11;
      }
    }
  }

}

- (void)setColors:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  NSArray *v8;
  NSArray *colors;
  BOOL v10;
  id v11;

  v4 = a3;
  v5 = self->_colors;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v11 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)objc_msgSend(v11, "copy");
      colors = self->_colors;
      self->_colors = v8;

      v10 = -[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency");
      v6 = (unint64_t)v11;
      if (!v10)
      {
        -[_MKGradientView _update](self, "_update");
        v6 = (unint64_t)v11;
      }
    }
  }

}

- (void)setLocations:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  NSArray *v8;
  NSArray *locations;
  BOOL v10;
  id v11;

  v4 = a3;
  v5 = self->_locations;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v11 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)objc_msgSend(v11, "copy");
      locations = self->_locations;
      self->_locations = v8;

      v10 = -[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency");
      v6 = (unint64_t)v11;
      if (!v10)
      {
        -[_MKGradientView _update](self, "_update");
        v6 = (unint64_t)v11;
      }
    }
  }

}

- (void)setStartPoint:(CGPoint)a3
{
  if (self->_startPoint.x != a3.x || self->_startPoint.y != a3.y)
  {
    self->_startPoint = a3;
    if (!-[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency"))
      -[_MKGradientView _update](self, "_update");
  }
}

- (void)setEndPoint:(CGPoint)a3
{
  if (self->_endPoint.x != a3.x || self->_endPoint.y != a3.y)
  {
    self->_endPoint = a3;
    if (!-[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency"))
      -[_MKGradientView _update](self, "_update");
  }
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  double x;
  double y;
  void *v18;
  double v19;
  double v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (-[_MKGradientView shouldReduceTransparency](self, "shouldReduceTransparency"))
  {
    -[_MKGradientView accessibilityColor](self, "accessibilityColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v3;
    -[_MKGradientView accessibilityColor](self, "accessibilityColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKGradientView gradientLayer](self, "gradientLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocations:", 0);
  }
  else
  {
    -[_MKGradientView colors](self, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKGradientView locations](self, "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKGradientView gradientLayer](self, "gradientLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocations:", v6);

  }
  v8 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13));
        objc_msgSend(v8, "addObject:", objc_msgSend(v14, "CGColor", (_QWORD)v22));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[_MKGradientView gradientLayer](self, "gradientLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColors:", v8);

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  -[_MKGradientView gradientLayer](self, "gradientLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStartPoint:", x, y);

  v19 = self->_endPoint.x;
  v20 = self->_endPoint.y;
  -[_MKGradientView gradientLayer](self, "gradientLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEndPoint:", v19, v20);

}

- (void)_transparencyStatusDidChange
{
  -[_MKGradientView setShouldReduceTransparency:](self, "setShouldReduceTransparency:", UIAccessibilityIsReduceTransparencyEnabled());
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)shouldReduceTransparency
{
  return self->_shouldReduceTransparency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_accessibilityColor, 0);
}

@end
