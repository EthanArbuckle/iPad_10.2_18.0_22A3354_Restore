@implementation AVPresentationContainerViewAppearanceProxy

- (void)setCornerCurve:(id)a3
{
  objc_storeStrong((id *)&self->_cornerCurve, a3);
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIView)actualView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_actualView);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setActualView:(id)a3
{
  UIView **p_actualView;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  p_actualView = &self->_actualView;
  v13 = a3;
  objc_storeWeak((id *)p_actualView, v13);
  v5 = -[AVPresentationContainerViewAppearanceProxy maskedCorners](self, "maskedCorners");
  objc_msgSend(v13, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", v5);

  -[AVPresentationContainerViewAppearanceProxy cornerCurve](self, "cornerCurve");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", v7);

  -[AVPresentationContainerViewAppearanceProxy cornerRadius](self, "cornerRadius");
  v10 = v9;
  objc_msgSend(v13, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  -[AVPresentationContainerViewAppearanceProxy backgroundColor](self, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  objc_msgSend(v13, "setClipsToBounds:", -[AVPresentationContainerViewAppearanceProxy clipsToBounds](self, "clipsToBounds"));
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setClipsToBounds:(BOOL)a3
{
  self->_clipsToBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_destroyWeak((id *)&self->_actualView);
}

@end
