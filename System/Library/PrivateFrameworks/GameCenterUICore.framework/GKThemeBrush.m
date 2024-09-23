@implementation GKThemeBrush

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKThemeBrush;
  v4 = -[GKBrush copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[GKThemeBrush theme](self, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTheme:", v5);

  return v4;
}

- (GKThemeBrush)initWithTheme:(id)a3
{
  id v4;
  GKThemeBrush *v5;
  GKThemeBrush *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKThemeBrush;
  v5 = -[GKThemeBrush init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKThemeBrush setTheme:](v5, "setTheme:", v4);

  return v6;
}

- (GKUITheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
}

@end
