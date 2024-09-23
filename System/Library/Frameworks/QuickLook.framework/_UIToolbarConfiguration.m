@implementation _UIToolbarConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setBarStyle:", -[_UIToolbarConfiguration barStyle](self, "barStyle"));
    objc_msgSend(v4, "setTranslucent:", -[_UIToolbarConfiguration isTranslucent](self, "isTranslucent"));
    -[_UIToolbarConfiguration shadowImage](self, "shadowImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowImage:", v5);

    -[_UIToolbarConfiguration backgroundImage](self, "backgroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundImage:", v6);

    -[_UIToolbarConfiguration backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v7);

    -[_UIToolbarConfiguration barTintColor](self, "barTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBarTintColor:", v8);

  }
  return v4;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->_barStyle = a3;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImage, a3);
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_barTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
}

@end
